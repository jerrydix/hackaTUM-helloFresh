import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from "@nestjs/swagger";

import * as session from 'express-session';
import { ConfigService } from "@nestjs/config";

(async () => {
  const app = await NestFactory.create(AppModule);
  const configService = app.get(ConfigService);

  // noinspection SpellCheckingInspection
  app.use(session({
    secret: configService.get<string>('SESSION_SECRET')!,
    resave: false,
    saveUninitialized: false
  }));

  const config = new DocumentBuilder()
    .setTitle('HellOrange')
    .setDescription('A Culinary API')
    .setVersion('1.0.0')
    .addTag('Ingredient')
    .addTag('Recipe')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);

  await app.listen(3000);
})();
