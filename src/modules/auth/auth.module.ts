import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { GoogleStrategy } from './utils/GoogleStategy';
import { AuthService } from './auth.service';
import { PrismaService } from 'src/prisma/prisma.service';
import { SessionSerializer } from './utils/Serializer';

@Module({
    imports: [],
    controllers: [AuthController],
    providers: [GoogleStrategy, PrismaService, SessionSerializer, {
        provide: 'AUTH_SERVICE',
        useClass: AuthService
    }],
})
export class AuthModule {

}
