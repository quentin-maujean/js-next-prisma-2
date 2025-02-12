-- Add your SQL script below
-- Assuming the timestamp is 20230401123456

CREATE TABLE IF NOT EXISTS `Article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `slug` VARCHAR(255) NOT NULL UNIQUE,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `body` TEXT NOT NULL,
  `created_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `del` BOOLEAN NOT NULL DEFAULT FALSE,
  `favorites_count` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);

ALTER TABLE `Comment`
ADD CONSTRAINT `fk_comment_article`
FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`)
ON DELETE CASCADE;

ALTER TABLE `ArticlesTags`
ADD CONSTRAINT `fk_articles_tags_article`
FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`)
ON DELETE CASCADE;