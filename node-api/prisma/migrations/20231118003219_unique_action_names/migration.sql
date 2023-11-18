/*
  Warnings:

  - The primary key for the `Action` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Action` table. All the data in the column will be lost.
  - You are about to drop the column `actionId` on the `InstructionStep` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Action` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `actionName` to the `InstructionStep` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "InstructionStep" DROP CONSTRAINT "InstructionStep_actionId_fkey";

-- AlterTable
ALTER TABLE "Action" DROP CONSTRAINT "Action_pkey",
DROP COLUMN "id";

-- AlterTable
ALTER TABLE "InstructionStep" DROP COLUMN "actionId",
ADD COLUMN     "actionName" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Action_name_key" ON "Action"("name");

-- AddForeignKey
ALTER TABLE "InstructionStep" ADD CONSTRAINT "InstructionStep_actionName_fkey" FOREIGN KEY ("actionName") REFERENCES "Action"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
