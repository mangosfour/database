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
    SET @cOldVersion = '22';
    SET @cOldStructure = '05';
    SET @cOldContent = '004';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '05';
    SET @cNewContent = '005';
                            -- DESCRIPTION IS 30 Characters MAX
    SET @cNewDescription = 'Cleanup_1';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Cleanup_1';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @oldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @newResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @oldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        DELETE FROM `spell_chain` WHERE first_spell=587 OR prev_spell=587 OR spell_id=587;
        DELETE FROM `spell_chain` WHERE first_spell=597 OR prev_spell=597 OR spell_id=597;
        DELETE FROM `spell_chain` WHERE first_spell=990 OR prev_spell=990 OR spell_id=990;
        DELETE FROM `spell_chain` WHERE first_spell=3552 OR prev_spell=3552 OR spell_id=3552;
        DELETE FROM `spell_chain` WHERE first_spell=5504 OR prev_spell=5504 OR spell_id=5504;
        DELETE FROM `spell_chain` WHERE first_spell=5505 OR prev_spell=5505 OR spell_id=5505;
        DELETE FROM `spell_chain` WHERE first_spell=5506 OR prev_spell=5506 OR spell_id=5506;
        DELETE FROM `spell_chain` WHERE first_spell=6127 OR prev_spell=6127 OR spell_id=6127;
        DELETE FROM `spell_chain` WHERE first_spell=6129 OR prev_spell=6129 OR spell_id=6129;
        DELETE FROM `spell_chain` WHERE first_spell=10053 OR prev_spell=10053 OR spell_id=10053;
        DELETE FROM `spell_chain` WHERE first_spell=10054 OR prev_spell=10054 OR spell_id=10054;
        DELETE FROM `spell_chain` WHERE first_spell=10138 OR prev_spell=10138 OR spell_id=10138;
        DELETE FROM `spell_chain` WHERE first_spell=10139 OR prev_spell=10139 OR spell_id=10139;
        DELETE FROM `spell_chain` WHERE first_spell=10140 OR prev_spell=10140 OR spell_id=10140;
        DELETE FROM `spell_chain` WHERE first_spell=10144 OR prev_spell=10144 OR spell_id=10144;
        DELETE FROM `spell_chain` WHERE first_spell=10145 OR prev_spell=10145 OR spell_id=10145;
        DELETE FROM `spell_chain` WHERE first_spell=20116 OR prev_spell=20116 OR spell_id=20116;
        DELETE FROM `spell_chain` WHERE first_spell=27090 OR prev_spell=27090 OR spell_id=27090;
        DELETE FROM `spell_chain` WHERE first_spell=27101 OR prev_spell=27101 OR spell_id=27101;
        DELETE FROM `spell_chain` WHERE first_spell=27813 OR prev_spell=27813 OR spell_id=27813;
        DELETE FROM `spell_chain` WHERE first_spell=27817 OR prev_spell=27817 OR spell_id=27817;
        DELETE FROM `spell_chain` WHERE first_spell=27818 OR prev_spell=27818 OR spell_id=27818;
        DELETE FROM `spell_chain` WHERE first_spell=28612 OR prev_spell=28612 OR spell_id=28612;
        DELETE FROM `spell_chain` WHERE first_spell=33717 OR prev_spell=33717 OR spell_id=33717;
        DELETE FROM `spell_chain` WHERE first_spell=37420 OR prev_spell=37420 OR spell_id=37420;
        DELETE FROM `spell_chain` WHERE first_spell=42985 OR prev_spell=42985 OR spell_id=42985;
        DELETE FROM `spell_chain` WHERE first_spell=53672 OR prev_spell=53672 OR spell_id=53672;

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
            SET @newResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@newResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @newResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@oldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @oldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@oldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@oldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
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
