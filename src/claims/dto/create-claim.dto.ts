import { IsInt, IsString } from 'class-validator';

export class CreateClaimDto {
  @IsString()
  code: string;
}
