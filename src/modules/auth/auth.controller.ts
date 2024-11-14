import { Controller, Get, UseGuards } from "@nestjs/common";
import { GoogleAuthGuard } from "./utils/Guards";

@Controller('auth') // Nhiệm vụ: nhận dữ liệu đầu vào và trả dữ liệu đầu ra
export class AuthController {
    
    @Get('google/login')
    @UseGuards(GoogleAuthGuard)
    handleLogin() {
        return {
            message: 'Login with google',
        }
    } 

    //api/auth/google/redirect
    @Get('google/redirect')
    @UseGuards(GoogleAuthGuard)
    handleRedirect() {
        return {
            message: 'Redirect to google',
        }
    }

}