/*
  Warnings:

  - You are about to drop the column `redeembleId` on the `RedeemableClaim` table. All the data in the column will be lost.
  - Added the required column `redeemableId` to the `RedeemableClaim` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `RedeemableClaim` DROP COLUMN `redeembleId`,
    ADD COLUMN `redeemableId` INTEGER NOT NULL;
