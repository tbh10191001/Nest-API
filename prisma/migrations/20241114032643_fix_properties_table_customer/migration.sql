/*
  Warnings:

  - Added the required column `display_name` to the `customer` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "customer" ADD COLUMN     "display_name" TEXT NOT NULL;
