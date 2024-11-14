import { Inject, Injectable } from '@nestjs/common';
import { PassportSerializer } from '@nestjs/passport';

@Injectable()
export class SessionSerializer extends PassportSerializer {
  constructor(@Inject('AUTH_SERVICE') private readonly authService) {
    super();
  }

  serializeUser(user: any, done: Function) {
    console.log('serializeUser', user);

    done(null, user.id);
  }

  deserializeUser(payload: any, done: Function) {
    console.log('deserializeUser', payload);
    // this.authService.
  }
}
