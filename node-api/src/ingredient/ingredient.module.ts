import { Module } from "@nestjs/common";
import { PrismaService } from "@/prisma.service";
import { IngredientController } from "@/ingredient/ingredient.controller";
import { IngredientService } from "@/ingredient/ingredient.service";

@Module({
  imports: [],
  controllers: [IngredientController],
  providers: [IngredientService, PrismaService]
})
export class IngredientModule {}