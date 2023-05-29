import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
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

    const currentDate = new Date().toJSON();

    if (!redeemable) {
      return new HttpException('Forbidden', HttpStatus.FORBIDDEN);
    } else if (redeemable.isReclaimable != true) {
      return new HttpException(
        'isReclaimable value is false',
        HttpStatus.FORBIDDEN,
      );
    } else if (
      JSON.stringify(redeemable.claimBeginAt) < JSON.stringify(currentDate) &&
      JSON.stringify(currentDate) < JSON.stringify(redeemable.claimEndAt) &&
      redeemable.isReclaimable === true
    ) {
      const claim = await this.prisma.redeemableClaim.create({
        data: body,
      });

      const eventHandler = await this.prisma.eventHandler.findFirst({
        where: {
          triggerType: redeemable.type,
          triggerId: redeemable.id,
        },
      });

      if (eventHandler) {
        return this.prisma.eventResult.createMany({
          data: [
            {
              resultType: '',
              resultId: 0,
              eventHandlerId: 0,
            },
          ],
        });
      }

      let currentClaimCount = claim.claimCount;
      const newClaimCount = currentClaimCount++;
      return this.prisma.redeemableClaim.update({
        where: {
          id: claim.id,
        },
        data: {
          claimCount: newClaimCount,
        },
      });
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
