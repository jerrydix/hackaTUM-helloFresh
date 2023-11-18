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

  /* potential (temp) fix to CORS */
  app.enableCors({
    origin: '*',
    methods: 'POST, PUT, DELETE, GET, OPTIONS',
    allowedHeaders: 'Origin, X-Requested-With, Content-Type, Accept, Authorization',
    maxAge: 1728000
  });

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
