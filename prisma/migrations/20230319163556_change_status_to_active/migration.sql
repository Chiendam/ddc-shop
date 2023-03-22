/*
  Warnings:

  - You are about to drop the column `status` on the `categories` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `status` on the `products` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `categories` DROP COLUMN `status`,
    ADD COLUMN `active` BOOLEAN NULL DEFAULT true;

-- AlterTable
ALTER TABLE `posts` DROP COLUMN `status`,
    ADD COLUMN `active` BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE `products` DROP COLUMN `status`,
    ADD COLUMN `active` BOOLEAN NOT NULL DEFAULT true;
