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
    SET @cOldContent = '005';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '05';
    SET @cNewContent = '006';
                            -- DESCRIPTION IS 30 Characters MAX
    SET @cNewDescription = 'Cleanup_2';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Cleanup_2';

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

        DELETE FROM `spell_elixir` WHERE Entry=834;
        DELETE FROM `spell_elixir` WHERE Entry=3157;
        DELETE FROM `spell_elixir` WHERE Entry=3158;
        DELETE FROM `spell_elixir` WHERE Entry=3159;
        DELETE FROM `spell_elixir` WHERE Entry=3161;
        DELETE FROM `spell_elixir` WHERE Entry=3162;
        DELETE FROM `spell_elixir` WHERE Entry=3163;
        DELETE FROM `spell_elixir` WHERE Entry=3221;
        DELETE FROM `spell_elixir` WHERE Entry=11330;
        DELETE FROM `spell_elixir` WHERE Entry=11331;
        DELETE FROM `spell_elixir` WHERE Entry=11332;
        DELETE FROM `spell_elixir` WHERE Entry=11333;
        DELETE FROM `spell_elixir` WHERE Entry=11393;
        DELETE FROM `spell_elixir` WHERE Entry=11394;
        DELETE FROM `spell_elixir` WHERE Entry=11395;
        DELETE FROM `spell_elixir` WHERE Entry=11404;
        DELETE FROM `spell_elixir` WHERE Entry=60345;
        DELETE FROM `spell_learn_spell` WHERE SpellID=17002;
        DELETE FROM `spell_learn_spell` WHERE SpellID=24866;
        DELETE FROM `spell_learn_spell` WHERE SpellID=33872;
        DELETE FROM `spell_learn_spell` WHERE SpellID=80388;
        DELETE FROM `spell_learn_spell` WHERE SpellID=86467;
        DELETE FROM `spell_learn_spell` WHERE SpellID=86530;
        DELETE FROM `spell_learn_spell` WHERE SpellID=86530;
        DELETE FROM `spell_learn_spell` WHERE SpellID=86530;
        DELETE FROM `spell_learn_spell` WHERE SpellID=86530;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87491;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87492;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87493;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87494;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87495;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87496;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87497;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87498;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87500;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87505;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87506;
        DELETE FROM `spell_learn_spell` WHERE SpellID=87509;
        DELETE FROM `spell_proc_event` WHERE Entry=3232;
        DELETE FROM `spell_proc_event` WHERE Entry=5952;
        DELETE FROM `spell_proc_event` WHERE Entry=9799;
        DELETE FROM `spell_proc_event` WHERE Entry=11095;
        DELETE FROM `spell_proc_event` WHERE Entry=11119;
        DELETE FROM `spell_proc_event` WHERE Entry=11180;
        DELETE FROM `spell_proc_event` WHERE Entry=11185;
        DELETE FROM `spell_proc_event` WHERE Entry=11255;
        DELETE FROM `spell_proc_event` WHERE Entry=12289;
        DELETE FROM `spell_proc_event` WHERE Entry=12298;
        DELETE FROM `spell_proc_event` WHERE Entry=12311;
        DELETE FROM `spell_proc_event` WHERE Entry=12317;
        DELETE FROM `spell_proc_event` WHERE Entry=12319;
        DELETE FROM `spell_proc_event` WHERE Entry=12322;
        DELETE FROM `spell_proc_event` WHERE Entry=12834;
        DELETE FROM `spell_proc_event` WHERE Entry=13754;
        DELETE FROM `spell_proc_event` WHERE Entry=13983;
        DELETE FROM `spell_proc_event` WHERE Entry=14156;
        DELETE FROM `spell_proc_event` WHERE Entry=14186;
        DELETE FROM `spell_proc_event` WHERE Entry=14892;
        DELETE FROM `spell_proc_event` WHERE Entry=16176;
        DELETE FROM `spell_proc_event` WHERE Entry=16180;
        DELETE FROM `spell_proc_event` WHERE Entry=16256;
        DELETE FROM `spell_proc_event` WHERE Entry=16487;
        DELETE FROM `spell_proc_event` WHERE Entry=16880;
        DELETE FROM `spell_proc_event` WHERE Entry=16952;
        DELETE FROM `spell_proc_event` WHERE Entry=16958;
        DELETE FROM `spell_proc_event` WHERE Entry=17106;
        DELETE FROM `spell_proc_event` WHERE Entry=17793;
        DELETE FROM `spell_proc_event` WHERE Entry=18094;
        DELETE FROM `spell_proc_event` WHERE Entry=19572;
        DELETE FROM `spell_proc_event` WHERE Entry=20049;
        DELETE FROM `spell_proc_event` WHERE Entry=20128;
        DELETE FROM `spell_proc_event` WHERE Entry=20131;
        DELETE FROM `spell_proc_event` WHERE Entry=20132;
        DELETE FROM `spell_proc_event` WHERE Entry=20911;
        DELETE FROM `spell_proc_event` WHERE Entry=23602;
        DELETE FROM `spell_proc_event` WHERE Entry=27811;
        DELETE FROM `spell_proc_event` WHERE Entry=28847;
        DELETE FROM `spell_proc_event` WHERE Entry=28849;
        DELETE FROM `spell_proc_event` WHERE Entry=29074;
        DELETE FROM `spell_proc_event` WHERE Entry=29441;
        DELETE FROM `spell_proc_event` WHERE Entry=29593;
        DELETE FROM `spell_proc_event` WHERE Entry=29834;
        DELETE FROM `spell_proc_event` WHERE Entry=30160;
        DELETE FROM `spell_proc_event` WHERE Entry=30293;
        DELETE FROM `spell_proc_event` WHERE Entry=30299;
        DELETE FROM `spell_proc_event` WHERE Entry=30881;
        DELETE FROM `spell_proc_event` WHERE Entry=31124;
        DELETE FROM `spell_proc_event` WHERE Entry=31569;
        DELETE FROM `spell_proc_event` WHERE Entry=31571;
        DELETE FROM `spell_proc_event` WHERE Entry=32385;
        DELETE FROM `spell_proc_event` WHERE Entry=32748;
        DELETE FROM `spell_proc_event` WHERE Entry=33142;
        DELETE FROM `spell_proc_event` WHERE Entry=33191;
        DELETE FROM `spell_proc_event` WHERE Entry=33881;
        DELETE FROM `spell_proc_event` WHERE Entry=34138;
        DELETE FROM `spell_proc_event` WHERE Entry=34139;
        DELETE FROM `spell_proc_event` WHERE Entry=34258;
        DELETE FROM `spell_proc_event` WHERE Entry=34262;
        DELETE FROM `spell_proc_event` WHERE Entry=34497;
        DELETE FROM `spell_proc_event` WHERE Entry=34914;
        DELETE FROM `spell_proc_event` WHERE Entry=34935;
        DELETE FROM `spell_proc_event` WHERE Entry=34950;
        DELETE FROM `spell_proc_event` WHERE Entry=35100;
        DELETE FROM `spell_proc_event` WHERE Entry=3411;
        DELETE FROM `spell_proc_event` WHERE Entry=42368;
        DELETE FROM `spell_proc_event` WHERE Entry=42370;
        DELETE FROM `spell_proc_event` WHERE Entry=43338;
        DELETE FROM `spell_proc_event` WHERE Entry=43726;
        DELETE FROM `spell_proc_event` WHERE Entry=43728;
        DELETE FROM `spell_proc_event` WHERE Entry=43737;
        DELETE FROM `spell_proc_event` WHERE Entry=43739;
        DELETE FROM `spell_proc_event` WHERE Entry=43741;
        DELETE FROM `spell_proc_event` WHERE Entry=43745;
        DELETE FROM `spell_proc_event` WHERE Entry=43748;
        DELETE FROM `spell_proc_event` WHERE Entry=43750;
        DELETE FROM `spell_proc_event` WHERE Entry=44445;
        DELETE FROM `spell_proc_event` WHERE Entry=44546;
        DELETE FROM `spell_proc_event` WHERE Entry=45234;
        DELETE FROM `spell_proc_event` WHERE Entry=46092;
        DELETE FROM `spell_proc_event` WHERE Entry=46098;
        DELETE FROM `spell_proc_event` WHERE Entry=46913;
        DELETE FROM `spell_proc_event` WHERE Entry=46951;
        DELETE FROM `spell_proc_event` WHERE Entry=47195;
        DELETE FROM `spell_proc_event` WHERE Entry=47201;
        DELETE FROM `spell_proc_event` WHERE Entry=47245;
        DELETE FROM `spell_proc_event` WHERE Entry=47258;
        DELETE FROM `spell_proc_event` WHERE Entry=47263;
        DELETE FROM `spell_proc_event` WHERE Entry=47264;
        DELETE FROM `spell_proc_event` WHERE Entry=47265;
        DELETE FROM `spell_proc_event` WHERE Entry=47509;
        DELETE FROM `spell_proc_event` WHERE Entry=47516;
        DELETE FROM `spell_proc_event` WHERE Entry=47569;
        DELETE FROM `spell_proc_event` WHERE Entry=47580;
        DELETE FROM `spell_proc_event` WHERE Entry=48483;
        DELETE FROM `spell_proc_event` WHERE Entry=48496;
        DELETE FROM `spell_proc_event` WHERE Entry=48506;
        DELETE FROM `spell_proc_event` WHERE Entry=48833;
        DELETE FROM `spell_proc_event` WHERE Entry=48835;
        DELETE FROM `spell_proc_event` WHERE Entry=48837;
        DELETE FROM `spell_proc_event` WHERE Entry=49018;
        DELETE FROM `spell_proc_event` WHERE Entry=49188;
        DELETE FROM `spell_proc_event` WHERE Entry=51123;
        DELETE FROM `spell_proc_event` WHERE Entry=51474;
        DELETE FROM `spell_proc_event` WHERE Entry=51483;
        DELETE FROM `spell_proc_event` WHERE Entry=51528;
        DELETE FROM `spell_proc_event` WHERE Entry=51556;
        DELETE FROM `spell_proc_event` WHERE Entry=51562;
        DELETE FROM `spell_proc_event` WHERE Entry=51625;
        DELETE FROM `spell_proc_event` WHERE Entry=51627;
        DELETE FROM `spell_proc_event` WHERE Entry=51664;
        DELETE FROM `spell_proc_event` WHERE Entry=51672;
        DELETE FROM `spell_proc_event` WHERE Entry=51692;
        DELETE FROM `spell_proc_event` WHERE Entry=51698;
        DELETE FROM `spell_proc_event` WHERE Entry=52020;
        DELETE FROM `spell_proc_event` WHERE Entry=52795;
        DELETE FROM `spell_proc_event` WHERE Entry=53221;
        DELETE FROM `spell_proc_event` WHERE Entry=53228;
        DELETE FROM `spell_proc_event` WHERE Entry=53256;
        DELETE FROM `spell_proc_event` WHERE Entry=53486;
        DELETE FROM `spell_proc_event` WHERE Entry=53569;
        DELETE FROM `spell_proc_event` WHERE Entry=53671;
        DELETE FROM `spell_proc_event` WHERE Entry=53709;
        DELETE FROM `spell_proc_event` WHERE Entry=54278;
        DELETE FROM `spell_proc_event` WHERE Entry=54646;
        DELETE FROM `spell_proc_event` WHERE Entry=55166;
        DELETE FROM `spell_proc_event` WHERE Entry=55666;
        DELETE FROM `spell_proc_event` WHERE Entry=55680;
        DELETE FROM `spell_proc_event` WHERE Entry=56342;
        DELETE FROM `spell_proc_event` WHERE Entry=56372;
        DELETE FROM `spell_proc_event` WHERE Entry=56821;
        DELETE FROM `spell_proc_event` WHERE Entry=57470;
        DELETE FROM `spell_proc_event` WHERE Entry=57499;
        DELETE FROM `spell_proc_event` WHERE Entry=57878;
        DELETE FROM `spell_proc_event` WHERE Entry=58357;
        DELETE FROM `spell_proc_event` WHERE Entry=58386;
        DELETE FROM `spell_proc_event` WHERE Entry=58616;
        DELETE FROM `spell_proc_event` WHERE Entry=58626;
        DELETE FROM `spell_proc_event` WHERE Entry=59725;
        DELETE FROM `spell_proc_event` WHERE Entry=60564;
        DELETE FROM `spell_proc_event` WHERE Entry=60571;
        DELETE FROM `spell_proc_event` WHERE Entry=60572;
        DELETE FROM `spell_proc_event` WHERE Entry=60573;
        DELETE FROM `spell_proc_event` WHERE Entry=60574;
        DELETE FROM `spell_proc_event` WHERE Entry=60575;
        DELETE FROM `spell_proc_event` WHERE Entry=60710;
        DELETE FROM `spell_proc_event` WHERE Entry=60717;
        DELETE FROM `spell_proc_event` WHERE Entry=60719;
        DELETE FROM `spell_proc_event` WHERE Entry=60722;
        DELETE FROM `spell_proc_event` WHERE Entry=60724;
        DELETE FROM `spell_proc_event` WHERE Entry=60726;
        DELETE FROM `spell_proc_event` WHERE Entry=60770;
        DELETE FROM `spell_proc_event` WHERE Entry=60818;
        DELETE FROM `spell_proc_event` WHERE Entry=60826;
        DELETE FROM `spell_proc_event` WHERE Entry=61188;
        DELETE FROM `spell_proc_event` WHERE Entry=61324;
        DELETE FROM `spell_proc_event` WHERE Entry=62600;
        DELETE FROM `spell_proc_event` WHERE Entry=63108;
        DELETE FROM `spell_proc_event` WHERE Entry=63156;
        DELETE FROM `spell_proc_event` WHERE Entry=63373;
        DELETE FROM `spell_proc_event` WHERE Entry=63534;
        DELETE FROM `spell_proc_event` WHERE Entry=63611;
        DELETE FROM `spell_proc_event` WHERE Entry=63625;
        DELETE FROM `spell_proc_event` WHERE Entry=63730;
        DELETE FROM `spell_proc_event` WHERE Entry=64976;
        DELETE FROM `spell_proc_event` WHERE Entry=65661;
        DELETE FROM `spell_proc_event` WHERE Entry=67353;
        DELETE FROM `spell_proc_event` WHERE Entry=67361;
        DELETE FROM `spell_proc_event` WHERE Entry=67356;
        DELETE FROM `spell_proc_event` WHERE Entry=67363;
        DELETE FROM `spell_proc_event` WHERE Entry=67365;
        DELETE FROM `spell_proc_event` WHERE Entry=67379;
        DELETE FROM `spell_proc_event` WHERE Entry=67381;
        DELETE FROM `spell_proc_event` WHERE Entry=67384;
        DELETE FROM `spell_proc_event` WHERE Entry=67386;
        DELETE FROM `spell_proc_event` WHERE Entry=67389;
        DELETE FROM `spell_proc_event` WHERE Entry=67392;
        DELETE FROM `spell_proc_event` WHERE Entry=57907;
        DELETE FROM `spell_proc_event` WHERE Entry=64952;
        DELETE FROM `spell_proc_event` WHERE Entry=64964;
        DELETE FROM `spell_proc_event` WHERE Entry=71174;
        DELETE FROM `spell_proc_event` WHERE Entry=71176;
        DELETE FROM `spell_proc_event` WHERE Entry=71178;
        DELETE FROM `spell_proc_event` WHERE Entry=71186;
        DELETE FROM `spell_proc_event` WHERE Entry=71191;
        DELETE FROM `spell_proc_event` WHERE Entry=71194;
        DELETE FROM `spell_proc_event` WHERE Entry=71198;
        DELETE FROM `spell_proc_event` WHERE Entry=71217;
        DELETE FROM `spell_proc_event` WHERE Entry=71226;
        DELETE FROM `spell_proc_event` WHERE Entry=71228;
        DELETE FROM `spell_proc_event` WHERE Entry=48492;
        DELETE FROM `spell_proc_event` WHERE Entry=68160;
        DELETE FROM `spell_proc_event` WHERE Entry=54925;
        DELETE FROM `spell_proc_event` WHERE Entry=63086;
        DELETE FROM `spell_proc_event` WHERE Entry=53695;
        DELETE FROM `spell_proc_event` WHERE Entry=17941;
        DELETE FROM `spell_proc_event` WHERE Entry=54741;
        DELETE FROM `spell_proc_event` WHERE Entry=53672;

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
