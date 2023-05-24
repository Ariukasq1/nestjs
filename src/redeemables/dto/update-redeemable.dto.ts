import { PartialType } from '@nestjs/mapped-types';
import { CreateRedeemableDto } from './create-redeemable.dto';

export class UpdateRedeemableDto extends PartialType(CreateRedeemableDto) {}
