import { Inject, Injectable } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import {Profile, Strategy} from 'passport-google-oauth20';
import { AuthService } from "../auth.service";

@Injectable()
export class GoogleStrategy extends PassportStrategy(Strategy) {
    constructor(@Inject("AUTH_SERVICE") private readonly userService: AuthService) {
        super({
            clientID: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET,
            callbackURL: process.env.GOOGLE_CALLBACK_URL,
            scope: ['email', 'profile']
        })
    }

    async validate(accessToken: string, refreshToken: string, profile: Profile) {
        console.log('accessToken', accessToken);
        console.log('refreshToken', refreshToken);
        console.log('profile', profile);
        const user = await this.userService.validate({id: profile.id, email: profile.emails[0].value, displayName: profile.displayName});
        return user;
    }
}