import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as cors from 'cors';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);


  app.use(
    cors({
      methods: ['GET', 'HEAD', 'PUT', 'PATCH', 'POST', 'DELETE'],
      origin: true,
      preflightContinue: false,
      optionsSuccessStatus: 204,
    }),
  );
  await app.listen(3000);
}
bootstrap();
