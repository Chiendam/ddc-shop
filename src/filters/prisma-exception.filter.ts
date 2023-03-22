import { Catch, ExceptionFilter, HttpException, HttpStatus, ArgumentsHost } from '@nestjs/common';
import { Prisma } from '@prisma/client';

@Catch(Prisma.PrismaClientKnownRequestError)
export class PrismaExceptionFilter implements ExceptionFilter {
  catch(error: Prisma.PrismaClientKnownRequestError, host: ArgumentsHost) {
    const context = host.switchToHttp();
    const response = context.getResponse();
    const status = HttpStatus.INTERNAL_SERVER_ERROR;

    response.status(status).json({
      statusCode: status,
      message: error.message,
      status: "error",
      data: null
    });
  }
}