/*
  Warnings:

  - You are about to drop the column `containsDairy` on the `AllergyInformation` table. All the data in the column will be lost.
  - You are about to drop the column `containsShellfish` on the `AllergyInformation` table. All the data in the column will be lost.
  - You are about to drop the column `containsSoy` on the `AllergyInformation` table. All the data in the column will be lost.
  - You are about to drop the column `allergyInfoId` on the `IngredientType` table. All the data in the column will be lost.
  - You are about to drop the column `carbsPerUnit` on the `IngredientType` table. All the data in the column will be lost.
  - You are about to drop the column `fatsPerUnit` on the `IngredientType` table. All the data in the column will be lost.
  - You are about to drop the column `fiberPerUnit` on the `IngredientType` table. All the data in the column will be lost.
  - You are about to drop the column `minerals` on the `IngredientType` table. All the data in the column will be lost.
  - You are about to drop the column `proteinsPerUnit` on the `IngredientType` table. All the data in the column will be lost.
  - You are about to drop the column `unit` on the `IngredientType` table. All the data in the column will be lost.
  - You are about to drop the column `vitamins` on the `IngredientType` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "IngredientType" DROP CONSTRAINT "IngredientType_allergyInfoId_fkey";

-- AlterTable
ALTER TABLE "AllergyInformation" DROP COLUMN "containsDairy",
DROP COLUMN "containsShellfish",
DROP COLUMN "containsSoy",
ADD COLUMN     "containsCelery" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsCrustaceans" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsEggs" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsFish" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsLupin" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsMilk" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsMolluscs" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsMustard" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsPeanuts" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsSesameSeeds" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsSoya" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "containsSulphurDioxide" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "IngredientType" DROP COLUMN "allergyInfoId",
DROP COLUMN "carbsPerUnit",
DROP COLUMN "fatsPerUnit",
DROP COLUMN "fiberPerUnit",
DROP COLUMN "minerals",
DROP COLUMN "proteinsPerUnit",
DROP COLUMN "unit",
DROP COLUMN "vitamins";
