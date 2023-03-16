import { ApiProperty, ApiPropertyOptional } from "@nestjs/swagger";
import { IsString, IsNotEmpty, IsOptional, IsNumber } from "class-validator";

export class CreateCategoryDto {
  @ApiProperty()
  @IsNotEmpty({ message: "Trường name hông được để trống" })
  @IsString()
  name: string;

  @ApiPropertyOptional()
  @IsOptional()
  @IsString({
    message: 'Trường parentId phải là kiểu chuỗi'
  })
  parentId?: string;

  @ApiPropertyOptional()
  @IsNumber({}, {
    message: 'Trường order phải là kiểu số'
  })
  order: number = 1;
}
