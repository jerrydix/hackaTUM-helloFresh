import { Injectable, Logger, OnModuleInit } from "@nestjs/common";
import { PrismaService } from "@/prisma.service";
import { Duration, IngredientCategory } from "@prisma/client";
import { Buffer } from "buffer";

@Injectable()
export class RecipeService implements OnModuleInit {
  private readonly logger = new Logger(RecipeService.name);
  constructor(private prisma: PrismaService) {}

  async getRecipeById(id: number): Promise<any> {
    return this.prisma.recipe.findUnique({
      where: { id },
      include: {
        steps: {
          include: {
            ingredients: {
              include: {
                type: true,
                instruction: true
              }
            },
            action: true,
            utensils: true
          }
        }
      }
    });
  }

  async getRecipeImageById(id: number): Promise<any> {
    const recipe = await this.prisma.recipe.findUnique({
      where: { id },
      select: { imgUrl: true }
    });
    return recipe?.imgUrl;
  }

  async getRecipeInstructionById(id: number): Promise<any> {
    return this.prisma.instructionStep.findMany({
      where: { recipeId: id },
      include: {
        ingredients: {
          include: {
            type: true,
            instruction: true
          }
        },
        action: true,
        utensils: true
      }
    });
  }

  transformInstructionToText(instruction: any): string {
    let result = '';
    for (const step of instruction) {
      let text = step.action.template;
      const ingredients = step.ingredients.map((i: any) => i.type.name).join(', ');
      const { duration, durationUnit, additionalData } = step;
      let durationData = '';
      if (duration !== Duration.INSTANT) {
        let unit = durationUnit.toLowerCase() + (duration > 1 ? 's' : '');
        durationData = `for ${duration} ${unit}`;
      }

      text = text.replaceAll('[durationData]', durationData);
      text = text.replaceAll('[ingredients]', ingredients);
      for (const key in additionalData) {
        text = text.replaceAll(`[${key}]`, additionalData[key]);
      }
      result += text + '\n';
    }
    return result;
  }

  async init() {
    await this.prisma.ingredient.deleteMany({ where: { id: { gt: -1 } } });
    await this.prisma.instructionStep.deleteMany({ where: { id: { gt: -1 } } });
    await this.prisma.recipe.deleteMany({ where: { id: { gt: -1 } } });
    await this.prisma.ingredientType.deleteMany({ where: { name: { not: '' } } });
    await this.prisma.action.deleteMany({ where: { name: { not: '' } } });

    const fryAction = await this.prisma.action.upsert({
      where: { name: 'FRY' },
      update: {},
      create: { name: 'FRY', template: 'Fry [ingredients] for [durationData].' },
    });

    const eggType = await this.prisma.ingredientType.upsert({
      where: { name: 'egg' },
      update: {},
      create: {
        name: 'egg',
        category: IngredientCategory.DAIRY_AND_EGGS
      },
    });

    const recipe = await this.prisma.recipe.create({
      data: {
        title: 'Fried Eggs',
        imgUrl: 'url_to_image_of_fried_eggs.jpg',
        description: 'Simple and classic fried eggs.',
        unit: 'meal',
        caloriesPerUnit: 92,
        proteinsPerUnit: 6.27,
        carbsPerUnit: 0.4,
        fatsPerUnit: 7.04,
        fiberPerUnit: 0,
        vitamins: {
          'A': '91'
        },
        minerals: {
          'Calcium': '27',
          'Iron': '0.91',
          'Potassium': '68',
        },
        allergyBits: Buffer.from([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0])
      }
    });

    const instructionStep = await this.prisma.instructionStep.create({
      data: {
        actionName: fryAction.name,
        duration: 3,
        durationUnit: Duration.MINUTE,
        recipeId: recipe.id
      }
    });

    await this.prisma.ingredient.create({
      data: {
        ingredientType: eggType.name,
        quantity: 2, // 2 eggs
        unit: 'piece',
        instructionId: instructionStep.id
      }
    });

    this.logger.log(`Created Fried Eggs recipe with id ${recipe.id}.`);
  }

  async onModuleInit() {
    await this.init();
  }
}
