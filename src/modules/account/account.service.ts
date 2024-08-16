import { Injectable } from '@nestjs/common';

@Injectable({})
export class AccountService {
  constructor() {}

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
  forgotPassword() {}
  //reset password
  resetPassword() {}
}
