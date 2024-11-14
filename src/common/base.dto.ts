import { Expose } from 'class-transformer';

export class BaseDTO {
  @Expose()
  createAt: Date;

  @Expose()
  updateAt: Date;
}
