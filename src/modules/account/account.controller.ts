import {
  Body,
  Controller,
  HttpException,
  HttpStatus,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { LoginDTO } from './dto/login.dto';
import { AccountService } from './account.service';
import { connect } from 'http2';

@Controller('account')
export class AccountController {
  constructor(private accountService: AccountService) {}

  @Post('register')
  register(@Body() body: any) {
    return this.accountService.register(body);
  }

  //api/account/login
  @Post('login')
  login(@Req() req: any) {
    try {
      const { body } = req;
      return this.accountService.login(body);
    } catch (error) {
      throw new HttpException(error.message, HttpStatus.BAD_REQUEST);
    }
  }
}
