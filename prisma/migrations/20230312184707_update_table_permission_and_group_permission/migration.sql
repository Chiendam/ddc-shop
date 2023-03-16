/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `group_permission` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `permission` DROP FOREIGN KEY `permission_groud_permission_id_fkey`;

-- AlterTable
ALTER TABLE `group_permission` ADD COLUMN `description` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `permission` ADD COLUMN `description` VARCHAR(191) NULL;

-- CreateIndex
CREATE UNIQUE INDEX `group_permission_code_key` ON `group_permission`(`code`);

-- AddForeignKey
ALTER TABLE `permission` ADD CONSTRAINT `permission_groud_permission_id_fkey` FOREIGN KEY (`groud_permission_id`) REFERENCES `group_permission`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;
