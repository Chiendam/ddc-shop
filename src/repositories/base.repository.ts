// import { Injectable } from '@nestjs/common';
// import { PrismaService } from '../modules/prisma/prisma.service';
// import { BaseRepositoryInterface } from './baseInterface.repositor';

// @Injectable()
// export class BaseRepository<T> implements BaseRepositoryInterface<T> {
//   constructor(private readonly prisma: PrismaService) { }
//   getModelName(): string {
//     // Lấy tên model từ tên của Repository
//     const { name } = Object.getPrototypeOf(this).constructor;
//     return name.replace('Repository', '');
//   }

//   getModel(): any {
//     return this.getModelName();
//   }

//   make(withs: string[]): any {
//     let query = this.prisma[this.getModelName()];
//     if (withs.length > 0) {
//       query = query.findMany({
//         include: {
//           [withs.join('.')]: true,
//         },
//       });
//     }
//     return query;
//   }

//   all(columns: string[], relations: string[]): any {
//     let query = this.prisma[this.getModelName()].findMany({
//       select: {
//         [columns.join('.')]: true,
//       },
//     });
//     if (relations.length > 0) {
//       query = query.include({
//         [relations.join('.')]: true,
//       });
//     }
//     return query;
//   }

//   allBy(condition: string[], relations: string[], columns: string[]): any {
//     let query = this.prisma[this.getModelName()].findMany({
//       where: {
//         [condition[0]]: {
//           [condition[1]]: condition[2],
//         },
//       },
//       select: {
//         [columns.join('.')]: true,
//       },
//     });
//     if (relations.length > 0) {
//       query = query.include({
//         [relations.join('.')]: true,
//       });
//     }
//     return query;
//   }

//   getListPaginateBy(
//     condition: string[],
//     relations: string[],
//     columns: string[],
//     paginate: number,
//   ): any {
//     let query = this.prisma[this.getModelName()].findMany({
//       where: {
//         [condition[0]]: {
//           [condition[1]]: condition[2],
//         },
//       },
//       select: {
//         [columns.join('.')]: true,
//       },
//       take: paginate,
//       skip: paginate,
//     });
//     if (relations.length > 0) {
//       query = query.include({
//         [relations.join('.')]: true,
//       });
//     }
//     return query;
//   }

//   getFirstBy(condition: string[], columns: string[], relations: string[]): any {
//     let query = this.prisma[this.getModelName()].findFirst({
//       where: {
//         [condition[0]]: {
//           [condition[1]]: condition[2],
//         },
//       },
//       select: {
//         [columns.join('.')]: true,
//       },
//     });
//     if (relations.length > 0) {
//       query = query.include({
//         [relations.join('.')]: true,
//       });
//     }
//     return query;
//   }

//   firstOrCreate(data: any, withs: string[]): any {
//     let query = this.prisma[this.getModelName()].upsert({
//       where: data,
//       update: data,
//       create: data,
//       include: {
//         [withs.join('.')]: true,
//       },
//     });
//     return query;
//   }

//   findById(id: number, columns: string[], relations: string[], append: string[]): any {
//     let query = this.prisma[this.getModelName()].findFirst({
//       where: {
//         id: id,
//       },
//       select: {
//         [columns.join('.')]: true,
//       },
//     });
//     if (relations.length > 0) {
//       query = query.include({
//         [relations.join('.')]: true,
//       });
//     }
//   }
// }