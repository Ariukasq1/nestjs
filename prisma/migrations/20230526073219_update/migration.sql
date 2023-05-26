/*
  Warnings:

  - You are about to drop the column `redeeambleId` on the `RedeemableClaim` table. All the data in the column will be lost.
  - Added the required column `redeembleId` to the `RedeemableClaim` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `RedeemableClaim_redeeambleId_fkey` ON `RedeemableClaim`;

-- AlterTable
ALTER TABLE `RedeemableClaim` DROP COLUMN `redeeambleId`,
    ADD COLUMN `redeembleId` INTEGER NOT NULL;
