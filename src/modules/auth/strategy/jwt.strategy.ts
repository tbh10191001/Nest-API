import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';

export class JWTStrategy extends PassportStrategy(Strategy) {
  constructor() {
    const configService = new ConfigService();
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken('jwt'),
      ignoreExpiration: false,
      secretOrKey: configService.get('SECRET_JWT'),
    });
  }
  async validate(payload: any) {
    return { userId: payload.sub, username: payload.username };
  }
}
