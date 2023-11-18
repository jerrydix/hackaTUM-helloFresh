-- CreateTable
CREATE TABLE "_liked_by" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_disliked_by" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_liked_by_AB_unique" ON "_liked_by"("A", "B");

-- CreateIndex
CREATE INDEX "_liked_by_B_index" ON "_liked_by"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_disliked_by_AB_unique" ON "_disliked_by"("A", "B");

-- CreateIndex
CREATE INDEX "_disliked_by_B_index" ON "_disliked_by"("B");

-- AddForeignKey
ALTER TABLE "_liked_by" ADD CONSTRAINT "_liked_by_A_fkey" FOREIGN KEY ("A") REFERENCES "Ingredient"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_liked_by" ADD CONSTRAINT "_liked_by_B_fkey" FOREIGN KEY ("B") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_disliked_by" ADD CONSTRAINT "_disliked_by_A_fkey" FOREIGN KEY ("A") REFERENCES "Ingredient"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_disliked_by" ADD CONSTRAINT "_disliked_by_B_fkey" FOREIGN KEY ("B") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;
