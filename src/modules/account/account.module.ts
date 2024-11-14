import { Module } from '@nestjs/common';
import { AccountController } from './account.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({ controllers: [AccountController], providers: [PrismaService] })
export class AccountModule {}
