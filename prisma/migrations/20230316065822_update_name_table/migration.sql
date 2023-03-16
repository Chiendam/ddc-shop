/*
  Warnings:

  - You are about to drop the `category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `category_product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `categorypost` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `group_permission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `permission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `role` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `slug` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `category_product` DROP FOREIGN KEY `category_product_category_id_fkey`;

-- DropForeignKey
ALTER TABLE `category_product` DROP FOREIGN KEY `category_product_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `categorypost` DROP FOREIGN KEY `CategoryPost_category_id_fkey`;

-- DropForeignKey
ALTER TABLE `categorypost` DROP FOREIGN KEY `CategoryPost_post_id_fkey`;

-- DropForeignKey
ALTER TABLE `permission` DROP FOREIGN KEY `permission_code_group_fkey`;

-- DropForeignKey
ALTER TABLE `role_permissions` DROP FOREIGN KEY `role_permissions_permission_id_fkey`;

-- DropForeignKey
ALTER TABLE `role_permissions` DROP FOREIGN KEY `role_permissions_role_id_fkey`;

-- DropForeignKey
ALTER TABLE `slug` DROP FOREIGN KEY `Slug_category_id_fkey`;

-- DropForeignKey
ALTER TABLE `slug` DROP FOREIGN KEY `Slug_post_id_fkey`;

-- DropForeignKey
ALTER TABLE `slug` DROP FOREIGN KEY `Slug_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_role_id_fkey`;

-- DropTable
DROP TABLE `category`;

-- DropTable
DROP TABLE `category_product`;

-- DropTable
DROP TABLE `categorypost`;

-- DropTable
DROP TABLE `group_permission`;

-- DropTable
DROP TABLE `permission`;

-- DropTable
DROP TABLE `post`;

-- DropTable
DROP TABLE `product`;

-- DropTable
DROP TABLE `role`;

-- DropTable
DROP TABLE `slug`;

-- DropTable
DROP TABLE `user`;

-- CreateTable
CREATE TABLE `users` (
    `id` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `full_name` VARCHAR(191) NOT NULL,
    `phone_number` VARCHAR(191) NULL,
    `password` VARCHAR(191) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `is_super_admin` BOOLEAN NULL DEFAULT false,
    `role_id` VARCHAR(191) NULL,
    `create_by` VARCHAR(191) NULL,
    `update_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    UNIQUE INDEX `users_username_key`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roles` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `create_by` VARCHAR(191) NULL,
    `update_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permissions` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `code_group` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `group_permissions` (
    `id` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    UNIQUE INDEX `group_permissions_code_key`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `order` INTEGER NULL DEFAULT 0,
    `status` BOOLEAN NULL DEFAULT true,
    `parent_id` VARCHAR(191) NULL,
    `create_by` VARCHAR(191) NULL,
    `update_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `category_products` (
    `id` VARCHAR(191) NOT NULL,
    `category_id` VARCHAR(191) NOT NULL,
    `product_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `price` BIGINT NOT NULL,
    `import_price` BIGINT NOT NULL,
    `amount` INTEGER NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `sell_number` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL,
    `is_new` BOOLEAN NOT NULL,
    `is_sale` BOOLEAN NOT NULL,
    `is_hot` BOOLEAN NOT NULL,
    `create_by` VARCHAR(191) NULL,
    `update_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `posts` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(350) NOT NULL,
    `description` VARCHAR(350) NOT NULL,
    `content` VARCHAR(191) NOT NULL,
    `thumbnail` VARCHAR(350) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `create_by` VARCHAR(191) NULL,
    `update_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `category_posts` (
    `id` VARCHAR(191) NOT NULL,
    `category_id` VARCHAR(191) NOT NULL,
    `post_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `slugs` (
    `id` VARCHAR(191) NOT NULL,
    `content` VARCHAR(191) NOT NULL,
    `product_id` VARCHAR(191) NULL,
    `post_id` VARCHAR(191) NULL,
    `category_id` VARCHAR(191) NULL,
    `slugableType` ENUM('POST', 'CATEGORY', 'PRODUCT') NOT NULL,

    UNIQUE INDEX `slugs_product_id_key`(`product_id`),
    UNIQUE INDEX `slugs_post_id_key`(`post_id`),
    UNIQUE INDEX `slugs_category_id_key`(`category_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `permissions` ADD CONSTRAINT `permissions_code_group_fkey` FOREIGN KEY (`code_group`) REFERENCES `group_permissions`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `role_permissions` ADD CONSTRAINT `role_permissions_permission_id_fkey` FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `category_products` ADD CONSTRAINT `category_products_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `category_products` ADD CONSTRAINT `category_products_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `category_posts` ADD CONSTRAINT `category_posts_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `category_posts` ADD CONSTRAINT `category_posts_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `slugs` ADD CONSTRAINT `slugs_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `slugs` ADD CONSTRAINT `slugs_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `slugs` ADD CONSTRAINT `slugs_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
