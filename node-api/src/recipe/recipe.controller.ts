import { Controller, Get, Param } from "@nestjs/common";
import { RecipeService } from "./recipe.service";

@Controller('recipe')
export class RecipeController {
  constructor(private readonly recipeService: RecipeService) {}

  @Get(':id')
  async getRecipeById(@Param('id') id: string): Promise<any> {
    return await this.recipeService.getRecipeById(parseInt(id));
  }

  @Get(':id/image.jpg')
  async getRecipeImageById(@Param('id') id: string): Promise<any> {
    return await this.recipeService.getRecipeImageById(parseInt(id));
  }

  @Get(':id/instruction')
  async getRecipeInstructionById(@Param('id') id: string): Promise<any> {
    return await this.recipeService.getRecipeInstructionById(parseInt(id));
  }

  @Get(':id/instruction.txt')
  async getRecipeInstructionTextById(@Param('id') id: string): Promise<any> {
    const instruction = await this.recipeService.getRecipeInstructionById(parseInt(id));
    if (!instruction) return '';
    return this.recipeService.transformInstructionToText(instruction);
  }
}
