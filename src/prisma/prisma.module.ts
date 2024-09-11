import { Global, Module } from '@nestjs/common';
import { PrismaService } from './prisma.service';

@Global() // make this module global
@Module({
  providers: [PrismaService],
  exports: [PrismaService], // other module can use PrismaService
})
export class PrismaModule {}
