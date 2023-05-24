import { Injectable } from '@nestjs/common';
import { CreateRedeemableDto } from './dto/create-redeemable.dto';
import { UpdateRedeemableDto } from './dto/update-redeemable.dto';

@Injectable()
export class RedeemablesService {
  create(createRedeemableDto: CreateRedeemableDto) {
    return 'This action adds a new redeemable';
  }

  findAll() {
    return `This action returns all redeemables`;
  }

  findOne(id: number) {
    return `This action returns a #${id} redeemable`;
  }

  update(id: number, updateRedeemableDto: UpdateRedeemableDto) {
    return `This action updates a #${id} redeemable`;
  }

  remove(id: number) {
    return `This action removes a #${id} redeemable`;
  }
}
