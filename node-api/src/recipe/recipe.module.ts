import { Module } from '@nestjs/common';
import { RecipeController } from "./recipe.controller";
import { RecipeService } from "./recipe.service";
import { PrismaService } from "@/prisma.service";
import { ProfileService } from "@/profile/profile.service";

@Module({
  imports: [],
  controllers: [RecipeController],
  providers: [RecipeService, ProfileService, PrismaService],
})
export class RecipeModule {}