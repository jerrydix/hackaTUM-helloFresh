/*
  Warnings:

  - The primary key for the `Utensil` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Utensil` table. All the data in the column will be lost.
  - Added the required column `duration` to the `Recipe` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "OrderSize" AS ENUM ('SMALL', 'MEDIUM', 'LARGE');

-- AlterTable
ALTER TABLE "Recipe" ADD COLUMN     "duration" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Utensil" DROP CONSTRAINT "Utensil_pkey",
DROP COLUMN "id",
ADD CONSTRAINT "Utensil_pkey" PRIMARY KEY ("name");

-- CreateTable
CREATE TABLE "Profile" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "allergyBits" BYTEA NOT NULL,
    "orderSize" "OrderSize" NOT NULL DEFAULT 'SMALL',

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_RecipeToUtensil" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_name_key" ON "Profile"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_RecipeToUtensil_AB_unique" ON "_RecipeToUtensil"("A", "B");

-- CreateIndex
CREATE INDEX "_RecipeToUtensil_B_index" ON "_RecipeToUtensil"("B");

-- AddForeignKey
ALTER TABLE "_RecipeToUtensil" ADD CONSTRAINT "_RecipeToUtensil_A_fkey" FOREIGN KEY ("A") REFERENCES "Recipe"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RecipeToUtensil" ADD CONSTRAINT "_RecipeToUtensil_B_fkey" FOREIGN KEY ("B") REFERENCES "Utensil"("name") ON DELETE CASCADE ON UPDATE CASCADE;
