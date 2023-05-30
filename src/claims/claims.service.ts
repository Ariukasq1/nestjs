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

    const currentDate = new Date().getTime();

    if (!redeemable) {
      return new HttpException('Forbidden', HttpStatus.FORBIDDEN);
    }
    if (
      (redeemable.claimBeginAt === null || redeemable.claimEndAt === null) &&
      redeemable.claimBeginAt.getTime() < currentDate &&
      currentDate < redeemable.claimEndAt.getTime()
    ) {
      return new HttpException('Forbidden', HttpStatus.FORBIDDEN);
    } else {
      if (redeemable.isReclaimable != true) {
        const totalClaim = await this.prisma.redeemableClaim.count({
          where: { redeemableId: redeemable.id },
        });

        if (totalClaim >= 1) {
          return new HttpException(
            "Claim's  count more than 1",
            HttpStatus.FORBIDDEN,
          );
        }
        await this.prisma.redeemableClaim.create({
          data: {
            redeemableId: redeemable.id,
          },
        });

        const eventHandler = await this.prisma.eventHandler.findFirst({
          where: {
            triggerType: redeemable.type,
            triggerId: redeemable.id,
          },
        });

        if (!eventHandler) {
          return new HttpException(
            'Did not eventHandlerId ',
            HttpStatus.FORBIDDEN,
          );
        } else {
          return this.prisma.eventResult.createMany({
            data: [
              {
                resultType: '',
                resultId: 0,
                eventHandlerId: eventHandler.id,
              },
            ],
          });
        }
      } else {
        await this.prisma.redeemableClaim.create({
          data: {
            redeemableId: redeemable.id,
          },
        });

        const eventHandler = await this.prisma.eventHandler.findFirst({
          where: {
            triggerType: redeemable.type,
            triggerId: redeemable.id,
          },
        });

        if (!eventHandler) {
          return new HttpException(
            'Did not eventHandlerId ',
            HttpStatus.FORBIDDEN,
          );
        } else {
          return this.prisma.eventResult.createMany({
            data: [
              {
                resultType: '',
                resultId: 0,
                eventHandlerId: eventHandler.id,
              },
            ],
          });
        }
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
