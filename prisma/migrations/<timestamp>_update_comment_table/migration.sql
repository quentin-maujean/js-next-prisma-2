-- Migration SQL that makes the change goes here.
ALTER TABLE "Comment"
ADD COLUMN IF NOT EXISTS "del" BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS "article_id" INTEGER,
ADD CONSTRAINT "fk_comment_article"
FOREIGN KEY ("article_id")
REFERENCES "Article"("id");