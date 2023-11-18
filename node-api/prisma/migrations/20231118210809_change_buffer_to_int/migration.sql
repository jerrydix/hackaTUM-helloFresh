/*
  Warnings:

  - The `allergyBits` column on the `Recipe` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Recipe" DROP COLUMN "allergyBits",
ADD COLUMN     "allergyBits" INTEGER NOT NULL DEFAULT 0;
