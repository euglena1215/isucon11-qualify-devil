ALTER TABLE `isu_condition` ADD `condition_level` CHAR(36) NOT NULL;

UPDATE `isu_condition` SET `condition_level` = 'info' WHERE (LENGTH(`condition`) - LENGTH(REPLACE(`condition`, '=true', ''))) / LENGTH('=true') = 0;
UPDATE `isu_condition` SET `condition_level` = 'warning' WHERE (LENGTH(`condition`) - LENGTH(REPLACE(`condition`, '=true', ''))) / LENGTH('=true') IN (1,2);
UPDATE `isu_condition` SET `condition_level` = 'critical' WHERE (LENGTH(`condition`) - LENGTH(REPLACE(`condition`, '=true', ''))) / LENGTH('=true') = 3;
