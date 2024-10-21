import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable({})
export class AccountService {
  constructor(private prismaService: PrismaService) {}

  //register
  register(body: any) {
    console.log(body);
    return {
      message: 'User registered successfully',
    };
  }
  //login
  login(body: any) {
    console.log(body);
    return {
      message: 'User logged in successfully',
    };
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
