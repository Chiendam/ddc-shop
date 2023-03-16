import { Module, Global } from '@nestjs/common';
import { PrismaService } from './prisma.service';

@Global() // this module is used global
@Module({
  providers: [PrismaService],
  exports: [PrismaService] //other modules can use prismaService
})
export class PrismaModule {}
