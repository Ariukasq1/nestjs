import {
  IsBoolean,
  IsDateString,
  IsInt,
  IsOptional,
  IsString,
} from 'class-validator';
export class CreateRedeemableDto {
  @IsString()
  code: string;

  @IsString()
  name: string;

  @IsString()
  type: string;

  @IsDateString()
  claimBeginAt: Date;

  @IsDateString()
  claimEndAt: Date;

  @IsDateString()
  createdAt: Date;

  @IsOptional()
  @IsInt()
  redeemableGroupId: number;

  @IsBoolean()
  isReclaimable: boolean;
}
