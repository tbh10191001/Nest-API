// guards allow us to protect routes from unauthorized access
// if the user is not authenticated, we just return a 401 status code

import { ExecutionContext, Injectable } from "@nestjs/common";
import { AuthGuard } from "@nestjs/passport";

@Injectable(    )
export class GoogleAuthGuard extends AuthGuard('google') {
    async canActivate(context: ExecutionContext) {
        const activate = (await super.canActivate(context)) as boolean;
        const request = context.switchToHttp().getRequest();
        await super.logIn(request);
        return activate;
    }
}