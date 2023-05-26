/*
  Warnings:

  - You are about to drop the column `redeemableId` on the `RedeemableClaim` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `RedeemableClaim` table. All the data in the column will be lost.
  - Added the required column `code` to the `RedeemableClaim` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `RedeemableClaim` DROP COLUMN `redeemableId`,
    DROP COLUMN `userId`,
    ADD COLUMN `code` VARCHAR(191) NOT NULL;
