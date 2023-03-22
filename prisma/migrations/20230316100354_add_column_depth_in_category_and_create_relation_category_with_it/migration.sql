/*
  Warnings:

  - You are about to drop the column `slugableType` on the `slugs` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `categories` ADD COLUMN `depth` INTEGER NULL;

-- AlterTable
ALTER TABLE `slugs` DROP COLUMN `slugableType`,
    ADD COLUMN `slugable_type` ENUM('POST', 'CATEGORY', 'PRODUCT') NULL;

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `categories_parent_id_fkey` FOREIGN KEY (`parent_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
