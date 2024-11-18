import { Expose } from 'class-transformer';
import { IsNotEmpty, IsString } from 'class-validator';

export class LoginDTO {
  @IsNotEmpty({ message: 'Username is required' })
  @Expose()
  username: string;

  @IsNotEmpty({ message: 'Password is required' })
  password: string;
}
