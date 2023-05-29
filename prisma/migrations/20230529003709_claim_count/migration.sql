/*
  Warnings:

  - Added the required column `claimCount` to the `RedeemableClaim` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `RedeemableClaim` ADD COLUMN `claimCount` INTEGER NOT NULL;
