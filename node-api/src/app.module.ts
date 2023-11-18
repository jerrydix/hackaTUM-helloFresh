import { Module } from '@nestjs/common';
import { RecipeModule } from "./recipe/recipe.module";
import { IngredientModule } from "@/ingredient/ingredient.module";
import { UtensilModule } from "@/utensil/utensil.module";

@Module({
  imports: [RecipeModule, IngredientModule, UtensilModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
