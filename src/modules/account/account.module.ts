import { Module } from '@nestjs/common';
import { AccountController } from './account.controller';
import { PrismaService } from 'src/prisma/prisma.service';
import { AccountService } from './account.service';
import { JwtService } from '@nestjs/jwt';

@Module({
  imports: [],
  controllers: [AccountController],
  providers: [PrismaService, AccountService, JwtService],
})
export class AccountModule {}
