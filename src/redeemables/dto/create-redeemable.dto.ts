export class CreateRedeemableDto {
  id: number;
  code: number;
  type: string;
  claimBeginAt: Date;
  claimEndAt: Date;
  createdAt: Date;
  redeemableGroupId: number;
  isReclaimable: boolean;
}
