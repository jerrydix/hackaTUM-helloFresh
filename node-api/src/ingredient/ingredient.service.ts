import { Injectable } from "@nestjs/common";
import { PrismaService } from "@/prisma.service";
import { IngredientCategory } from "@prisma/client";

@Injectable()
export class IngredientService {
  constructor(private prisma: PrismaService) {}

  async getIngredients() {
    return this.prisma.ingredientType.findMany();
  }

  getIngredientTypes() {
    return Object.keys(IngredientCategory)
  }

  getIngredientCategory(key: string): IngredientCategory | null {
    if (key in IngredientCategory) {
      return IngredientCategory[key as keyof typeof IngredientCategory];
    }
    return null;
  }

  async getIngredientsOfType(category: string) {
    const cat = this.getIngredientCategory(category);
    if (cat === null) return null;

    return this.prisma.ingredientType.findMany({
      where: { category: { equals: cat } }
    })
  }
}