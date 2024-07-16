// user.controller.ts
import {
  Controller,
  Post,
  Body,
  Put,
  Param,
  Delete,
  Get,
} from '@nestjs/common';
import { UserService } from './user.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';

@Controller('users')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post('register')
  async register(@Body() createUserDto: CreateUserDto) {
    return this.userService.create(createUserDto);
  }

  @Delete('delete/:email')
  async delete(@Param('email') email: string) {
    return this.userService.deleteUser(email);
  }

  @Put('update-password/:email')
  async updatePassword(
    @Param('email') email: string,
    @Body() updateUserDto: UpdateUserDto,
  ) {
    return this.userService.updatePassword(email, updateUserDto.password);
  }
}
