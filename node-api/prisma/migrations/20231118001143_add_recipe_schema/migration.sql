-- CreateEnum
CREATE TYPE "IngredientCategory" AS ENUM ('MEAT', 'VEGETABLE', 'FRUIT');

-- CreateEnum
CREATE TYPE "Duration" AS ENUM ('INSTANT', 'SECOND', 'MINUTE', 'HOUR', 'DAY');

-- CreateTable
CREATE TABLE "Recipe" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "imgUrl" TEXT NOT NULL,
    "description" TEXT,
    "carbsPerUnit" DOUBLE PRECISION,
    "proteinsPerUnit" DOUBLE PRECISION,
    "fatsPerUnit" DOUBLE PRECISION,
    "fiberPerUnit" DOUBLE PRECISION,
    "vitamins" JSONB,
    "minerals" JSONB,
    "unit" TEXT NOT NULL,
    "allergyInfoId" INTEGER,

    CONSTRAINT "Recipe_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InstructionStep" (
    "id" SERIAL NOT NULL,
    "recipeId" INTEGER NOT NULL,
    "actionId" INTEGER NOT NULL,
    "durationUnit" "Duration" NOT NULL DEFAULT 'INSTANT',
    "duration" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "InstructionStep_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Utensil" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "instructionId" INTEGER,

    CONSTRAINT "Utensil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ingredient" (
    "id" SERIAL NOT NULL,
    "ingredientTypeId" INTEGER NOT NULL,
    "quantity" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "additionalInfo" TEXT,
    "instructionId" INTEGER,

    CONSTRAINT "Ingredient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IngredientType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "category" "IngredientCategory" NOT NULL,
    "carbsPerUnit" DOUBLE PRECISION,
    "proteinsPerUnit" DOUBLE PRECISION,
    "fatsPerUnit" DOUBLE PRECISION,
    "fiberPerUnit" DOUBLE PRECISION,
    "vitamins" JSONB,
    "minerals" JSONB,
    "unit" TEXT NOT NULL,
    "allergyInfoId" INTEGER,

    CONSTRAINT "IngredientType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AllergyInformation" (
    "id" SERIAL NOT NULL,
    "containsNuts" BOOLEAN NOT NULL DEFAULT false,
    "containsDairy" BOOLEAN NOT NULL DEFAULT false,
    "containsGluten" BOOLEAN NOT NULL DEFAULT false,
    "containsSoy" BOOLEAN NOT NULL DEFAULT false,
    "containsShellfish" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "AllergyInformation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Action" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "template" TEXT NOT NULL,

    CONSTRAINT "Action_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_allergyInfoId_fkey" FOREIGN KEY ("allergyInfoId") REFERENCES "AllergyInformation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionStep" ADD CONSTRAINT "InstructionStep_actionId_fkey" FOREIGN KEY ("actionId") REFERENCES "Action"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InstructionStep" ADD CONSTRAINT "InstructionStep_recipeId_fkey" FOREIGN KEY ("recipeId") REFERENCES "Recipe"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Utensil" ADD CONSTRAINT "Utensil_instructionId_fkey" FOREIGN KEY ("instructionId") REFERENCES "InstructionStep"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_ingredientTypeId_fkey" FOREIGN KEY ("ingredientTypeId") REFERENCES "IngredientType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_instructionId_fkey" FOREIGN KEY ("instructionId") REFERENCES "InstructionStep"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IngredientType" ADD CONSTRAINT "IngredientType_allergyInfoId_fkey" FOREIGN KEY ("allergyInfoId") REFERENCES "AllergyInformation"("id") ON DELETE SET NULL ON UPDATE CASCADE;
