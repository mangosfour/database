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
    SET @cOldContent = '011';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '14';
    SET @cNewContent = '012';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix startup pt4';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix startup pt4';

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

DELETE FROM `spell_chain` WHERE spell_Id= 587;
DELETE FROM `spell_chain` WHERE spell_Id= 597;
DELETE FROM `spell_chain` WHERE spell_Id= 990;
DELETE FROM `spell_chain` WHERE spell_Id= 3552;
DELETE FROM `spell_chain` WHERE spell_Id= 5504;
DELETE FROM `spell_chain` WHERE spell_Id= 5505;
DELETE FROM `spell_chain` WHERE spell_Id= 5506;
DELETE FROM `spell_chain` WHERE spell_Id= 6127;
DELETE FROM `spell_chain` WHERE spell_Id= 6129;
DELETE FROM `spell_chain` WHERE spell_Id= 10053;
DELETE FROM `spell_chain` WHERE spell_Id= 10054;
DELETE FROM `spell_chain` WHERE spell_Id= 10138;
DELETE FROM `spell_chain` WHERE spell_Id= 10139;
DELETE FROM `spell_chain` WHERE spell_Id= 10140;
DELETE FROM `spell_chain` WHERE spell_Id= 10144;
DELETE FROM `spell_chain` WHERE spell_Id= 10145;
DELETE FROM `spell_chain` WHERE spell_Id= 20116;
DELETE FROM `spell_chain` WHERE spell_Id= 27090;
DELETE FROM `spell_chain` WHERE spell_Id= 27101;
DELETE FROM `spell_chain` WHERE spell_Id= 27813;
DELETE FROM `spell_chain` WHERE spell_Id= 27817;
DELETE FROM `spell_chain` WHERE spell_Id= 27818;
DELETE FROM `spell_chain` WHERE spell_Id= 28612;
DELETE FROM `spell_chain` WHERE spell_Id= 33717;
DELETE FROM `spell_chain` WHERE spell_Id= 37420;
DELETE FROM `spell_chain` WHERE spell_Id= 42985;
DELETE FROM `spell_chain` WHERE spell_Id= 53672;

DELETE FROM `spell_elixir` WHERE entry= 834;
DELETE FROM `spell_elixir` WHERE entry= 3157;
DELETE FROM `spell_elixir` WHERE entry= 3158;
DELETE FROM `spell_elixir` WHERE entry= 3159;
DELETE FROM `spell_elixir` WHERE entry= 3161;
DELETE FROM `spell_elixir` WHERE entry= 3162;
DELETE FROM `spell_elixir` WHERE entry= 3163;
DELETE FROM `spell_elixir` WHERE entry= 3221;
DELETE FROM `spell_elixir` WHERE entry= 11330;
DELETE FROM `spell_elixir` WHERE entry= 11331;
DELETE FROM `spell_elixir` WHERE entry= 11332;
DELETE FROM `spell_elixir` WHERE entry= 11333;
DELETE FROM `spell_elixir` WHERE entry= 11393;
DELETE FROM `spell_elixir` WHERE entry= 11394;
DELETE FROM `spell_elixir` WHERE entry= 11395;
DELETE FROM `spell_elixir` WHERE entry= 11404;
DELETE FROM `spell_elixir` WHERE entry= 60345;

DELETE FROM `spell_learn_spell` WHERE entry= 17002;
DELETE FROM `spell_learn_spell` WHERE entry= 24866;
DELETE FROM `spell_learn_spell` WHERE entry= 33872;
DELETE FROM `spell_learn_spell` WHERE entry= 80388;
DELETE FROM `spell_learn_spell` WHERE entry= 86467;
DELETE FROM `spell_learn_spell` WHERE entry= 86530;
DELETE FROM `spell_learn_spell` WHERE entry= 87491;
DELETE FROM `spell_learn_spell` WHERE entry= 87492;
DELETE FROM `spell_learn_spell` WHERE entry= 87493;
DELETE FROM `spell_learn_spell` WHERE entry= 87494;
DELETE FROM `spell_learn_spell` WHERE entry= 87495;
DELETE FROM `spell_learn_spell` WHERE entry= 87496;
DELETE FROM `spell_learn_spell` WHERE entry= 87497;
DELETE FROM `spell_learn_spell` WHERE entry= 87498;
DELETE FROM `spell_learn_spell` WHERE entry= 87500;
DELETE FROM `spell_learn_spell` WHERE entry= 87505;
DELETE FROM `spell_learn_spell` WHERE entry= 87506;
DELETE FROM `spell_learn_spell` WHERE entry= 87509;

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
