import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { ValidationPipe } from '@nestjs/common';
import { HttpExceptionFilter } from 'filters/http-exception.filter';
import { PrismaExceptionFilter } from './filters/prisma-exception.filter';


async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  app.setGlobalPrefix('api/v1')
  
  const config = new DocumentBuilder()
  .setTitle('ddc-shop example')
  .setDescription('The cats API ddc-shop')
  .setVersion('1.0')
  .addTag('ddc-shop')
  .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
  
  app.useGlobalPipes(new ValidationPipe());
   // use middware để sử dụng thư viện class-validator 
   // Kích hoạt PrismaExceptionFilter
   app.useGlobalFilters(new PrismaExceptionFilter());
  //  app.useGlobalFilters(new PrismaExceptionFilter());
  app.useGlobalFilters(new HttpExceptionFilter());
  
  // Register the Prisma exception filter

  await app.listen(3000);
}
bootstrap();
