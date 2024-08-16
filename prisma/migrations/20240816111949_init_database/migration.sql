-- CreateTable
CREATE TABLE "person" (
    "person_id" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "dob" DATE NOT NULL,
    "address" TEXT NOT NULL,
    "number_phone" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "person_pkey" PRIMARY KEY ("person_id")
);

-- CreateTable
CREATE TABLE "customer" (
    "customer_id" TEXT NOT NULL,
    "account_id" TEXT NOT NULL,

    CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "staff" (
    "staff_id" TEXT NOT NULL,
    "account_id" TEXT NOT NULL,

    CONSTRAINT "staff_pkey" PRIMARY KEY ("staff_id")
);

-- CreateTable
CREATE TABLE "admin" (
    "admin_id" TEXT NOT NULL,
    "account_id" TEXT NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("admin_id")
);

-- CreateTable
CREATE TABLE "account" (
    "account_id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "role_id" TEXT NOT NULL,

    CONSTRAINT "account_pkey" PRIMARY KEY ("account_id")
);

-- CreateTable
CREATE TABLE "role" (
    "role_id" TEXT NOT NULL,
    "role_name" TEXT NOT NULL,

    CONSTRAINT "role_pkey" PRIMARY KEY ("role_id")
);

-- CreateTable
CREATE TABLE "product" (
    "product_id" TEXT NOT NULL,
    "product_name" TEXT NOT NULL,
    "product_price" BIGINT NOT NULL,
    "product_count" BIGINT NOT NULL,
    "product_note" TEXT,
    "product_image" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "type_of_product_id" TEXT NOT NULL,
    "discount_id" TEXT,

    CONSTRAINT "product_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "type_of_product" (
    "type_id" TEXT NOT NULL,
    "type_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "type_of_product_pkey" PRIMARY KEY ("type_id")
);

-- CreateTable
CREATE TABLE "discount" (
    "discount_id" TEXT NOT NULL,
    "discount_percent" INTEGER NOT NULL DEFAULT 0,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "discount_pkey" PRIMARY KEY ("discount_id")
);

-- CreateTable
CREATE TABLE "delivery_address" (
    "delivery_address_id" TEXT NOT NULL,
    "address_detail" TEXT NOT NULL,
    "number_phone" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "customer_id" TEXT NOT NULL,

    CONSTRAINT "delivery_address_pkey" PRIMARY KEY ("delivery_address_id")
);

-- CreateTable
CREATE TABLE "cart" (
    "customer_id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "product_count" INTEGER NOT NULL DEFAULT 1,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "cart_pkey" PRIMARY KEY ("customer_id","product_id")
);

-- CreateTable
CREATE TABLE "order" (
    "order_id" TEXT NOT NULL,
    "order_status" INTEGER NOT NULL DEFAULT 0,
    "order_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "customer_id" TEXT NOT NULL,

    CONSTRAINT "order_pkey" PRIMARY KEY ("order_id")
);

-- CreateTable
CREATE TABLE "order_details" (
    "order_id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "product_count" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "order_details_pkey" PRIMARY KEY ("order_id","product_id")
);

-- CreateTable
CREATE TABLE "product_receipt" (
    "receipt_id" TEXT NOT NULL,
    "receipt_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "admin_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "product_receipt_pkey" PRIMARY KEY ("receipt_id")
);

-- CreateTable
CREATE TABLE "product_receipt_details" (
    "receipt_id" TEXT NOT NULL,
    "product_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "product_receipt_details_pkey" PRIMARY KEY ("receipt_id","product_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "person_number_phone_key" ON "person"("number_phone");

-- CreateIndex
CREATE UNIQUE INDEX "customer_account_id_key" ON "customer"("account_id");

-- CreateIndex
CREATE UNIQUE INDEX "staff_account_id_key" ON "staff"("account_id");

-- CreateIndex
CREATE UNIQUE INDEX "admin_account_id_key" ON "admin"("account_id");

-- CreateIndex
CREATE UNIQUE INDEX "account_email_key" ON "account"("email");

-- CreateIndex
CREATE UNIQUE INDEX "product_product_name_key" ON "product"("product_name");

-- CreateIndex
CREATE UNIQUE INDEX "type_of_product_type_name_key" ON "type_of_product"("type_name");

-- AddForeignKey
ALTER TABLE "customer" ADD CONSTRAINT "customer_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "person"("person_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customer" ADD CONSTRAINT "customer_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("account_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staff" ADD CONSTRAINT "staff_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "person"("person_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "staff" ADD CONSTRAINT "staff_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("account_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "admin" ADD CONSTRAINT "admin_admin_id_fkey" FOREIGN KEY ("admin_id") REFERENCES "person"("person_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "admin" ADD CONSTRAINT "admin_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "account"("account_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "account" ADD CONSTRAINT "account_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("role_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_type_of_product_id_fkey" FOREIGN KEY ("type_of_product_id") REFERENCES "type_of_product"("type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "discount"("discount_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "delivery_address" ADD CONSTRAINT "delivery_address_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart" ADD CONSTRAINT "cart_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart" ADD CONSTRAINT "cart_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "order"("order_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_receipt" ADD CONSTRAINT "product_receipt_admin_id_fkey" FOREIGN KEY ("admin_id") REFERENCES "admin"("admin_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_receipt_details" ADD CONSTRAINT "product_receipt_details_receipt_id_fkey" FOREIGN KEY ("receipt_id") REFERENCES "product_receipt"("receipt_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_receipt_details" ADD CONSTRAINT "product_receipt_details_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;
