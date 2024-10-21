import { Injectable } from "@nestjs/common";
import { UserDTO } from "./dto/user.dto";
import { PrismaService } from "src/prisma/prisma.service";

@Injectable()
export class AuthService {
    constructor(private readonly prisma: PrismaService) {}

    async validate(user: UserDTO) {
        console.log('AuthService');
        console.log('details', user);
        if(user) {
            const isAccount = await this.prisma.account.findUnique({
                where: {
                    email: user.email
                }
            })
        }
        return user
    }
  
}