-- CreateEnum
CREATE TYPE "Difficulty" AS ENUM ('EASY', 'MEDIUM', 'HARD');

-- AlterTable
ALTER TABLE "Recipe" ADD COLUMN     "difficulty" "Difficulty" NOT NULL DEFAULT 'MEDIUM';
