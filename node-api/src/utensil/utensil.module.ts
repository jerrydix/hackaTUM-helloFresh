import { Module } from "@nestjs/common";
import { PrismaService } from "@/prisma.service";
import { UtensilController } from "@/utensil/utensil.controller";
import { UtensilService } from "@/utensil/utensil.service";

@Module({
  imports: [],
  controllers: [UtensilController],
  providers: [UtensilService, PrismaService]
})
export class UtensilModule {}