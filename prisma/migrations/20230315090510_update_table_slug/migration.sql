/*
  Warnings:

  - You are about to drop the column `parent_id` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `slug_id` on the `post` table. All the data in the column will be lost.
  - You are about to drop the column `slug_id` on the `product` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[product_id]` on the table `Slug` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[post_id]` on the table `Slug` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[category_id]` on the table `Slug` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `slugableType` to the `Slug` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `category` DROP FOREIGN KEY `category_slug_id_fkey`;

-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `post_slug_id_fkey`;

-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `product_slug_id_fkey`;

-- AlterTable
ALTER TABLE `category` DROP COLUMN `parent_id`;

-- AlterTable
ALTER TABLE `post` DROP COLUMN `slug_id`;

-- AlterTable
ALTER TABLE `product` DROP COLUMN `slug_id`;

-- AlterTable
ALTER TABLE `slug` ADD COLUMN `category_id` VARCHAR(191) NULL,
    ADD COLUMN `post_id` VARCHAR(191) NULL,
    ADD COLUMN `product_id` VARCHAR(191) NULL,
    ADD COLUMN `slugableType` ENUM('POST', 'CATEGORY', 'PRODUCT') NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Slug_product_id_key` ON `Slug`(`product_id`);

-- CreateIndex
CREATE UNIQUE INDEX `Slug_post_id_key` ON `Slug`(`post_id`);

-- CreateIndex
CREATE UNIQUE INDEX `Slug_category_id_key` ON `Slug`(`category_id`);

-- AddForeignKey
ALTER TABLE `Slug` ADD CONSTRAINT `Slug_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Slug` ADD CONSTRAINT `Slug_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `category`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Slug` ADD CONSTRAINT `Slug_post_id_fkey` FOREIGN KEY (`post_id`) REFERENCES `post`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
