import { Test, TestingModule } from '@nestjs/testing';
import { RedeemablesService } from './redeemables.service';

describe('RedeemablesService', () => {
  let service: RedeemablesService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [RedeemablesService],
    }).compile();

    service = module.get<RedeemablesService>(RedeemablesService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
