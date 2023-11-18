import { Injectable } from "@nestjs/common";
import { PrismaService } from "@/prisma.service";

@Injectable()
export class UtensilService {
  constructor(private prisma: PrismaService) {}

  async getUtensils() {
    return (await this.prisma.utensil.findMany({ select: { name: true } }))
      .map(utensil => utensil.name) as string[];
  }
}