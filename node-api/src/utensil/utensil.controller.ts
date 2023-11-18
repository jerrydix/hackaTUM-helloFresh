import { Controller, Get } from "@nestjs/common";
import { UtensilService } from "@/utensil/utensil.service";

import { ApiOkResponse, ApiTags } from "@nestjs/swagger";

@ApiTags('Utensil')
@Controller('utensil')
export class UtensilController {
  constructor(private readonly utensilService: UtensilService) {}

  @Get()
  @ApiOkResponse({ description: 'Returns all utensils registered in the database.' })
  async getUtensils() {
    return this.utensilService.getUtensils();
  }
}