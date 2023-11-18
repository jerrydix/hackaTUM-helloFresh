import { Module } from '@nestjs/common';
import { RecipeController } from "./recipe.controller";
import { RecipeService } from "./recipe.service";
import { PrismaService } from "@/prisma.service";

@Module({
  imports: [],
  controllers: [RecipeController],
  providers: [RecipeService, PrismaService],
})
export class RecipeModule {}