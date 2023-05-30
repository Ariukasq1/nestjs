import { IsInt, IsOptional, IsString } from 'class-validator';

export class CreateClaimDto {
  redeemableId: number;
  userId: number;

  @IsString()
  code: string;
}
