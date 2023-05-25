-- CreateTable
CREATE TABLE `Redeemable` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(191) NULL,
    `type` VARCHAR(191) NULL,
    `claimBeginAt` DATETIME(3) NULL,
    `claimEndAt` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `redeemableGroupId` INTEGER NULL,
    `isReclaimable` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RedeemableGroup` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RedeemableClaim` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `redeeambleId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventHandler` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `triggerType` VARCHAR(191) NOT NULL,
    `triggerId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventResult` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `resultType` VARCHAR(191) NOT NULL,
    `resultId` INTEGER NOT NULL,
    `eventHandlerId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Redeemable` ADD CONSTRAINT `Redeemable_redeemableGroupId_fkey` FOREIGN KEY (`redeemableGroupId`) REFERENCES `RedeemableGroup`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RedeemableClaim` ADD CONSTRAINT `RedeemableClaim_redeeambleId_fkey` FOREIGN KEY (`redeeambleId`) REFERENCES `Redeemable`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventResult` ADD CONSTRAINT `EventResult_eventHandlerId_fkey` FOREIGN KEY (`eventHandlerId`) REFERENCES `EventHandler`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
