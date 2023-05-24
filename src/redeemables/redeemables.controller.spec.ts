import { Test, TestingModule } from '@nestjs/testing';
import { RedeemablesController } from './redeemables.controller';
import { RedeemablesService } from './redeemables.service';

describe('RedeemablesController', () => {
  let controller: RedeemablesController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [RedeemablesController],
      providers: [RedeemablesService],
    }).compile();

    controller = module.get<RedeemablesController>(RedeemablesController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
