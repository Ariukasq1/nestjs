-- AlterTable
ALTER TABLE `redeemable` MODIFY `claimBeginAt` DATETIME(3) NULL,
    MODIFY `claimEndAt` DATETIME(3) NULL;

-- AlterTable
ALTER TABLE `redeemableClaim` MODIFY `claimCount` INTEGER NULL DEFAULT 0;
