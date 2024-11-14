import { Injectable } from "@nestjs/common";
import { UserDTO } from "./dto/user.dto";
import { PrismaService } from "src/prisma/prisma.service";

@Injectable() // tag cho nest biết đây là Provider
// Serveice: xử lý logic: query database, xử lý dữ liệu, gửi mail, ...
export class AuthService {
    constructor(private readonly prisma: PrismaService) {}

    async validate(user: UserDTO) {
        console.log('AuthService');
        console.log('details', user);
       
        return user
    }
  
}