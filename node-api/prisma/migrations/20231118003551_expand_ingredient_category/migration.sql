/*
  Warnings:

  - The values [VEGETABLE,FRUIT] on the enum `IngredientCategory` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "IngredientCategory_new" AS ENUM ('DAIRY_AND_EGGS', 'MEAT', 'SEAFOOD', 'VEGETABLES', 'FRUITS', 'GRAINS_AND_CEREALS', 'LEGUMES', 'NUTS_AND_SEEDS', 'HERBS_AND_SPICES', 'SWEETENERS', 'OILS_AND_FATS', 'BEVERAGES', 'BAKING_AND_COOKING_INGREDIENTS', 'CONDIMENTS_AND_SAUCES', 'PROCESSED_FOODS', 'MISC');
ALTER TABLE "IngredientType" ALTER COLUMN "category" TYPE "IngredientCategory_new" USING ("category"::text::"IngredientCategory_new");
ALTER TYPE "IngredientCategory" RENAME TO "IngredientCategory_old";
ALTER TYPE "IngredientCategory_new" RENAME TO "IngredientCategory";
DROP TYPE "IngredientCategory_old";
COMMIT;
