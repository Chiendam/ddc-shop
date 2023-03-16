import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { ConfigService } from '@nestjs/config';
@Injectable()
export class CategoryService {

  constructor(private prismaService: PrismaService,
    private readonly configService: ConfigService,){

  }

  async create(createCategoryDto: CreateCategoryDto) { // Chuẩn hóa đầu vào của body dùng data transfer object (DTO)
    const category = await this.prismaService.category.create({
      data: createCategoryDto
    })
    return category;
  }

  async findAll() {
    return await this.prismaService.category.findMany()
  }

  findOne(id: number) {
    return `This action returns a #${id} category`;
  }

  update(id: number, updateCategoryDto: UpdateCategoryDto) {
    return `This action updates a #${id} category`;
  }

  remove(id: number) {
    return `This action removes a #${id} category`;
  }
}
