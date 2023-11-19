import {
  Body,
  Controller,
  Delete,
  Get, Header,
  ImATeapotException,
  NotFoundException, Patch,
  Post,
  Session, StreamableFile, UnauthorizedException
} from "@nestjs/common";
import {
  ApiCreatedResponse,
  ApiNotFoundResponse,
  ApiOkResponse,
  ApiResponse,
  ApiTags,
  ApiUnauthorizedResponse
} from "@nestjs/swagger";
import { ProfileService } from "@/profile/profile.service";

type NameWrapper = { name: string };
type IDWrapper = { id: number };
type AllergyWrapper = { data: Array<0 | 1> };
type SizeWrapper = { size: 'SMALL' | 'MEDIUM' | 'LARGE' };

@ApiTags('Profile')
@Controller('profile')
export class ProfileController {
  constructor(private readonly profileService: ProfileService) {}

  @Post('preference')
  @ApiCreatedResponse({ description: 'Added preference' })
  @ApiNotFoundResponse({ description: 'No such ingredient' })
  @ApiUnauthorizedResponse({ description: 'No profile currently selected' })
  async addPreference(@Session() session: Record<string, any>, @Body() { id }: IDWrapper) {
    if (!session.user_id) throw new UnauthorizedException();
    let result = await this.profileService.addPreference(session.user_id, id);
    if (result === null) throw new NotFoundException();
    return result;
  }

  @Delete('preference')
  @ApiOkResponse({ description: 'Removed preference' })
  @ApiNotFoundResponse({ description: 'No such ingredient or preference' })
  @ApiUnauthorizedResponse({ description: 'No profile currently selected' })
  async deletePreference(@Session() session: Record<string, any>, @Body() { id }: IDWrapper) {
    if (!session.user_id) throw new UnauthorizedException();
    let result = await this.profileService.removePreference(session.user_id, id);
    if (result === null) throw new NotFoundException();
    return result;
  }

  @Get('preference')
  @ApiOkResponse({ description: 'Returns all preferences' })
  async getPreferences(@Session() session: Record<string, any>) {
    if (!session.user_id) throw new UnauthorizedException();
    return await this.profileService.getPreferences(session.user_id);
  }

  @Post('dislike')
  @ApiCreatedResponse({ description: 'Added dislike' })
  @ApiNotFoundResponse({ description: 'No such ingredient' })
  @ApiUnauthorizedResponse({ description: 'No profile currently selected' })
  async addDislike(@Session() session: Record<string, any>, @Body() { id }: IDWrapper) {
    if (!session.user_id) throw new UnauthorizedException();
    let result = await this.profileService.addDislike(session.user_id, id);
    if (result === null) throw new NotFoundException();
    return result;
  }

  @Delete('dislike')
  @ApiOkResponse({ description: 'Removed dislike' })
  @ApiNotFoundResponse({ description: 'No such ingredient or dislike' })
  @ApiUnauthorizedResponse({ description: 'No profile currently selected' })
  async removeDislike(@Session() session: Record<string, any>, @Body() { id }: IDWrapper) {
    if (!session.user_id) throw new UnauthorizedException();
    let result = await this.profileService.removeDislike(session.user_id, id);
    if (result === null) throw new NotFoundException();
    return result;
  }

  @Get('dislike')
  @ApiOkResponse({ description: 'Returns all dislikes' })
  async getDislikes(@Session() session: Record<string, any>) {
    if (!session.user_id) throw new UnauthorizedException();
    return await this.profileService.getDislikes(session.user_id);
  }

  @Post('allergy')
  @ApiCreatedResponse({ description:
      'Set allergies. Notably due to how the data is stored, ' +
      'the bit-order of the allergies is reverse - ' +
      'the last index in the buffer corresponds to a low number.'
  })
  @ApiUnauthorizedResponse({ description: 'No profile currently selected' })
  async setAllergy(@Session() session: Record<string, any>, @Body() { data }: AllergyWrapper) {
    if (!session.user_id) throw new UnauthorizedException();
    return await this.profileService.setAllergies(session.user_id, parseInt(data.join(''), 2));
  }

  @Post('size')
  @ApiCreatedResponse({ description: 'Set default order size' })
  @ApiUnauthorizedResponse({ description: 'No profile currently selected' })
  async setSize(@Session() session: Record<string, any>, @Body() { size }: SizeWrapper) {
    if (!session.user_id) throw new UnauthorizedException();
    return await this.profileService.setDefaultOrderSize(session.user_id, size);
  }

  @Post()
  @ApiCreatedResponse({ description: 'Created a new profile' })
  @ApiResponse({ status: 418, description: 'I\'m a teapot' })
  async setupProfile(@Session() session: Record<string, any>, @Body() { name }: NameWrapper) {
    let user = await this.profileService.createProfile(name);
    if (user === null) throw new ImATeapotException();
    session.user_id = user.id;
  }

  @Patch()
  @ApiOkResponse({ description: 'Switched profile' })
  @ApiUnauthorizedResponse({ description: 'No profile currently selected' })
  async switchProfile(@Session() session: Record<string, any>, @Body() { name }: NameWrapper) {
    let user = await this.profileService.findProfile(name);
    if (user === null) throw new NotFoundException();
    session.user_id = user.id;
  }

  @Delete()
  @ApiOkResponse({ description: 'Deleted the current profile' })
  @ApiUnauthorizedResponse({ description: 'No profile currently selected' })
  async deleteProfile(@Session() session: Record<string, any>) {
    if (!session.user_id) throw new UnauthorizedException();
    await this.profileService.deleteProfile(session.user_id);
    delete session.user_id;
  }

  @Get()
  @ApiOkResponse({ description: 'Returns the current profile' })
  @ApiResponse({ status: 418, description: 'I\'m a teapot' })
  async whoAmI(@Session() session: Record<string, any>) {
    if (!session.user_id) throw new ImATeapotException();
    return session.user_id as number;
  }

  @Get('all')
  @ApiOkResponse({ description: 'Returns all profiles' })
  async getAllProfiles() {
    return this.profileService.findProfiles();
  }

  @Get('data')
  @Header('Content-Type', 'application/json')
  @Header('Content-Disposition', 'attachment; filename="fcs.json"')
  @ApiOkResponse({ description: 'Get data file' })
  async getDataFile() {
    const buffer = await this.profileService.genFile(
      15, 15, 15, 15,
      await this.profileService.getRandomRecipeIDs(4),
      await this.profileService.getRandomExclusions(3)
    );
    return new StreamableFile(buffer);
  }
}