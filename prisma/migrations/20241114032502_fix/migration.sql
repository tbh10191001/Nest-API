/*
  Warnings:

  - You are about to drop the column `email` on the `account` table. All the data in the column will be lost.
  - You are about to drop the column `account_id` on the `customer` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[username]` on the table `account` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[email]` on the table `customer` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `username` to the `account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `customer` table without a default value. This is not possible if the table is not empty.
  - Added the required column `picture` to the `customer` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "customer" DROP CONSTRAINT "customer_account_id_fkey";

-- DropIndex
DROP INDEX "account_email_key";

-- DropIndex
DROP INDEX "customer_account_id_key";

-- AlterTable
ALTER TABLE "account" DROP COLUMN "email",
ADD COLUMN     "customerCustomerID" TEXT,
ADD COLUMN     "username" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "customer" DROP COLUMN "account_id",
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "picture" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "person" ALTER COLUMN "dob" DROP NOT NULL,
ALTER COLUMN "address" DROP NOT NULL,
ALTER COLUMN "number_phone" DROP NOT NULL,
ALTER COLUMN "created_at" DROP NOT NULL,
ALTER COLUMN "updated_at" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "account_username_key" ON "account"("username");

-- CreateIndex
CREATE UNIQUE INDEX "customer_email_key" ON "customer"("email");

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_customerCustomerID_fkey" FOREIGN KEY ("customerCustomerID") REFERENCES "customer"("customer_id") ON DELETE SET NULL ON UPDATE CASCADE;
