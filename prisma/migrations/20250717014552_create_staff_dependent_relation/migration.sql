/*
  Warnings:

  - The primary key for the `staff_dependent` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "staff_dependent" DROP CONSTRAINT "staff_dependent_pkey",
ADD CONSTRAINT "staff_dependent_pkey" PRIMARY KEY ("staff_no", "dependent_name");

-- AddForeignKey
ALTER TABLE "staff_dependent" ADD CONSTRAINT "staff_dependent_staff_no_fk" FOREIGN KEY ("staff_no") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;
