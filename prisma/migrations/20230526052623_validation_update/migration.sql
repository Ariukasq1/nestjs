/*
  Warnings:

  - Made the column `code` on table `Redeemable` required. This step will fail if there are existing NULL values in that column.
  - Made the column `type` on table `Redeemable` required. This step will fail if there are existing NULL values in that column.
  - Made the column `claimBeginAt` on table `Redeemable` required. This step will fail if there are existing NULL values in that column.
  - Made the column `claimEndAt` on table `Redeemable` required. This step will fail if there are existing NULL values in that column.
  - Made the column `redeemableGroupId` on table `Redeemable` required. This step will fail if there are existing NULL values in that column.
  - Made the column `name` on table `Redeemable` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `Redeemable` DROP FOREIGN KEY `Redeemable_redeemableGroupId_fkey`;

-- AlterTable
ALTER TABLE `Redeemable` MODIFY `code` VARCHAR(191) NOT NULL,
    MODIFY `type` VARCHAR(191) NOT NULL,
    MODIFY `claimBeginAt` DATETIME(3) NOT NULL,
    MODIFY `claimEndAt` DATETIME(3) NOT NULL,
    MODIFY `redeemableGroupId` INTEGER NOT NULL,
    MODIFY `name` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Redeemable` ADD CONSTRAINT `Redeemable_redeemableGroupId_fkey` FOREIGN KEY (`redeemableGroupId`) REFERENCES `RedeemableGroup`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
