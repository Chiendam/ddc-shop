/*
  Warnings:

  - You are about to drop the column `groud_permission_id` on the `permission` table. All the data in the column will be lost.
  - Added the required column `code_group` to the `permission` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `permission` DROP FOREIGN KEY `permission_groud_permission_id_fkey`;

-- AlterTable
ALTER TABLE `permission` DROP COLUMN `groud_permission_id`,
    ADD COLUMN `code_group` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `permission` ADD CONSTRAINT `permission_code_group_fkey` FOREIGN KEY (`code_group`) REFERENCES `group_permission`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;
