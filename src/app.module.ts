import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { RedeemablesModule } from './redeemables/redeemables.module';

@Module({
  imports: [RedeemablesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
