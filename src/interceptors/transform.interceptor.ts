import { Injectable, NestInterceptor, ExecutionContext, CallHandler } from '@nestjs/common';
import { map } from 'rxjs/operators';

@Injectable()
export class TransformInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler) {
    return next.handle().pipe(
      map(data => {
        const message = context.switchToHttp().getResponse().statusMessage || "";
        const statusCode = context.switchToHttp().getResponse().statusCode;
        const status = statusCode >= 200 && statusCode < 300 ? "success" : "error";
        return {
          status,
          statusCode: statusCode >= 200 && statusCode < 300 ? 0 : -10001,
          message,
          data
        };
      }),
    );
  }
}