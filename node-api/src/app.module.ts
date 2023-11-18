import { Module } from '@nestjs/common';
import { RecipeModule } from "./recipe/recipe.module";
import { IngredientModule } from "@/ingredient/ingredient.module";
import { UtensilModule } from "@/utensil/utensil.module";
import { ConfigModule } from "@nestjs/config";
import { ProfileModule } from "@/profile/profile.module";

@Module({
  imports: [
    RecipeModule, IngredientModule, UtensilModule, ProfileModule,
    ConfigModule.forRoot()
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
