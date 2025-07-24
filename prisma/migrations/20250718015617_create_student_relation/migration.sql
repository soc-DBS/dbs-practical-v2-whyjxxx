-- CreateTable
CREATE TABLE "_StudentCrseCode" (
    "A" VARCHAR(5) NOT NULL,
    "B" CHAR(4) NOT NULL
);

-- CreateTable
CREATE TABLE "_StudentNationality" (
    "A" VARCHAR(30) NOT NULL,
    "B" CHAR(4) NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_StudentCrseCode_AB_unique" ON "_StudentCrseCode"("A", "B");

-- CreateIndex
CREATE INDEX "_StudentCrseCode_B_index" ON "_StudentCrseCode"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_StudentNationality_AB_unique" ON "_StudentNationality"("A", "B");

-- CreateIndex
CREATE INDEX "_StudentNationality_B_index" ON "_StudentNationality"("B");

-- AddForeignKey
ALTER TABLE "_StudentCrseCode" ADD CONSTRAINT "_StudentCrseCode_A_fkey" FOREIGN KEY ("A") REFERENCES "course"("crse_code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_StudentCrseCode" ADD CONSTRAINT "_StudentCrseCode_B_fkey" FOREIGN KEY ("B") REFERENCES "student"("adm_no") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_StudentNationality" ADD CONSTRAINT "_StudentNationality_A_fkey" FOREIGN KEY ("A") REFERENCES "country"("country_name") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_StudentNationality" ADD CONSTRAINT "_StudentNationality_B_fkey" FOREIGN KEY ("B") REFERENCES "student"("adm_no") ON DELETE CASCADE ON UPDATE CASCADE;
