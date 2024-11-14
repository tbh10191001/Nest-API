import { Expose } from 'class-transformer';
import { IsEmail, IsNotEmpty } from 'class-validator';

export class LoginDTO {
  @IsNotEmpty()
  @Expose()
  username: string;

  @IsNotEmpty()
  password: string;
}
