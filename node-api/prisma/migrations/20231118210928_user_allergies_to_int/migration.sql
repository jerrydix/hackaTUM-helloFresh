/*
  Warnings:

  - The `allergyBits` column on the `Profile` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Profile" DROP COLUMN "allergyBits",
ADD COLUMN     "allergyBits" INTEGER NOT NULL DEFAULT 0;
