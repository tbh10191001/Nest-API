import { Body, Controller, Post } from '@nestjs/common';
import { AccountDTO } from './dto/account.dto';
import { AccountService } from './account.service';

@Controller('account')
export class AccountController {
  constructor(private accountService: AccountService) {}
  @Post('register')
  register(@Body() body: any) {
    return this.accountService.register(body);
  }

  @Post('login')
  login(@Body() body: AccountDTO) {
    return this.accountService.login(body);
  }
}
