import { Injectable } from '@nestjs/common';
import { UserDTO } from './dto/user.dto';
import { PrismaService } from 'src/prisma/prisma.service';


@Injectable() // tag cho nest biết đây là Provider
// Serveice: xử lý logic: query database, xử lý dữ liệu, gửi mail, ...
export class AuthService {
  constructor(private readonly prisma: PrismaService) {}

  async validate(user: UserDTO) {
    console.log('AuthService');
    console.log('details', user);
    try {
      if (user) {
        const userExist = await this.prisma.customer.findUnique({
          where: {
            email: user.email,
          },
        });
        if (userExist) {
          return userExist;
        } else {
          const newUser = await this.prisma.customer.create({
            data: {
              customerID: user.id,
              email: user.email,
              displayName: user.displayName,
              picture: user.picture,
            },
          });
          return newUser;
        }
      }
    } catch (error) {
      console.log('error', error);

    }
  }
}
