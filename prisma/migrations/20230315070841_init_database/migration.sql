/*
  Warnings:

  - You are about to drop the column `status` on the `user` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[slug_id]` on the table `category` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `slug_id` to the `category` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `category` ADD COLUMN `slug_id` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `role` ADD COLUMN `description` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `status`,
    ADD COLUMN `active` BOOLEAN NOT NULL DEFAULT true;

-- CreateTable
CREATE TABLE `category_product` (
    `id` VARCHAR(191) NOT NULL,
    `category_id` VARCHAR(191) NOT NULL,
    `product_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product` (
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
    `slug_id` VARCHAR(191) NOT NULL,
    `is_hot` BOOLEAN NOT NULL,
    `create_by` VARCHAR(191) NULL,
    `update_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    UNIQUE INDEX `product_slug_id_key`(`slug_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(350) NOT NULL,
    `description` VARCHAR(350) NOT NULL,
    `content` VARCHAR(191) NOT NULL,
    `thumbnail` VARCHAR(350) NOT NULL,
    `slug_id` VARCHAR(191) NOT NULL,
    `status` BOOLEAN NOT NULL,
    `create_by` VARCHAR(191) NULL,
    `update_by` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NULL,

    UNIQUE INDEX `post_slug_id_key`(`slug_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CategoryPost` (
    `id` VARCHAR(191) NOT NULL,
    `category_id` VARCHAR(191) NOT NULL,
    `post_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Slug` (
    `id` VARCHAR(191) NOT NULL,
    `content` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `category_slug_id_key` ON `category`(`slug_id`);

-- AddForeignKey
ALTER TABLE `category` ADD CONSTRAINT `category_slug_id_fkey` FOREIGN KEY (`slug_id`) REFERENCES `Slug`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `category_product` ADD CONSTRAINT `category_product_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `category_product` ADD CONSTRAINT `category_product_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `product_slug_id_fkey` FOREIGN KEY (`slug_id`) REFERENCES `Slug`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post` ADD CONSTRAINT `post_slug_id_fkey` FOREIGN KEY (`slug_id`) REFERENCES `Slug`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CategoryPost` ADD CONSTRAINT `CategoryPost_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CategoryPost` ADD CONSTRAINT `CategoryPost_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
