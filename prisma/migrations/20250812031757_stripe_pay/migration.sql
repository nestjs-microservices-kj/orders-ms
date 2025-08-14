-- AlterEnum
ALTER TYPE "public"."OrderStatus" ADD VALUE 'PAID';

-- AlterTable
ALTER TABLE "public"."Order" ADD COLUMN     "stripeChargeId" TEXT;

-- CreateTable
CREATE TABLE "public"."OrderReceipt" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "receiptUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OrderReceipt_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "OrderReceipt_orderId_key" ON "public"."OrderReceipt"("orderId");

-- AddForeignKey
ALTER TABLE "public"."OrderReceipt" ADD CONSTRAINT "OrderReceipt_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "public"."Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
