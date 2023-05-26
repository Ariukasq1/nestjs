-- AlterTable
ALTER TABLE `Redeemable` MODIFY `claimBeginAt` DATETIME(3) NOT NULL,
    MODIFY `claimEndAt` DATETIME(3) NOT NULL,
    ALTER COLUMN `createdAt` DROP DEFAULT;
