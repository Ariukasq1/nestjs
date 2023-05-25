import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class RedeemablesService {
  constructor(private prisma: PrismaService) {}

  async create(body) {
    if (body.isReclaimable === true) {
      const claimData = await this.prisma.redeemableClaim.findMany({
        where: { userId: body.code },
      });

      if (claimData.length != 0) {
        return this.prisma.redeemable.create({
          data: body,
        });
      }
    }
    switch (body.type) {
      case 'promo':
        console.log('body type', body.type);
        break;
      case 'voucher':
        console.log('body type', body.type);
        break;
      case 'coupon':
        console.log('body type', body.type);
        break;
    }
  }

  findAll() {
    return this.prisma.redeemable.findMany();
  }

  findOne(redeemadbleWhereUniqueInput: Prisma.RedeemableWhereUniqueInput) {
    return this.prisma.redeemable.findUnique({
      where: redeemadbleWhereUniqueInput,
    });
  }

  update(
    where: Prisma.RedeemableWhereUniqueInput,
    data: Prisma.RedeemableWhereUniqueInput,
  ) {
    return this.prisma.redeemable.update({
      data,
      where,
    });
  }

  remove(where: Prisma.RedeemableWhereUniqueInput) {
    return this.prisma.redeemable.delete({
      where,
    });
  }
}
