/*
  Warnings:

  - You are about to drop the column `instructionId` on the `Ingredient` table. All the data in the column will be lost.
  - You are about to drop the column `unit` on the `Recipe` table. All the data in the column will be lost.
  - You are about to drop the column `instructionId` on the `Utensil` table. All the data in the column will be lost.
  - You are about to drop the `Action` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `InstructionStep` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `description` on table `Recipe` required. This step will fail if there are existing NULL values in that column.
  - Made the column `fatsPerUnit` on table `Recipe` required. This step will fail if there are existing NULL values in that column.
  - Made the column `fiberPerUnit` on table `Recipe` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Ingredient" DROP CONSTRAINT "Ingredient_instructionId_fkey";

-- DropForeignKey
ALTER TABLE "InstructionStep" DROP CONSTRAINT "InstructionStep_actionName_fkey";

-- DropForeignKey
ALTER TABLE "InstructionStep" DROP CONSTRAINT "InstructionStep_recipeId_fkey";

-- DropForeignKey
ALTER TABLE "Utensil" DROP CONSTRAINT "Utensil_instructionId_fkey";

-- AlterTable
ALTER TABLE "Ingredient" DROP COLUMN "instructionId";

-- AlterTable
ALTER TABLE "Recipe" DROP COLUMN "unit",
ALTER COLUMN "description" SET NOT NULL,
ALTER COLUMN "fatsPerUnit" SET NOT NULL,
ALTER COLUMN "fiberPerUnit" SET NOT NULL,
ALTER COLUMN "fiberPerUnit" SET DEFAULT 0;

-- AlterTable
ALTER TABLE "Utensil" DROP COLUMN "instructionId";

-- DropTable
DROP TABLE "Action";

-- DropTable
DROP TABLE "InstructionStep";

-- DropEnum
DROP TYPE "Duration";
