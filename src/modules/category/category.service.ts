import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { ConfigService } from '@nestjs/config';
import { createSlug } from 'helpers';
import { SLUGABLE_TYPE } from 'configs/configuration';
@Injectable()
export class CategoryService {

  constructor(private prismaService: PrismaService,
    private readonly configService: ConfigService,) {

  }

  async create(createCategoryDto: CreateCategoryDto) { // Chuẩn hóa đầu vào của body dùng data transfer object (DTO)
    return await this.prismaService.$transaction(async (prisma) => {
      const category = await prisma.category.create({
        data: createCategoryDto
      })
      await prisma.slug.create({
        data: {
          content: createSlug(category.name),
          slugableType: this.configService.get<SLUGABLE_TYPE>('SLUGABLE_TYPE.CATEGROY'),
          categoryId: category.id,
        }
      })
      return category;
    })
  }

  async findAll() {
    return await this.prismaService.category.findMany({
      select: {
        id: true,
        name: true,
        parentId: true,
      }
    })
  }

  async findOne(id: string) {
    return await this.prismaService.category.findUniqueOrThrow({
      where: {
        id
      },
      select: {
        id: true,
        name: true,
        parentId: true,
      }
    })
  }

  async update(id: string, updateCategoryDto: UpdateCategoryDto) {
    return await this.prismaService.category.update({
      where: {
        id
      }, data: {
        ...updateCategoryDto
      }
    })
  }

  async remove(id: string) {
    return await this.prismaService.category.delete({
      where: {
        id
      }
    })
  }
}
