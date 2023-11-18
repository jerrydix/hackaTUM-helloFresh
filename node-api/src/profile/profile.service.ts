import { Injectable } from "@nestjs/common";
import { PrismaService } from "@/prisma.service";

@Injectable()
export class ProfileService {
  constructor(private prisma: PrismaService) {}

  async createProfile(name: string) {
    let alreadyExists = await this.prisma.profile.findUnique({ where: { name: name } });
    if (alreadyExists) return null;

    return this.prisma.profile.create({
      data: {
        name: name,
        allergyBits: Buffer.from([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]),
      },
    });
  }

  async deleteProfile(id: number) {
    return this.prisma.profile.delete({ where: { id: id } });
  }

  async findProfiles() {
    return this.prisma.profile.findMany({});
  }

  async findProfile(id: number | string) {
    if (typeof id === 'number') {
      return this.prisma.profile.findUnique({ where: { id: id } });
    } else {
      return this.prisma.profile.findUnique({ where: { name: id } });
    }
  }

  async addPreference(id: number, ingredient: number) {
    let user = await this.findProfile(id);
    if (user) {
      let ing = await this.prisma.ingredient.findUnique({ where: { id: ingredient } });
      if (!ing) return null;
      return this.prisma.profile.update({
        where: { id: id },
        data: { preferences: { connect: { id: ingredient } } }
      });
    }
    return null;
  }

  async removePreference(id: number, ingredient: number) {
    let user = await this.findProfile(id);
    if (user) {
      let ing = await this.prisma.ingredient.findUnique({ where: { id: ingredient } });
      if (!ing) return null;
      return this.prisma.profile.update({
        where: { id: id },
        data: { preferences: { disconnect: { id: ingredient } } }
      });
    }
  }

  async addDislike(id: number, ingredient: number) {
    let user = await this.findProfile(id);
    if (user) {
      let ing = await this.prisma.ingredient.findUnique({ where: { id: ingredient } });
      if (!ing) return null;
      return this.prisma.profile.update({
        where: { id: id },
        data: { exclusions: { connect: { id: ingredient } } }
      });
    }
    return null;
  }

  async removeDislike(id: number, ingredient: number) {
    let user = await this.findProfile(id);
    if (user) {
      let ing = await this.prisma.ingredient.findUnique({ where: { id: ingredient } });
      if (!ing) return null;
      return this.prisma.profile.update({
        where: { id: id },
        data: { exclusions: { disconnect: { id: ingredient } } }
      })
    }
  }

  async setAllergies(id: number, bits: Buffer) {
    let user = await this.findProfile(id);
    if (user) {
      return this.prisma.profile.update({
        where: { id: id },
        data: { allergyBits: bits }
      });
    }
    return null;
  }

  async setDefaultOrderSize(id: number, size: 'SMALL' | 'MEDIUM' | 'LARGE') {
    let user = await this.findProfile(id);
    if (user) {
      return this.prisma.profile.update({
        where: { id: id },
        data: { orderSize: size }
      });
    }
    return null;
  }
}