-- DropIndex
DROP INDEX `Redeemable_redeemableGroupId_fkey` ON `Redeemable`;

-- AlterTable
ALTER TABLE `Redeemable` MODIFY `redeemableGroupId` INTEGER NULL;
