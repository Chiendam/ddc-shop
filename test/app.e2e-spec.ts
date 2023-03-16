import { Test } from "@nestjs/testing";
import { AppModule } from "../src/app.module";
import { INestApplication, ValidationPipe } from "@nestjs/common";
import * as pactum from 'pactum';
import { PrismaService } from '../src/modules/prisma/prisma.service';

describe('App e2e tests', () => {
  //init value
  let app: INestApplication
  const PORT_TEST: number = 3011
  let prismaService: PrismaService

  //befor
  beforeAll(async () => {
    const appModule = await Test.createTestingModule({
      imports: [AppModule]
    }).compile()
    app = appModule.createNestApplication()
    app.useGlobalPipes(new ValidationPipe())
    app.setGlobalPrefix('api/v1')
    await app.init()
    await app.listen(PORT_TEST)
    prismaService = app.get(PrismaService)
    await prismaService.clearData()
    pactum.request.setBaseUrl(`http://localhost:${PORT_TEST}/api/v1`)
  })

  //after
  afterAll(async () => {
    app.close()
  })

  describe('Test module Category', () => {
    it('Get all', () => {
      return pactum.spec()
        .get(`/category`)
        .expectStatus(200)
    })
    it('Create success', () => {
      return pactum.spec()
        .post(`/category`)
        .withBody({
          name: "du lieu test",
          order: 2
        })
        .expectStatus(201)
        // .inspect() // hien thị chi tiết request và reponse
    })
    it('Create fail', () => {
      return pactum.spec()
        .post(`/category`)
        .withBody({
          name: "du lieu test",
          order: "2"
        })
        .expectStatus(400)
        .inspect() // hien thị chi tiết request và reponse
        // .stores('keyname', 'nameValue') Giống như việc repons trả về nameValue thì lưu vào localStore với keyname
    })
  })
})