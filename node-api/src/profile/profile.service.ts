import { Injectable, OnModuleInit } from "@nestjs/common";
import { PrismaService } from "@/prisma.service";

@Injectable()
export class ProfileService implements OnModuleInit {
  constructor(private prisma: PrismaService) {}

  initialProfile: undefined | number;

  async onModuleInit() {
    let exists = await this.findProfile("Anonymous");
    if (exists) {
      this.initialProfile = exists.id;
      return;
    }

    let profile = await this.createProfile("Anonymous");
    if (profile) {
      this.initialProfile = profile.id;
    }
  }

  async createProfile(name: string) {
    let alreadyExists = await this.prisma.profile.findUnique({ where: { name: name } });
    if (alreadyExists) return null;

    return this.prisma.profile.create({
      data: {
        name: name,
        allergyBits: 0,
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
      return this.prisma.profile.findUnique({
        where: { id: id },
        include: {
          preferences: true,
          exclusions: true
        }
      });
    } else {
      return this.prisma.profile.findUnique({
        where: { name: id },
        include: {
          preferences: true,
          exclusions: true
        }
      });
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
    return null;
  }

  async getPreferences(id: any) {
    let user = await this.findProfile(id);
    if (user) {
      let data = await this.prisma.profile.findFirst({
        where: { id: id },
        include: { preferences: true }
      });
      if (data) {
        return data.preferences;
      }
      return [];
    }
    return null;
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

  async getDislikes(id: any) {
    let user = await this.findProfile(id);
    if (user) {
      let data = await this.prisma.profile.findFirst({
        where: { id: id },
        include: { exclusions: true }
      });
      if (data) {
        return data.exclusions;
      }
      return [];
    }
    return null;
  }

  async setAllergies(id: number, bits: number) {
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

  async genFile(calories: number, fats: number, carbs: number, proteins: number, recipes: Array<number>, exclusions: Array<string>) {
    return Buffer.from(JSON.stringify({
      calories, fats, carbs, proteins, recipes, exclusions
    }, null, 2));
  }

  async getRandomRecipeIDs(count: number) {
    return (await this.prisma.recipe.findMany({
      take: count,
      select: { id: true }
    })).map(r => r.id);
  }

  async getRandomExclusions(count: number) {
    return (await this.prisma.ingredientType.findMany({
      take: count,
      select: { category: true }
    })).map(i => i.category);
  }
}