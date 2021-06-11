-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '21'; 
    SET @cOldStructure = '14'; 
    SET @cOldContent = '008';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '14';
    SET @cNewContent = '009';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix startup pt1';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix startup pt1';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -


ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskD0` INT(10) UNSIGNED AFTER `SpellFamilyMaskC2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskD1` INT(10) UNSIGNED AFTER `SpellFamilyMaskD0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskD2` INT(10) UNSIGNED AFTER `SpellFamilyMaskD1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskE0` INT(10) UNSIGNED AFTER `SpellFamilyMaskD2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskE1` INT(10) UNSIGNED AFTER `SpellFamilyMaskE0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskE2` INT(10) UNSIGNED AFTER `SpellFamilyMaskE1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskF0` INT(10) UNSIGNED AFTER `SpellFamilyMaskE2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskF1` INT(10) UNSIGNED AFTER `SpellFamilyMaskF0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskF2` INT(10) UNSIGNED AFTER `SpellFamilyMaskF1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskG0` INT(10) UNSIGNED AFTER `SpellFamilyMaskF2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskG1` INT(10) UNSIGNED AFTER `SpellFamilyMaskG0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskG2` INT(10) UNSIGNED AFTER `SpellFamilyMaskG1`;

ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskH0` INT(10) UNSIGNED AFTER `SpellFamilyMaskG2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskH1` INT(10) UNSIGNED AFTER `SpellFamilyMaskH0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskH2` INT(10) UNSIGNED AFTER `SpellFamilyMaskH1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskI0` INT(10) UNSIGNED AFTER `SpellFamilyMaskH2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskI1` INT(10) UNSIGNED AFTER `SpellFamilyMaskI0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskI2` INT(10) UNSIGNED AFTER `SpellFamilyMaskI1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskJ0` INT(10) UNSIGNED AFTER `SpellFamilyMaskI2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskJ1` INT(10) UNSIGNED AFTER `SpellFamilyMaskJ0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskJ2` INT(10) UNSIGNED AFTER `SpellFamilyMaskJ1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskK0` INT(10) UNSIGNED AFTER `SpellFamilyMaskJ2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskK1` INT(10) UNSIGNED AFTER `SpellFamilyMaskK0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskK2` INT(10) UNSIGNED AFTER `SpellFamilyMaskK1`;

ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskL0` INT(10) UNSIGNED AFTER `SpellFamilyMaskK2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskL1` INT(10) UNSIGNED AFTER `SpellFamilyMaskL0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskL2` INT(10) UNSIGNED AFTER `SpellFamilyMaskL1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskM0` INT(10) UNSIGNED AFTER `SpellFamilyMaskL2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskM1` INT(10) UNSIGNED AFTER `SpellFamilyMaskM0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskM2` INT(10) UNSIGNED AFTER `SpellFamilyMaskM1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskN0` INT(10) UNSIGNED AFTER `SpellFamilyMaskM2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskN1` INT(10) UNSIGNED AFTER `SpellFamilyMaskN0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskN2` INT(10) UNSIGNED AFTER `SpellFamilyMaskN1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskO0` INT(10) UNSIGNED AFTER `SpellFamilyMaskN2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskO1` INT(10) UNSIGNED AFTER `SpellFamilyMaskO0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskO2` INT(10) UNSIGNED AFTER `SpellFamilyMaskO1`;

ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskP0` INT(10) UNSIGNED AFTER `SpellFamilyMaskO2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskP1` INT(10) UNSIGNED AFTER `SpellFamilyMaskP0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskP2` INT(10) UNSIGNED AFTER `SpellFamilyMaskP1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskQ0` INT(10) UNSIGNED AFTER `SpellFamilyMaskP2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskQ1` INT(10) UNSIGNED AFTER `SpellFamilyMaskQ0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskQ2` INT(10) UNSIGNED AFTER `SpellFamilyMaskQ1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskR0` INT(10) UNSIGNED AFTER `SpellFamilyMaskQ2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskR1` INT(10) UNSIGNED AFTER `SpellFamilyMaskR0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskR2` INT(10) UNSIGNED AFTER `SpellFamilyMaskR1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskS0` INT(10) UNSIGNED AFTER `SpellFamilyMaskR2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskS1` INT(10) UNSIGNED AFTER `SpellFamilyMaskS0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskS2` INT(10) UNSIGNED AFTER `SpellFamilyMaskS1`;

ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskT0` INT(10) UNSIGNED AFTER `SpellFamilyMaskS2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskT1` INT(10) UNSIGNED AFTER `SpellFamilyMaskT0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskT2` INT(10) UNSIGNED AFTER `SpellFamilyMaskT1`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskU0` INT(10) UNSIGNED AFTER `SpellFamilyMaskT2`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskU1` INT(10) UNSIGNED AFTER `SpellFamilyMaskU0`;
ALTER TABLE `spell_proc_event` ADD COLUMN `SpellFamilyMaskU2` INT(10) UNSIGNED AFTER `SpellFamilyMaskU1`;


        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;
        ELSE
            COMMIT;
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;
