/*
  Warnings:

  - You are about to drop the column `allergyInfoId` on the `Recipe` table. All the data in the column will be lost.
  - You are about to drop the `AllergyInformation` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `allergyBits` to the `Recipe` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Recipe" DROP CONSTRAINT "Recipe_allergyInfoId_fkey";

-- AlterTable
ALTER TABLE "Recipe" DROP COLUMN "allergyInfoId",
ADD COLUMN     "allergyBits" BYTEA NOT NULL;

-- DropTable
DROP TABLE "AllergyInformation";
