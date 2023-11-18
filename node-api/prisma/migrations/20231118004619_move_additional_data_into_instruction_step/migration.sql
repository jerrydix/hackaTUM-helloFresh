/*
  Warnings:

  - You are about to drop the column `additionalInfo` on the `Ingredient` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Ingredient" DROP COLUMN "additionalInfo";

-- AlterTable
ALTER TABLE "InstructionStep" ADD COLUMN     "additionalData" JSONB;
