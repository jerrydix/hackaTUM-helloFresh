import {
  Controller,
  Get,
  NotFoundException,
  Param,
  Query,
  Session, UnauthorizedException
} from "@nestjs/common";
import { RecipeService } from "./recipe.service";
import { ApiNotFoundResponse, ApiOkResponse, ApiQuery, ApiTags } from "@nestjs/swagger";
import { ProfileService } from "@/profile/profile.service";

@ApiTags('Recipe')
@Controller('recipe')
export class RecipeController {
  constructor(
    private readonly recipeService: RecipeService,
    private readonly profileService: ProfileService
  ) {}

  @Get()
  @ApiOkResponse({ description: 'Gets all recipes from the database.' })
  @ApiQuery({ name: 'query', description: 'Recipe search term',  required: false })
  async getRecipes(@Session() session: Record<string, any>, @Query('query') query: string) {
    let user;
    if (session.user_id) {
      user = (await this.profileService.findProfile(session.user_id))!;
      this.profileService.initialProfile = undefined;
    } else if(this.profileService.initialProfile !== undefined) {
      user = (await this.profileService.findProfile(this.profileService.initialProfile))!;
      session.user_id = this.profileService.initialProfile;
    } else throw new UnauthorizedException(`No User Session is active.`);

    if (query) {
      return this.recipeService.searchRecipes(user, query);
    }
    return this.recipeService.getRecipes(user);
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
