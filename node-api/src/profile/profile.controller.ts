import { Controller, Post } from "@nestjs/common";
import { ApiTags } from "@nestjs/swagger";

@ApiTags('Profile')
@Controller('profile')
export class ProfileController {
  @Post('setup')
  async setupProfile() {

  }
}