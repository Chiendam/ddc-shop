import { PrismaClient } from '@prisma/client'
import {permission} from '../configs/permission.config';
import {groupPermissions} from '../configs/groupPermission.config'
import { user } from '../configs/user.config';
import * as bcrypt from 'bcrypt';

const prisma = new PrismaClient()
async function main() {
  // create init data group permission
  const data = await prisma.groupPermission.createMany({
    data: groupPermissions,
    skipDuplicates: true,
  });
  const initPermission = prisma.permission.createMany({
    data: permission,
    skipDuplicates: true,
  });
  const passwrodHash = await bcrypt.hash(user.password, parseInt(process?.env?.SALT_OR_ROUNDS) || 10)
  const initUser = prisma.user.createMany({
    data: [
      {...user, password: passwrodHash}
    ],
    skipDuplicates: true,
  })

  // create init data user and permission
  await Promise.all([initPermission, initUser]);

  console.log('create data init success!')
}

main()
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });