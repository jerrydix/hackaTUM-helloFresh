import { Controller, Get, NotFoundException, Param, Query } from "@nestjs/common";
import { RecipeService } from "./recipe.service";

@Controller('recipe')
export class RecipeController {
  constructor(private readonly recipeService: RecipeService) {}

  @Get()
  async getRecipes() {
    return this.recipeService.getRecipes();
  }

  @Get(':id')
  async getRecipeById(@Param('id') id: string): Promise<any> {
    let recipe = await this.recipeService.getRecipeById(parseInt(id));
    if (!recipe) return new NotFoundException(`Recipe ${id} was not found.`)
    return recipe;
  }

  @Get(':id/price')
  async getMadeRecipePrice(@Param('id') id: string, @Query('made') made: string) {
    let isMade = this.recipeService.truthValue(made ?? 'false');
    let price = await this.recipeService.getRecipeTotalPrice(parseInt(id), isMade);
    if (!price) throw new NotFoundException(`Recipe ${id} was not found.`);
    return price.toFixed(2);
  }
}
