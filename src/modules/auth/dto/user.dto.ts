import { Expose } from 'class-transformer';
import { IsEmail, IsNotEmpty } from 'class-validator';

export class UserDTO {
  id: string;
  email: string;
  displayName: string;
  picture: string;
}