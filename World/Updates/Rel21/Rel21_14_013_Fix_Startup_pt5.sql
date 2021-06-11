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
    SET @cOldContent = '012';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '14';
    SET @cNewContent = '013';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Fix startup pt5';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Fix startup pt5';

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


DELETE FROM `spell_proc_event` WHERE entry=3232;
DELETE FROM `spell_proc_event` WHERE entry=5952;
DELETE FROM `spell_proc_event` WHERE entry=9799;
DELETE FROM `spell_proc_event` WHERE entry=11095;
DELETE FROM `spell_proc_event` WHERE entry=11119;
DELETE FROM `spell_proc_event` WHERE entry=11180;
DELETE FROM `spell_proc_event` WHERE entry=11185;
DELETE FROM `spell_proc_event` WHERE entry=11255;
DELETE FROM `spell_proc_event` WHERE entry=12289;
DELETE FROM `spell_proc_event` WHERE entry=12298;
DELETE FROM `spell_proc_event` WHERE entry=12311;
DELETE FROM `spell_proc_event` WHERE entry=12317;
DELETE FROM `spell_proc_event` WHERE entry=12319;
DELETE FROM `spell_proc_event` WHERE entry=12322;
DELETE FROM `spell_proc_event` WHERE entry=12834;
DELETE FROM `spell_proc_event` WHERE entry=13754;
DELETE FROM `spell_proc_event` WHERE entry=13983;
DELETE FROM `spell_proc_event` WHERE entry=14156;
DELETE FROM `spell_proc_event` WHERE entry=14186;
DELETE FROM `spell_proc_event` WHERE entry=14892;
DELETE FROM `spell_proc_event` WHERE entry=16176;
DELETE FROM `spell_proc_event` WHERE entry=16180;
DELETE FROM `spell_proc_event` WHERE entry=16256;
DELETE FROM `spell_proc_event` WHERE entry=16487;
DELETE FROM `spell_proc_event` WHERE entry=16880;
DELETE FROM `spell_proc_event` WHERE entry=16952;
DELETE FROM `spell_proc_event` WHERE entry=16958;
DELETE FROM `spell_proc_event` WHERE entry=17106;
DELETE FROM `spell_proc_event` WHERE entry=17793;
DELETE FROM `spell_proc_event` WHERE entry=18094;
DELETE FROM `spell_proc_event` WHERE entry=19572;
DELETE FROM `spell_proc_event` WHERE entry=20049;
DELETE FROM `spell_proc_event` WHERE entry=20128;
DELETE FROM `spell_proc_event` WHERE entry=20131;
DELETE FROM `spell_proc_event` WHERE entry=20132;
DELETE FROM `spell_proc_event` WHERE entry=20911;
DELETE FROM `spell_proc_event` WHERE entry=23602;
DELETE FROM `spell_proc_event` WHERE entry=27811;
DELETE FROM `spell_proc_event` WHERE entry=28847;
DELETE FROM `spell_proc_event` WHERE entry=28849;
DELETE FROM `spell_proc_event` WHERE entry=29074;
DELETE FROM `spell_proc_event` WHERE entry=29441;
DELETE FROM `spell_proc_event` WHERE entry=29593;
DELETE FROM `spell_proc_event` WHERE entry=29834;
DELETE FROM `spell_proc_event` WHERE entry=30160;
DELETE FROM `spell_proc_event` WHERE entry=30293;
DELETE FROM `spell_proc_event` WHERE entry=30299;
DELETE FROM `spell_proc_event` WHERE entry=30881;
DELETE FROM `spell_proc_event` WHERE entry=31124;
DELETE FROM `spell_proc_event` WHERE entry=31569;
DELETE FROM `spell_proc_event` WHERE entry=31571;
DELETE FROM `spell_proc_event` WHERE entry=32385;
DELETE FROM `spell_proc_event` WHERE entry=32748;
DELETE FROM `spell_proc_event` WHERE entry=33142;
DELETE FROM `spell_proc_event` WHERE entry=33191;
DELETE FROM `spell_proc_event` WHERE entry=33881;
DELETE FROM `spell_proc_event` WHERE entry=34138;
DELETE FROM `spell_proc_event` WHERE entry=34139;
DELETE FROM `spell_proc_event` WHERE entry=34258;
DELETE FROM `spell_proc_event` WHERE entry=34262;
DELETE FROM `spell_proc_event` WHERE entry=34497;
DELETE FROM `spell_proc_event` WHERE entry=34935;
DELETE FROM `spell_proc_event` WHERE entry=34950;
DELETE FROM `spell_proc_event` WHERE entry=35100;
DELETE FROM `spell_proc_event` WHERE entry=42368;
DELETE FROM `spell_proc_event` WHERE entry=42370;
DELETE FROM `spell_proc_event` WHERE entry=43338;
DELETE FROM `spell_proc_event` WHERE entry=43726;
DELETE FROM `spell_proc_event` WHERE entry=43728;
DELETE FROM `spell_proc_event` WHERE entry=43737;
DELETE FROM `spell_proc_event` WHERE entry=43739;
DELETE FROM `spell_proc_event` WHERE entry=43741;
DELETE FROM `spell_proc_event` WHERE entry=43745;
DELETE FROM `spell_proc_event` WHERE entry=43748;
DELETE FROM `spell_proc_event` WHERE entry=43750;
DELETE FROM `spell_proc_event` WHERE entry=44445;
DELETE FROM `spell_proc_event` WHERE entry=44546;
DELETE FROM `spell_proc_event` WHERE entry=45234;
DELETE FROM `spell_proc_event` WHERE entry=46092;
DELETE FROM `spell_proc_event` WHERE entry=46098;
DELETE FROM `spell_proc_event` WHERE entry=46913;
DELETE FROM `spell_proc_event` WHERE entry=46951;
DELETE FROM `spell_proc_event` WHERE entry=47195;
DELETE FROM `spell_proc_event` WHERE entry=47201;
DELETE FROM `spell_proc_event` WHERE entry=47245;
DELETE FROM `spell_proc_event` WHERE entry=47258;
DELETE FROM `spell_proc_event` WHERE entry=47263;
DELETE FROM `spell_proc_event` WHERE entry=47264;
DELETE FROM `spell_proc_event` WHERE entry=47265;
DELETE FROM `spell_proc_event` WHERE entry=47509;
DELETE FROM `spell_proc_event` WHERE entry=47516;
DELETE FROM `spell_proc_event` WHERE entry=47569;
DELETE FROM `spell_proc_event` WHERE entry=47580;
DELETE FROM `spell_proc_event` WHERE entry=48483;
DELETE FROM `spell_proc_event` WHERE entry=48496;
DELETE FROM `spell_proc_event` WHERE entry=48506;
DELETE FROM `spell_proc_event` WHERE entry=48833;
DELETE FROM `spell_proc_event` WHERE entry=48835;
DELETE FROM `spell_proc_event` WHERE entry=48837;
DELETE FROM `spell_proc_event` WHERE entry=49018;
DELETE FROM `spell_proc_event` WHERE entry=49188;
DELETE FROM `spell_proc_event` WHERE entry=51123;
DELETE FROM `spell_proc_event` WHERE entry=51474;
DELETE FROM `spell_proc_event` WHERE entry=51483;
DELETE FROM `spell_proc_event` WHERE entry=51528;
DELETE FROM `spell_proc_event` WHERE entry=51556;
DELETE FROM `spell_proc_event` WHERE entry=51562;
DELETE FROM `spell_proc_event` WHERE entry=51625;
DELETE FROM `spell_proc_event` WHERE entry=51627;
DELETE FROM `spell_proc_event` WHERE entry=51664;
DELETE FROM `spell_proc_event` WHERE entry=51672;
DELETE FROM `spell_proc_event` WHERE entry=51692;
DELETE FROM `spell_proc_event` WHERE entry=51698;
DELETE FROM `spell_proc_event` WHERE entry=52020;
DELETE FROM `spell_proc_event` WHERE entry=52795;
DELETE FROM `spell_proc_event` WHERE entry=53221;
DELETE FROM `spell_proc_event` WHERE entry=53228;
DELETE FROM `spell_proc_event` WHERE entry=53256;
DELETE FROM `spell_proc_event` WHERE entry=53486;
DELETE FROM `spell_proc_event` WHERE entry=53569;
DELETE FROM `spell_proc_event` WHERE entry=53671;
DELETE FROM `spell_proc_event` WHERE entry=53709;
DELETE FROM `spell_proc_event` WHERE entry=54278;
DELETE FROM `spell_proc_event` WHERE entry=54646;
DELETE FROM `spell_proc_event` WHERE entry=55166;
DELETE FROM `spell_proc_event` WHERE entry=55666;
DELETE FROM `spell_proc_event` WHERE entry=55680;
DELETE FROM `spell_proc_event` WHERE entry=56342;
DELETE FROM `spell_proc_event` WHERE entry=56372;
DELETE FROM `spell_proc_event` WHERE entry=56821;
DELETE FROM `spell_proc_event` WHERE entry=57470;
DELETE FROM `spell_proc_event` WHERE entry=57499;
DELETE FROM `spell_proc_event` WHERE entry=57878;
DELETE FROM `spell_proc_event` WHERE entry=58626;
DELETE FROM `spell_proc_event` WHERE entry=59725;
DELETE FROM `spell_proc_event` WHERE entry=60564;
DELETE FROM `spell_proc_event` WHERE entry=60571;
DELETE FROM `spell_proc_event` WHERE entry=60572;
DELETE FROM `spell_proc_event` WHERE entry=60573;
DELETE FROM `spell_proc_event` WHERE entry=60574;
DELETE FROM `spell_proc_event` WHERE entry=60575;
DELETE FROM `spell_proc_event` WHERE entry=60710;
DELETE FROM `spell_proc_event` WHERE entry=60717;
DELETE FROM `spell_proc_event` WHERE entry=60719;
DELETE FROM `spell_proc_event` WHERE entry=60722;
DELETE FROM `spell_proc_event` WHERE entry=60724;
DELETE FROM `spell_proc_event` WHERE entry=60726;
DELETE FROM `spell_proc_event` WHERE entry=60770;
DELETE FROM `spell_proc_event` WHERE entry=60818;
DELETE FROM `spell_proc_event` WHERE entry=60826;
DELETE FROM `spell_proc_event` WHERE entry=61188;
DELETE FROM `spell_proc_event` WHERE entry=61324;
DELETE FROM `spell_proc_event` WHERE entry=62600;
DELETE FROM `spell_proc_event` WHERE entry=63108;
DELETE FROM `spell_proc_event` WHERE entry=63156;
DELETE FROM `spell_proc_event` WHERE entry=63373;
DELETE FROM `spell_proc_event` WHERE entry=63534;
DELETE FROM `spell_proc_event` WHERE entry=63611;
DELETE FROM `spell_proc_event` WHERE entry=63625;
DELETE FROM `spell_proc_event` WHERE entry=63730;
DELETE FROM `spell_proc_event` WHERE entry=64976;
DELETE FROM `spell_proc_event` WHERE entry=65661;
DELETE FROM `spell_proc_event` WHERE entry=67353;
DELETE FROM `spell_proc_event` WHERE entry=67361;
DELETE FROM `spell_proc_event` WHERE entry=67356;
DELETE FROM `spell_proc_event` WHERE entry=67363;
DELETE FROM `spell_proc_event` WHERE entry=67365;
DELETE FROM `spell_proc_event` WHERE entry=67379;
DELETE FROM `spell_proc_event` WHERE entry=67381;
DELETE FROM `spell_proc_event` WHERE entry=67384;
DELETE FROM `spell_proc_event` WHERE entry=67386;
DELETE FROM `spell_proc_event` WHERE entry=67389;
DELETE FROM `spell_proc_event` WHERE entry=67392;
DELETE FROM `spell_proc_event` WHERE entry=57907;
DELETE FROM `spell_proc_event` WHERE entry=64952;
DELETE FROM `spell_proc_event` WHERE entry=64964;
DELETE FROM `spell_proc_event` WHERE entry=71174;
DELETE FROM `spell_proc_event` WHERE entry=71176;
DELETE FROM `spell_proc_event` WHERE entry=71178;
DELETE FROM `spell_proc_event` WHERE entry=71186;
DELETE FROM `spell_proc_event` WHERE entry=71191;
DELETE FROM `spell_proc_event` WHERE entry=71194;
DELETE FROM `spell_proc_event` WHERE entry=71198;
DELETE FROM `spell_proc_event` WHERE entry=71217;
DELETE FROM `spell_proc_event` WHERE entry=71226;
DELETE FROM `spell_proc_event` WHERE entry=71228;
DELETE FROM `spell_proc_event` WHERE entry=48492;
DELETE FROM `spell_proc_event` WHERE entry=68160;
DELETE FROM `spell_proc_event` WHERE entry=63086;
DELETE FROM `spell_proc_event` WHERE entry=53695;
DELETE FROM `spell_proc_event` WHERE entry=54741;
DELETE FROM `spell_proc_event` WHERE entry=53672;

DELETE FROM `spell_bonus_data` WHERE entry=543;
DELETE FROM `spell_bonus_data` WHERE entry=13218;
DELETE FROM `spell_bonus_data` WHERE entry=15237;
DELETE FROM `spell_bonus_data` WHERE entry=19306;
DELETE FROM `spell_bonus_data` WHERE entry=20424;
DELETE FROM `spell_bonus_data` WHERE entry=25742;
DELETE FROM `spell_bonus_data` WHERE entry=27813;
DELETE FROM `spell_bonus_data` WHERE entry=28176;
DELETE FROM `spell_bonus_data` WHERE entry=30294;
DELETE FROM `spell_bonus_data` WHERE entry=34913;
DELETE FROM `spell_bonus_data` WHERE entry=50536;
DELETE FROM `spell_bonus_data` WHERE entry=53733;
DELETE FROM `spell_bonus_data` WHERE entry=54158;
DELETE FROM `spell_bonus_data` WHERE entry=60089;
DELETE FROM `spell_bonus_data` WHERE entry=63675;
DELETE FROM `spell_bonus_data` WHERE entry=64085;

DELETE FROM `spell_proc_item_enchant` WHERE entry=13218;

DELETE FROM `spell_threat` WHERE entry=5676;
DELETE FROM `spell_threat` WHERE entry=16857;

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
