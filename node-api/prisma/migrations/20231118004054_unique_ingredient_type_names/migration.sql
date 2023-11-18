/*
  Warnings:

  - You are about to drop the column `ingredientTypeId` on the `Ingredient` table. All the data in the column will be lost.
  - The primary key for the `IngredientType` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `IngredientType` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `IngredientType` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `ingredientType` to the `Ingredient` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Ingredient" DROP CONSTRAINT "Ingredient_ingredientTypeId_fkey";

-- AlterTable
ALTER TABLE "Ingredient" DROP COLUMN "ingredientTypeId",
ADD COLUMN     "ingredientType" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "IngredientType" DROP CONSTRAINT "IngredientType_pkey",
DROP COLUMN "id";

-- CreateIndex
CREATE UNIQUE INDEX "IngredientType_name_key" ON "IngredientType"("name");

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_ingredientType_fkey" FOREIGN KEY ("ingredientType") REFERENCES "IngredientType"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
