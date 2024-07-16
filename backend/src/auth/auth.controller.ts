import {
  Controller,
  Request,
  Post,
  UseGuards,
  Body,
  Put,
  Delete,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateUserDto } from '../user/dto/create-user.dto';
import { ChangePasswordDto } from 'src/user/dto/change-password.dto';
import { JwtAuthGuard } from './jwt-aut.guard';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('signup')
  async signup(@Body() createUserDto: CreateUserDto) {
    return this.authService.signup(createUserDto);
  }

  @HttpCode(HttpStatus.OK)
  @Post('login')
  async signIn(@Body() signInDto: { email: string; password: string }) {
    const { email, password } = signInDto;
    return await this.authService.login(email, password);
  }

  @UseGuards(JwtAuthGuard)
  @Put('change-password')
  async changePassword(
    @Request() req,
    @Body() changePasswordDto: ChangePasswordDto,
  ) {
    return this.authService.changePassword(
      req.user.email,
      changePasswordDto.oldPassword,
      changePasswordDto.newPassword
    );
  }

  @UseGuards(JwtAuthGuard)
  @Delete('delete')
  async deleteAccount(@Request() req) {
    return this.authService.deleteAccount(req.user.email);
  }
}
