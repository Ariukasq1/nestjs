import { Injectable } from '@nestjs/common';
import { CreateClaimDto } from './dto/create-claim.dto';
import { UpdateClaimDto } from './dto/update-claim.dto';
import { PrismaService } from '../prisma.service';

@Injectable()
export class ClaimsService {
  constructor(private prisma: PrismaService) {}
  async createClaim(body: CreateClaimDto) {
    const redeemable = await this.prisma.redeemable.findFirst({
      where: { code: body.code },
    });
    console.log('redeemables', redeemable);
    const currentDate = new Date().toJSON();

    if (!redeemable) {
      return this.prisma.redeemableClaim.create({
        data: body,
      });
    } else if (
      JSON.stringify(redeemable.claimBeginAt) < currentDate &&
      currentDate < JSON.stringify(redeemable.claimEndAt)
    ) {
      const totalCount = await this.prisma.redeemableClaim.count();
      if (redeemable.isReclaimable === true) {
        return this.prisma.redeemableClaim.create({
          data: body,
        });
      } else if (redeemable.isReclaimable === false && totalCount > 0) {
        return;
      }
    }
  }

  findAll() {
    return this.prisma.redeemableClaim.findMany();
  }

  findOne(id: number) {
    return `This action returns a #${id} claim`;
  }

  update(id: number, updateClaimDto: UpdateClaimDto) {
    return `This action updates a #${id} claim`;
  }

  remove(id: number) {
    return `This action removes a #${id} claim`;
  }
}
