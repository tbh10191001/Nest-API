import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { LoginDTO } from './dto/login.dto';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AccountService {
  constructor(
    private prismaService: PrismaService,
    private jwtService: JwtService,
  ) {}

  //register
  register(body: any) {
    console.log(body);
    return {
      message: 'User registered successfully',
    };
  }
  //login
  async login(body: LoginDTO) {
    const { username, password } = body;
    try {
      const user = await this.prismaService.account.findFirst({
        where: {
          username: username,
          password: password,
        },
      });
      if (!user) {
        throw new NotFoundException('User not found', {
          cause: new Error(),
          description: 'Invalid username or password',
        });
      } else {
        const token = await this.jwtService.sign({ username: user.username });
        return { token: token };
      }
    } catch (error) {
      return error.response;
    }
  }
  //forgot password
  forgotPassword() {
    return {
      message: 'Password reset link sent to your email',
    };
  }
  //reset password
  resetPassword() {
    return {
      message: 'Password reset successful',
    };
  }
}
