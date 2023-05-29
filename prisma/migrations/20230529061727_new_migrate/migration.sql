-- DropForeignKey
ALTER TABLE `EventResult` DROP FOREIGN KEY `EventResult_eventHandlerId_fkey`;

-- CreateTable
CREATE TABLE `auth_providers` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_uid` INTEGER UNSIGNED NOT NULL,
    `provider_id` VARCHAR(255) NOT NULL,

    INDEX `auth_providers_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cards` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_uid` INTEGER UNSIGNED NOT NULL,
    `service_id` VARCHAR(255) NOT NULL,
    `holder_name` VARCHAR(255) NOT NULL,
    `first_digits` VARCHAR(255) NOT NULL,
    `last_digits` VARCHAR(255) NOT NULL,
    `bank_name` VARCHAR(255) NOT NULL,
    `bank_number` VARCHAR(255) NOT NULL,
    `payment_gateway_id` INTEGER UNSIGNED NOT NULL,
    `created_at` DATETIME(0) NOT NULL,

    INDEX `cards_payment_gateway_id_foreign`(`payment_gateway_id`),
    INDEX `cards_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `config` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `key` VARCHAR(255) NOT NULL,
    `value` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contributions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `episode_uid` INTEGER UNSIGNED NOT NULL,
    `member_id` INTEGER UNSIGNED NOT NULL,
    `type` VARCHAR(255) NOT NULL DEFAULT 'participate',

    INDEX `contributions_episode_uid_foreign`(`episode_uid`),
    INDEX `contributions_member_id_foreign`(`member_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `deal_shares` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `deal_uid` INTEGER UNSIGNED NULL,
    `distributor_uid` INTEGER UNSIGNED NULL,
    `amount` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `deal_shares_deal_uid_foreign`(`deal_uid`),
    INDEX `deal_shares_distributor_uid_foreign`(`distributor_uid`),
    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `deals` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `platform_share` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `begin_at` DATETIME(0) NOT NULL,
    `end_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `distributors` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `remember_token` VARCHAR(100) NULL,

    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `entries` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(255) NOT NULL,
    `user_uid` INTEGER UNSIGNED NOT NULL,
    `franchise_uid` INTEGER UNSIGNED NOT NULL,
    `checkpoint` JSON NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `entries_franchise_uid_foreign`(`franchise_uid`),
    INDEX `entries_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `episodes` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `title_uid` INTEGER UNSIGNED NOT NULL,
    `number` INTEGER NOT NULL,
    `name` VARCHAR(255) NULL,
    `status` VARCHAR(255) NOT NULL,
    `policy` VARCHAR(255) NOT NULL,
    `streams` JSON NULL,
    `schedule` DATETIME(0) NULL,
    `images` JSON NOT NULL,
    `timestamps` JSON NULL,
    `created_at` DATETIME(0) NOT NULL,

    INDEX `episodes_title_uid_foreign`(`title_uid`),
    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fcm_tokens` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_uid` INTEGER UNSIGNED NOT NULL,
    `device_id` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,

    INDEX `fcm_tokens_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `franchise_genres` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `franchise_uid` INTEGER UNSIGNED NOT NULL,
    `genre_id` INTEGER UNSIGNED NOT NULL,

    INDEX `franchise_genres_franchise_uid_foreign`(`franchise_uid`),
    INDEX `franchise_genres_genre_id_foreign`(`genre_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `franchises` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `age_rating` INTEGER NOT NULL,
    `images` JSON NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `name_mn` VARCHAR(255) NOT NULL,
    `name_ts` VARCHAR(255) NOT NULL,
    `keywords` JSON NOT NULL,

    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `genres` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `keyword` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `gifts` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `issue_user_uid` INTEGER UNSIGNED NULL,
    `pro_pack_id` INTEGER UNSIGNED NOT NULL,
    `code` VARCHAR(255) NULL,
    `message` VARCHAR(255) NULL,
    `membership_id` INTEGER UNSIGNED NULL,
    `created_at` DATETIME(0) NOT NULL,
    `paid_at` DATETIME(0) NULL,
    `activated_at` DATETIME(0) NULL,

    INDEX `gifts_issue_user_uid_foreign`(`issue_user_uid`),
    INDEX `gifts_membership_id_foreign`(`membership_id`),
    INDEX `gifts_pro_pack_id_foreign`(`pro_pack_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `highlight_items` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `highlight_id` INTEGER UNSIGNED NOT NULL,
    `franchise_uid` INTEGER UNSIGNED NOT NULL,
    `title_uid` INTEGER UNSIGNED NOT NULL,
    `index` INTEGER NOT NULL,
    `has_episode` BOOLEAN NOT NULL DEFAULT false,

    INDEX `highlight_items_franchise_uid_foreign`(`franchise_uid`),
    INDEX `highlight_items_highlight_id_foreign`(`highlight_id`),
    INDEX `highlight_items_title_uid_foreign`(`title_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `highlights` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `index` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoices` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `item_type` VARCHAR(255) NOT NULL,
    `item_id` INTEGER UNSIGNED NOT NULL,
    `payment_invoice_id` VARCHAR(255) NOT NULL,
    `user_uid` INTEGER UNSIGNED NOT NULL,
    `payment_gateway_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL,
    `expire_at` TIMESTAMP(0) NULL,
    `paid_at` TIMESTAMP(0) NULL,

    INDEX `invoices_payment_gateway_id_foreign`(`payment_gateway_id`),
    INDEX `invoices_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `medias` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `episode_uid` INTEGER UNSIGNED NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `metadata` JSON NOT NULL,
    `status` VARCHAR(255) NOT NULL,

    INDEX `medias_episode_uid_foreign`(`episode_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `members` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `memberships` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_uid` INTEGER UNSIGNED NOT NULL,
    `end_at` DATETIME(0) NOT NULL,
    `pro_pack_id` INTEGER UNSIGNED NULL,
    `begin_at` DATETIME(0) NOT NULL,

    INDEX `memberships_pro_pack_id_foreign`(`pro_pack_id`),
    INDEX `memberships_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migrations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `migration` VARCHAR(255) NOT NULL,
    `batch` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `password_resets` (
    `email` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,

    INDEX `password_resets_email_index`(`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment_gateways` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `item_type` VARCHAR(255) NOT NULL,
    `method` VARCHAR(255) NOT NULL,
    `is_smurf` BOOLEAN NOT NULL,
    `metadata` JSON NOT NULL,
    `deleted_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `premium_accesses` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `premium_uid` INTEGER UNSIGNED NOT NULL,
    `user_uid` INTEGER UNSIGNED NOT NULL,
    `begin_at` DATETIME(0) NOT NULL,
    `end_at` DATETIME(0) NULL,

    INDEX `premium_accesses_premium_uid_foreign`(`premium_uid`),
    INDEX `premium_accesses_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `premium_titles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `premium_uid` INTEGER UNSIGNED NOT NULL,
    `title_uid` INTEGER UNSIGNED NOT NULL,

    INDEX `premium_titles_premium_uid_foreign`(`premium_uid`),
    INDEX `premium_titles_title_uid_foreign`(`title_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `premiums` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `price` INTEGER NOT NULL,
    `period_hours` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `deal_uid` INTEGER UNSIGNED NULL,

    INDEX `premiums_deal_uid_foreign`(`deal_uid`),
    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pro_packs` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `duration` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `level` INTEGER NOT NULL,
    `deleted_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `push_notifications` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `title_uid` INTEGER UNSIGNED NOT NULL,
    `user_uid` INTEGER UNSIGNED NOT NULL,
    `meta` JSON NOT NULL,
    `data` JSON NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `push_notifications_title_uid_foreign`(`title_uid`),
    INDEX `push_notifications_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `restrictions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `franchise_uid` INTEGER UNSIGNED NULL,
    `type` VARCHAR(255) NOT NULL,

    INDEX `restrictions_franchise_uid_foreign`(`franchise_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `titles` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `franchise_uid` INTEGER UNSIGNED NOT NULL,
    `index` INTEGER NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `name_mn` VARCHAR(255) NOT NULL,
    `total_ep` INTEGER NULL,
    `status` VARCHAR(255) NOT NULL DEFAULT 'ongoing',
    `plot` LONGTEXT NULL,
    `images` JSON NOT NULL,
    `created_at` DATETIME(0) NOT NULL,

    INDEX `titles_franchise_uid_foreign`(`franchise_uid`),
    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transactions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `amount` DECIMAL(10, 2) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `membership_id` INTEGER UNSIGNED NULL,
    `description` VARCHAR(255) NULL,
    `bank_account_number` VARCHAR(255) NULL,
    `refund_fee` INTEGER NULL,
    `payment_gateway_id` INTEGER UNSIGNED NULL,

    INDEX `transactions_membership_id_foreign`(`membership_id`),
    INDEX `transactions_payment_gateway_id_foreign`(`payment_gateway_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `uid` INTEGER UNSIGNED NOT NULL,
    `email` VARCHAR(255) NULL,
    `password` VARCHAR(255) NULL,
    `role` INTEGER NOT NULL,
    `remember_token` VARCHAR(100) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`uid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `views` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `episode_uid` INTEGER UNSIGNED NOT NULL,
    `user_uid` INTEGER UNSIGNED NULL,
    `created_at` DATETIME(0) NULL,

    INDEX `views_episode_uid_foreign`(`episode_uid`),
    INDEX `views_user_uid_foreign`(`user_uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `auth_providers` ADD CONSTRAINT `auth_providers_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cards` ADD CONSTRAINT `cards_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cards` ADD CONSTRAINT `cards_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `contributions` ADD CONSTRAINT `contributions_episode_uid_foreign` FOREIGN KEY (`episode_uid`) REFERENCES `episodes`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `contributions` ADD CONSTRAINT `contributions_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `deal_shares` ADD CONSTRAINT `deal_shares_deal_uid_foreign` FOREIGN KEY (`deal_uid`) REFERENCES `deals`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `deal_shares` ADD CONSTRAINT `deal_shares_distributor_uid_foreign` FOREIGN KEY (`distributor_uid`) REFERENCES `distributors`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `entries` ADD CONSTRAINT `entries_franchise_uid_foreign` FOREIGN KEY (`franchise_uid`) REFERENCES `franchises`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `entries` ADD CONSTRAINT `entries_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `episodes` ADD CONSTRAINT `episodes_title_uid_foreign` FOREIGN KEY (`title_uid`) REFERENCES `titles`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `fcm_tokens` ADD CONSTRAINT `fcm_tokens_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `franchise_genres` ADD CONSTRAINT `franchise_genres_franchise_uid_foreign` FOREIGN KEY (`franchise_uid`) REFERENCES `franchises`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `franchise_genres` ADD CONSTRAINT `franchise_genres_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `gifts` ADD CONSTRAINT `gifts_issue_user_uid_foreign` FOREIGN KEY (`issue_user_uid`) REFERENCES `users`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `gifts` ADD CONSTRAINT `gifts_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `gifts` ADD CONSTRAINT `gifts_pro_pack_id_foreign` FOREIGN KEY (`pro_pack_id`) REFERENCES `pro_packs`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `highlight_items` ADD CONSTRAINT `highlight_items_franchise_uid_foreign` FOREIGN KEY (`franchise_uid`) REFERENCES `franchises`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `highlight_items` ADD CONSTRAINT `highlight_items_highlight_id_foreign` FOREIGN KEY (`highlight_id`) REFERENCES `highlights`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `highlight_items` ADD CONSTRAINT `highlight_items_title_uid_foreign` FOREIGN KEY (`title_uid`) REFERENCES `titles`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `medias` ADD CONSTRAINT `medias_episode_uid_foreign` FOREIGN KEY (`episode_uid`) REFERENCES `episodes`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `memberships` ADD CONSTRAINT `memberships_pro_pack_id_foreign` FOREIGN KEY (`pro_pack_id`) REFERENCES `pro_packs`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `memberships` ADD CONSTRAINT `memberships_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `premium_accesses` ADD CONSTRAINT `premium_accesses_premium_uid_foreign` FOREIGN KEY (`premium_uid`) REFERENCES `premiums`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `premium_accesses` ADD CONSTRAINT `premium_accesses_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `premium_titles` ADD CONSTRAINT `premium_titles_premium_uid_foreign` FOREIGN KEY (`premium_uid`) REFERENCES `premiums`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `premium_titles` ADD CONSTRAINT `premium_titles_title_uid_foreign` FOREIGN KEY (`title_uid`) REFERENCES `titles`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `premiums` ADD CONSTRAINT `premiums_deal_uid_foreign` FOREIGN KEY (`deal_uid`) REFERENCES `deals`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `push_notifications` ADD CONSTRAINT `push_notifications_title_uid_foreign` FOREIGN KEY (`title_uid`) REFERENCES `titles`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `push_notifications` ADD CONSTRAINT `push_notifications_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `restrictions` ADD CONSTRAINT `restrictions_franchise_uid_foreign` FOREIGN KEY (`franchise_uid`) REFERENCES `franchises`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `titles` ADD CONSTRAINT `titles_franchise_uid_foreign` FOREIGN KEY (`franchise_uid`) REFERENCES `franchises`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transactions` ADD CONSTRAINT `transactions_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transactions` ADD CONSTRAINT `transactions_payment_gateway_id_foreign` FOREIGN KEY (`payment_gateway_id`) REFERENCES `payment_gateways`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `views` ADD CONSTRAINT `views_episode_uid_foreign` FOREIGN KEY (`episode_uid`) REFERENCES `episodes`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `views` ADD CONSTRAINT `views_user_uid_foreign` FOREIGN KEY (`user_uid`) REFERENCES `users`(`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
