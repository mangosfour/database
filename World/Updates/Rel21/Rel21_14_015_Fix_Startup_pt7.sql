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
    SET @cOldContent = '014';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '14';
    SET @cNewContent = '015';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix startup pt7';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix startup pt7';

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

DELETE FROM `item_template` WHERE Entry= 1041; 
DELETE FROM `item_template` WHERE Entry= 11098; 
DELETE FROM `item_template` WHERE Entry= 11224; 
DELETE FROM `item_template` WHERE Entry= 13513; 
DELETE FROM `item_template` WHERE Entry= 13522; 
DELETE FROM `item_template` WHERE Entry= 16216; 
DELETE FROM `item_template` WHERE Entry= 16243; 
DELETE FROM `item_template` WHERE Entry= 20732; 
DELETE FROM `item_template` WHERE Entry= 20733; 
DELETE FROM `item_template` WHERE Entry= 22053; 
DELETE FROM `item_template` WHERE Entry= 22541; 
DELETE FROM `item_template` WHERE Entry= 22548; 
DELETE FROM `item_template` WHERE Entry= 25848; 
DELETE FROM `item_template` WHERE Entry= 25849; 
DELETE FROM `item_template` WHERE Entry= 28276; 
DELETE FROM `item_template` WHERE Entry= 28277; 
DELETE FROM `item_template` WHERE Entry= 29483; 
DELETE FROM `item_template` WHERE Entry= 29485; 
DELETE FROM `item_template` WHERE Entry= 29486; 
DELETE FROM `item_template` WHERE Entry= 29487; 
DELETE FROM `item_template` WHERE Entry= 29488; 
DELETE FROM `item_template` WHERE Entry= 29669; 
DELETE FROM `item_template` WHERE Entry= 29672; 
DELETE FROM `item_template` WHERE Entry= 29673; 
DELETE FROM `item_template` WHERE Entry= 29674; 
DELETE FROM `item_template` WHERE Entry= 29675; 
DELETE FROM `item_template` WHERE Entry= 31357; 
DELETE FROM `item_template` WHERE Entry= 33176; 
DELETE FROM `item_template` WHERE Entry= 33182; 
DELETE FROM `item_template` WHERE Entry= 33183; 
DELETE FROM `item_template` WHERE Entry= 33184; 
DELETE FROM `item_template` WHERE Entry= 33189; 
DELETE FROM `item_template` WHERE Entry= 33208; 
DELETE FROM `item_template` WHERE Entry= 33209; 
DELETE FROM `item_template` WHERE Entry= 3384; 
DELETE FROM `item_template` WHERE Entry= 3393; 
DELETE FROM `item_template` WHERE Entry= 35433; 
DELETE FROM `item_template` WHERE Entry= 35434; 
DELETE FROM `item_template` WHERE Entry= 35435; 
DELETE FROM `item_template` WHERE Entry= 35450; 
DELETE FROM `item_template` WHERE Entry= 37161; 
DELETE FROM `item_template` WHERE Entry= 37330; 
DELETE FROM `item_template` WHERE Entry= 37331; 
DELETE FROM `item_template` WHERE Entry= 37332; 
DELETE FROM `item_template` WHERE Entry= 37333; 
DELETE FROM `item_template` WHERE Entry= 37334; 
DELETE FROM `item_template` WHERE Entry= 38770; 
DELETE FROM `item_template` WHERE Entry= 38784; 
DELETE FROM `item_template` WHERE Entry= 38795; 
DELETE FROM `item_template` WHERE Entry= 38815; 
DELETE FROM `item_template` WHERE Entry= 38826; 
DELETE FROM `item_template` WHERE Entry= 38843; 
DELETE FROM `item_template` WHERE Entry= 38858; 
DELETE FROM `item_template` WHERE Entry= 38891; 
DELETE FROM `item_template` WHERE Entry= 38892; 
DELETE FROM `item_template` WHERE Entry= 38907; 
DELETE FROM `item_template` WHERE Entry= 38915; 
DELETE FROM `item_template` WHERE Entry= 38941; 
DELETE FROM `item_template` WHERE Entry= 38942; 
DELETE FROM `item_template` WHERE Entry= 38950; 
DELETE FROM `item_template` WHERE Entry= 38956; 
DELETE FROM `item_template` WHERE Entry= 38957; 
DELETE FROM `item_template` WHERE Entry= 38958; 
DELETE FROM `item_template` WHERE Entry= 38969; 
DELETE FROM `item_template` WHERE Entry= 38970; 
DELETE FROM `item_template` WHERE Entry= 38977; 
DELETE FROM `item_template` WHERE Entry= 38982; 
DELETE FROM `item_template` WHERE Entry= 38983; 
DELETE FROM `item_template` WHERE Entry= 38994; 
DELETE FROM `item_template` WHERE Entry= 38996; 
DELETE FROM `item_template` WHERE Entry= 43230; 
DELETE FROM `item_template` WHERE Entry= 43232; 
DELETE FROM `item_template` WHERE Entry= 43234; 
DELETE FROM `item_template` WHERE Entry= 44559; 
DELETE FROM `item_template` WHERE Entry= 44560; 
DELETE FROM `item_template` WHERE Entry= 44561; 
DELETE FROM `item_template` WHERE Entry= 44562; 
DELETE FROM `item_template` WHERE Entry= 44563; 
DELETE FROM `item_template` WHERE Entry= 44939; 
DELETE FROM `item_template` WHERE Entry= 45908; 
DELETE FROM `item_template` WHERE Entry= 47499; 
DELETE FROM `item_template` WHERE Entry= 47507; 
DELETE FROM `item_template` WHERE Entry= 58149; 
DELETE FROM `item_template` WHERE Entry= 65359; 
DELETE FROM `item_template` WHERE Entry= 67155; 
DELETE FROM `item_template` WHERE Entry= 72047; 
DELETE FROM `item_template` WHERE Entry= 72102; 
DELETE FROM `item_template` WHERE Entry= 72106; 
DELETE FROM `item_template` WHERE Entry= 9036; 
DELETE FROM `item_template` WHERE Entry= 905; 
DELETE FROM `item_template` WHERE Entry= 9293; 

UPDATE `item_template` SET class=0  WHERE Entry= 38691; 
UPDATE `item_template` SET class=12 WHERE Entry= 71716; 
UPDATE `item_template` SET Class=15   WHERE Entry= 11404; 
UPDATE `item_template` SET Class=15   WHERE Entry= 11407; 
UPDATE `item_template` SET Class=15   WHERE Entry= 11644; 
UPDATE `item_template` SET Class=15   WHERE Entry= 18769; 
UPDATE `item_template` SET Class=15   WHERE Entry= 18770; 
UPDATE `item_template` SET Class=15   WHERE Entry= 18771; 
UPDATE `item_template` SET Class=15   WHERE Entry= 24368; 
UPDATE `item_template` SET Class=15   WHERE Entry= 4582; 
UPDATE `item_template` SET Class=15   WHERE Entry= 5117; 
UPDATE `item_template` SET Class=15   WHERE Entry= 5134; 
UPDATE `item_template` SET class=15  WHERE Entry= 1703; 
UPDATE `item_template` SET class=15  WHERE Entry= 20475; 
UPDATE `item_template` SET class=15  WHERE Entry= 31167; 
UPDATE `item_template` SET class=15 WHERE Entry= 1081; 
UPDATE `item_template` SET class=15 WHERE Entry= 17030; 
UPDATE `item_template` SET class=15 WHERE Entry= 22537; 
UPDATE `item_template` SET class=15 WHERE Entry= 2296; 
UPDATE `item_template` SET class=15 WHERE Entry= 25846; 
UPDATE `item_template` SET class=15 WHERE Entry= 25847; 
UPDATE `item_template` SET class=15 WHERE Entry= 42468; 
UPDATE `item_template` SET class=15 WHERE Entry= 42742; 
UPDATE `item_template` SET class=15 WHERE Entry= 63388; 
UPDATE `item_template` SET class=15 WHERE Entry= 64670; 
UPDATE `item_template` SET class=15 WHERE Entry= 878; 
UPDATE `item_template` SET class=4 WHERE Entry= 8663; 
UPDATE `item_template` SET class=7  WHERE Entry= 18984; 
UPDATE `item_template` SET class=7  WHERE Entry= 18986; 
UPDATE `item_template` SET class=7  WHERE Entry= 30542; 
UPDATE `item_template` SET class=7  WHERE Entry= 30544; 
UPDATE `item_template` SET class=7  WHERE Entry= 40727; 
UPDATE `item_template` SET class=7  WHERE Entry= 40895; 
UPDATE `item_template` SET class=7  WHERE Entry= 44964; 
UPDATE `item_template` SET class=7  WHERE Entry= 48933; 
UPDATE `item_template` SET class=7  WHERE Entry= 60223; 
UPDATE `item_template` SET class=7  WHERE Entry= 60407; 
UPDATE `item_template` SET class=7  WHERE Entry= 60498; 
UPDATE `item_template` SET InventoryType=0    WHERE Entry= 40895; 
UPDATE `item_template` SET material=1  WHERE Entry= 18865; 
UPDATE `item_template` SET material=1  WHERE Entry= 18866; 
UPDATE `item_template` SET material=1  WHERE Entry= 18867; 
UPDATE `item_template` SET material=1  WHERE Entry= 18868; 
UPDATE `item_template` SET material=1  WHERE Entry= 23457; 
UPDATE `item_template` SET material=1  WHERE Entry= 23459; 
UPDATE `item_template` SET material=1  WHERE Entry= 23464; 
UPDATE `item_template` SET material=1  WHERE Entry= 23465; 
UPDATE `item_template` SET material=1  WHERE Entry= 77558; 
UPDATE `item_template` SET material=1  WHERE Entry= 77563; 
UPDATE `item_template` SET material=1  WHERE Entry= 77567; 
UPDATE `item_template` SET material=1  WHERE Entry= 77570; 
UPDATE `item_template` SET material=1  WHERE Entry= 77571; 
UPDATE `item_template` SET material=1  WHERE Entry= 77573; 
UPDATE `item_template` SET material=1  WHERE Entry= 77584; 
UPDATE `item_template` SET material=1  WHERE Entry= 77587; 
UPDATE `item_template` SET material=1 WHERE Entry= 30755; 
UPDATE `item_template` SET material=2  WHERE Entry= 27640; 
UPDATE `item_template` SET material=2  WHERE Entry= 32336; 
UPDATE `item_template` SET material=2  WHERE Entry= 34196; 
UPDATE `item_template` SET material=2  WHERE Entry= 38456; 
UPDATE `item_template` SET material=2  WHERE Entry= 39296; 
UPDATE `item_template` SET material=2  WHERE Entry= 40265; 
UPDATE `item_template` SET material=2  WHERE Entry= 45327; 
UPDATE `item_template` SET material=2  WHERE Entry= 45872; 
UPDATE `item_template` SET material=2  WHERE Entry= 46342; 
UPDATE `item_template` SET material=2  WHERE Entry= 46983; 
UPDATE `item_template` SET material=2  WHERE Entry= 46984; 
UPDATE `item_template` SET material=2  WHERE Entry= 48697; 
UPDATE `item_template` SET material=2  WHERE Entry= 48711; 
UPDATE `item_template` SET material=2  WHERE Entry= 49844; 
UPDATE `item_template` SET material=2  WHERE Entry= 50034; 
UPDATE `item_template` SET material=2  WHERE Entry= 50638; 
UPDATE `item_template` SET material=2  WHERE Entry= 50776; 
UPDATE `item_template` SET material=2  WHERE Entry= 51927; 
UPDATE `item_template` SET material=2 WHERE Entry= 46831; 
UPDATE `item_template` SET material=3  WHERE Entry= 22459; 
UPDATE `item_template` SET material=3  WHERE Entry= 22460; 
UPDATE `item_template` SET material=3  WHERE Entry= 34142; 
UPDATE `item_template` SET material=3  WHERE Entry= 34143; 
UPDATE `item_template` SET material=3  WHERE Entry= 42701; 
UPDATE `item_template` SET material=3  WHERE Entry= 42702; 
UPDATE `item_template` SET material=3  WHERE Entry= 49110; 
UPDATE `item_template` SET sheath=0 WHERE Entry= 22463; 
UPDATE `item_template` SET sheath=2 WHERE Entry= 54859; 
UPDATE `item_template` SET sheath=2 WHERE Entry= 58703; 
UPDATE `item_template` SET sheath=4 WHERE Entry= 30318; 
UPDATE `item_template` SET sheath=4 WHERE Entry= 32613; 
UPDATE `item_template` SET sheath=4 WHERE Entry= 47014; 
UPDATE `item_template` SET sheath=5 WHERE Entry= 4899; 
UPDATE `item_template` SET sheath=5 WHERE Entry= 788; 
UPDATE `item_template` SET Unk0=-1 WHERE Entry= 33442; 
UPDATE `item_template` SET Unk0=-1 WHERE Entry= 46725; 
UPDATE `item_template` SET Unk0=2  WHERE Entry= 45872; 

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
