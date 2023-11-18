import { Module } from "@nestjs/common";
import { ProfileController } from "@/profile/profile.controller";
import { ProfileService } from "@/profile/profile.service";
import { PrismaService } from "@/prisma.service";

@Module({
  imports: [],
  controllers: [ProfileController],
  providers: [ProfileService, PrismaService]
})
export class ProfileModule {}