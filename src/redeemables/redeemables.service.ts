import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class RedeemablesService {
  constructor(private prisma: PrismaService) {}

  async createRedeemable(body) {
    const redeemableGroup = await this.prisma.redeemableGroup.findFirst({
      where: { id: body.redeemableGroupId },
    });

    if (!redeemableGroup) {
      return new HttpException('Forbidden', HttpStatus.FORBIDDEN);
    } else {
      return this.prisma.redeemable.create({
        data: body,
      });
    }
  }

  findAll() {
    return this.prisma.redeemable.findMany();
  }

  findOne(redeemadbleWhereUniqueInput: Prisma.redeemableWhereUniqueInput) {
    return this.prisma.redeemable.findUnique({
      where: redeemadbleWhereUniqueInput,
    });
  }

  update(
    where: Prisma.redeemableWhereUniqueInput,
    data: Prisma.redeemableWhereUniqueInput,
  ) {
    return this.prisma.redeemable.update({
      data,
      where,
    });
  }

  remove(where: Prisma.redeemableWhereUniqueInput) {
    return this.prisma.redeemable.delete({
      where,
    });
  }
}
