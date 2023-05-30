/*
  Warnings:

  - You are about to drop the `EventHandler` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EventResult` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Redeemable` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedeemableClaim` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RedeemableGroup` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `EventHandler`;

-- DropTable
DROP TABLE `EventResult`;

-- DropTable
DROP TABLE `Redeemable`;

-- DropTable
DROP TABLE `RedeemableClaim`;

-- DropTable
DROP TABLE `RedeemableGroup`;

-- CreateTable
CREATE TABLE `redeemable` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `claimBeginAt` DATETIME(3) NOT NULL,
    `claimEndAt` DATETIME(3) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `redeemableGroupId` INTEGER NULL,
    `isReclaimable` BOOLEAN NOT NULL DEFAULT false,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `redeemableGroup` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `redeemableClaim` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(191) NOT NULL,
    `claimCount` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `eventHandler` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `triggerType` VARCHAR(191) NOT NULL,
    `triggerId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `eventResult` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `resultType` VARCHAR(191) NOT NULL,
    `resultId` INTEGER NOT NULL,
    `eventHandlerId` INTEGER NOT NULL,

    INDEX `EventResult_eventHandlerId_fkey`(`eventHandlerId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
