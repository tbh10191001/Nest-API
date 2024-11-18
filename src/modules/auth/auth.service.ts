import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { PrismaService } from 'src/prisma/prisma.service';
import { UserDTO } from './dto/user.dto';

@Injectable() // tag cho nest biết đây là Provider
// Serveice: xử lý logic: query database, xử lý dữ liệu, gửi mail, ...
export class AuthService {
  constructor(
    private readonly prismaService: PrismaService,
    private readonly jwtService: JwtService,
  ) {}
  //google login
  async validate(user: UserDTO) {
    try {
      if (user) {
        const userExist = await this.prismaService.customer.findUnique({
          where: {
            email: user.email,
          },
        });
        if (userExist) {
          const accessToken = this.jwtService.sign(userExist);
          return accessToken;
        }
      }
    } catch (error) {
      console.log('error', error);
    }
  }
}
