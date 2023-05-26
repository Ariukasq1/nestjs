/*
  Warnings:

  - You are about to alter the column `claimBeginAt` on the `Redeemable` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime`.
  - You are about to alter the column `claimEndAt` on the `Redeemable` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime`.

*/
-- AlterTable
ALTER TABLE `Redeemable` MODIFY `claimBeginAt` DATETIME NOT NULL,
    MODIFY `claimEndAt` DATETIME NOT NULL;
