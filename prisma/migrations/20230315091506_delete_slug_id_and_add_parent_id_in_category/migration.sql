/*
  Warnings:

  - You are about to drop the column `slug_id` on the `category` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `category_slug_id_key` ON `category`;

-- AlterTable
ALTER TABLE `category` DROP COLUMN `slug_id`,
    ADD COLUMN `parent_id` VARCHAR(191) NULL;
