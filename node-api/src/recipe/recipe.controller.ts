import { Controller, Get, NotFoundException, Param, Query } from "@nestjs/common";
import { RecipeService } from "./recipe.service";
import { ApiNotFoundResponse, ApiOkResponse, ApiQuery, ApiTags } from "@nestjs/swagger";

@ApiTags('Recipe')
@Controller('recipe')
export class RecipeController {
  constructor(private readonly recipeService: RecipeService) {}

  @Get()
  @ApiOkResponse({ description: 'Gets all recipes from the database.' })
  async getRecipes() {
    return this.recipeService.getRecipes();
  }

  @Get(':id')
  @ApiOkResponse({ description: 'Gets specific recipe from database.' })
  @ApiNotFoundResponse({ description: 'Requested recipe wasn\'t found in the database.' })
  async getRecipeById(@Param('id') id: string): Promise<any> {
    let recipe = await this.recipeService.getRecipeById(parseInt(id));
    if (!recipe) return new NotFoundException(`Recipe ${id} was not found.`)
    return recipe;
  }

  @Get(':id/price')
  @ApiOkResponse({ description: 'Gets price of a specific recipe from the database.' })
  @ApiNotFoundResponse({ description: 'Requested recipe wasn\'t found in the database.' })
  @ApiQuery({ name: 'made', required: false })
  async getMadeRecipePrice(@Param('id') id: string, @Query('made') made: string) {
    let isMade = this.recipeService.truthValue(made ?? 'false');
    let price = await this.recipeService.getRecipeTotalPrice(parseInt(id), isMade);
    if (!price) throw new NotFoundException(`Recipe ${id} was not found.`);
    return price.toFixed(2);
  }
}
