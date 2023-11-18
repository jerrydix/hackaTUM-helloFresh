import { Controller, Get, NotFoundException, Param } from "@nestjs/common";
import { IngredientService } from "@/ingredient/ingredient.service";

import { ApiNotFoundResponse, ApiOkResponse, ApiTags } from "@nestjs/swagger";

@ApiTags('Ingredient')
@Controller('ingredient')
export class IngredientController {
  constructor(private readonly ingredientService: IngredientService) {}

  @Get()
  @ApiOkResponse({ description: 'Returns all ingredients registered in the database.' })
  async getIngredients() {
    return this.ingredientService.getIngredients();
  }

  @Get('types')
  @ApiOkResponse({ description: 'Returns all ingredient types registered in the database.' })
  getIngredientTypes() {
    return this.ingredientService.getIngredientTypes();
  }

  @Get('type/:category')
  @ApiOkResponse({ description: 'Returns all ingredients of a specific ingredient type.' })
  @ApiNotFoundResponse({ description: 'Requested Category was not found.' })
  async getIngredientsOfCategory(@Param('category') category: string) {
    let ingredientsOfType = await this.ingredientService.getIngredientsOfType(category);
    if (!ingredientsOfType) throw new NotFoundException(`Category ${category} was not found`);
    return ingredientsOfType;
  }
}