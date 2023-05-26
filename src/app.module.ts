import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { RedeemablesModule } from './redeemables/redeemables.module';
import { GroupsModule } from './groups/groups.module';
import { ClaimsModule } from './claims/claims.module';

@Module({
  imports: [RedeemablesModule, GroupsModule, ClaimsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
