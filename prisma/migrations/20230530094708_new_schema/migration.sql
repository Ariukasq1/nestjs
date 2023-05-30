/*
  Warnings:

  - You are about to drop the column `claimCount` on the `redeemableClaim` table. All the data in the column will be lost.
  - You are about to drop the column `code` on the `redeemableClaim` table. All the data in the column will be lost.
  - Made the column `redeemableGroupId` on table `redeemable` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `redeemableId` to the `redeemableClaim` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `redeemable` MODIFY `redeemableGroupId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `redeemableClaim` DROP COLUMN `claimCount`,
    DROP COLUMN `code`,
    ADD COLUMN `redeemableId` INTEGER NOT NULL,
    ADD COLUMN `userId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `redeemable` ADD CONSTRAINT `redeemable_redeemableGroupId_fkey` FOREIGN KEY (`redeemableGroupId`) REFERENCES `redeemableGroup`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `redeemableClaim` ADD CONSTRAINT `redeemableClaim_redeemableId_fkey` FOREIGN KEY (`redeemableId`) REFERENCES `redeemable`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
