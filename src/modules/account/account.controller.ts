import { Body, Controller, Post } from '@nestjs/common';
import { LoginDTO } from './dto/login.dto';
import { AccountService } from './account.service';

@Controller('account')
export class AccountController {
  constructor(private accountService: AccountService) {}

  @Post('register')
  register(@Body() body: any) {
    return this.accountService.register(body);
  }

  //api/account/login
  @Post('login')
  login(@Body() body: LoginDTO) {
    console.log(body);
    return this.accountService.login(body);
  }
}
