import { Module } from '@nestjs/common';
import { RecipeModule } from "./recipe/recipe.module";
import { IngredientModule } from "@/ingredient/ingredient.module";

@Module({
  imports: [RecipeModule, IngredientModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
