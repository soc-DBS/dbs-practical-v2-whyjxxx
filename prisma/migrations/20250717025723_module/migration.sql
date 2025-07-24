/*
  Warnings:

  - The primary key for the `pre_requisite` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `stud_mod_performance` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "pre_requisite" DROP CONSTRAINT "pre_requisite_pkey",
ADD CONSTRAINT "pre_requisite_pkey" PRIMARY KEY ("mod_code", "requisite");

-- AlterTable
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_pkey",
ADD CONSTRAINT "stud_mod_performance_pkey" PRIMARY KEY ("adm_no", "mod_registered");

-- CreateTable
CREATE TABLE "module" (
    "mod_code" CHAR(4) NOT NULL,
    "mod_name" VARCHAR(100) NOT NULL,
    "credit_unit" INTEGER NOT NULL,
    "mod_coord" CHAR(4) NOT NULL,

    CONSTRAINT "module_pkey" PRIMARY KEY ("mod_code")
);

-- AddForeignKey
ALTER TABLE "department" ADD CONSTRAINT "dept_hod_fk" FOREIGN KEY ("hod") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "staff" ADD CONSTRAINT "staff_dept_code_fk" FOREIGN KEY ("dept_code") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;
