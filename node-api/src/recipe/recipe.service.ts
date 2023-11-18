import { Injectable, Logger, OnModuleInit } from '@nestjs/common';
import { PrismaService } from '@/prisma.service';
import { IngredientCategory } from '@prisma/client';
import { Prisma } from "#/index";

import Decimal = Prisma.Decimal;

@Injectable()
export class RecipeService implements OnModuleInit {
  private readonly logger = new Logger(RecipeService.name);
  constructor(private prisma: PrismaService) {}

  async getRecipeById(id: number) {
    return this.prisma.recipe.findUnique({
      where: { id },
      include: { ingredients: true }
    });
  }

  async getRecipeTotalPrice(id: number, made: boolean): Promise<Decimal | null> {
    let cost = (await this.prisma.ingredient.aggregate({
      where: { recipes: { some: { id } } },
      _sum: { price: true }
    }))._sum.price;

    if (cost && made) cost = cost.mul(1.2);
    return cost;
  }

  async getRecipes() {
    return this.prisma.recipe.findMany({
      include: {
        ingredients: true
      }
    });
  }

  truthValue(data: string) {
    const cmp = data.toLowerCase();
    return cmp === 'yes' || cmp === 'true' || parseInt(cmp) > 0;

  }

  async init() {
    await this.prisma.ingredient.deleteMany({ where: { id: { gt: -1 } } });
    await this.prisma.recipe.deleteMany({ where: { id: { gt: -1 } } });
    await this.prisma.ingredientType.deleteMany({ where: { name: { not: '' } } });

    const { default: ingredientMap } = await import('./resources/ingredients');
    const ingredients: { [key: string]: any } = {};
    for (const ingredientType in ingredientMap) {
      const category = IngredientCategory[ingredientType as keyof typeof IngredientCategory];

      for (const ingredient of ingredientMap[category]) {
        ingredients[ingredient] = await this.prisma.ingredientType.create({
          data: {
            name: ingredient,
            category,
          },
        });
        this.logger.log(`Created '${ingredient}' ingredient type.`);
      }
    }

    const { default: recipes } = await import('./resources/recipes');
    for (const recipe of recipes) {
      const result = await this.prisma.recipe.create({ data: recipe });
      this.logger.log(`Created '${result.title}' recipe with id ${result.id}.`);
    }
  }

  async onModuleInit() {
    await this.init();
  }
}
