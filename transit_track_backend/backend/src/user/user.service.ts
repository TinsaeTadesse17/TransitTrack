// user.service.ts
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';

import { CreateUserDto } from './dto/create-user.dto';
import { User, UserDocument } from './schemas/user.schema';


@Injectable()
export class UserService {
  constructor(@InjectModel(User.name) private userModel: Model<UserDocument>) {}

  async create(createUserDto: CreateUserDto): Promise<User> {
    const createdUser = new this.userModel(createUserDto);
    await createdUser.save();
    return createdUser.toObject();
  }
  async findOne(email: string): Promise<User> {
    return this.userModel.findOne({ email }).exec();
  }


  async findByEmail(email: string): Promise<User & { _id: any }> {
    return this.userModel.findOne({ email }).lean().exec();
  }

  async deleteUser(email: string): Promise<void> {
    const result = await this.userModel.deleteOne({ email }).exec();
    if (result.deletedCount === 0) {
      throw new NotFoundException(`User with email "${email}" not found`);
    }
  }

  async updatePassword(email: string, newPassword: string): Promise<void> {
    const user = await this.userModel.findOne({ email });
    if (!user) {
      throw new NotFoundException(`User with email "${email}" not found`);
    }
    user.password = newPassword;
    await user.save();
  }
}
