import { PartialType } from '@nestjs/mapped-types';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsBoolean, IsNotEmpty, IsNumber, IsOptional, IsString } from 'class-validator';
import { CreateCategoryDto } from './create-category.dto';

export class UpdateCategoryDto {
  @ApiPropertyOptional()
  @IsString()
  @IsOptional()
  name?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString({
    message: 'Trường parentId phải là kiểu chuỗi'
  })
  parentId?: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsBoolean({
    message: 'Trường active phải là kiểu boolean'
  })
  active?: boolean;

  @ApiPropertyOptional()
  @IsNotEmpty({ message: "Trường name hông được để trống" })
  @IsNumber({}, {
    message: 'Trường order phải là kiểu số'
  })
  order?: number;
}
