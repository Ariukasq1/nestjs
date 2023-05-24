import { Module } from '@nestjs/common';
import { RedeemablesService } from './redeemables.service';
import { RedeemablesController } from './redeemables.controller';
import { PrismaService } from '../prisma.service';

@Module({
  controllers: [RedeemablesController],
  providers: [RedeemablesService, PrismaService],
})
export class RedeemablesModule {}
