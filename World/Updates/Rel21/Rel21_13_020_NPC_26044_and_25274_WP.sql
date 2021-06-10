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
    SET @cOldStructure = '13'; 
    SET @cOldContent = '019';

    -- New Values
    SET @cNewVersion = '21';
    SET @cNewStructure = '13';
    SET @cNewContent = '020';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'NPC 26044 and 25274 WP';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'NPC 26044 and 25274 WP';

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

SET @script_id := (SELECT MAX(`id`) FROM `db_scripts`);
SET @script_string := (SELECT MAX(`entry`) FROM `db_script_string`);

INSERT INTO `db_script_string` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(@script_string+1, 'You call that a hammer strike? What kind of amateurs am I workin\' with here?', 0, 0, 0, 397, 'NPC - 25274'),
(@script_string+2, 'And WHAT are our soldiers supposed to do with that shoddy piece of junk?', 0, 0, 0, 397, 'NPC - 25274'),
(@script_string+3, 'You\'re an embarrassment to this entire operation! Pack up your stuff and get out!', 0, 0, 0, 397, 'NPC - 25274'),
(@script_string+4, 'You keep that garbage up and I\'ll ship you back to your momma in a box with a note strapped to your chest that reads: FAILURE.', 0, 0, 0, 397, 'NPC - 25274');

INSERT INTO db_scripts (`script_type`,`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(3,@script_id+1,2,28,8,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_KNEEL- NPC 26044'),
(3,@script_id+1,10,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'NPC 26044'),
(3,@script_id+1,18,28,0,0,0,0,0,0,0,0,0,0,0,0,0,'STATE_STAND - NPC 26044'),
(3,@script_id+2, 2,1,5,0,0,0,0,0,0,0,0,0,0,0,0,'NPC - 25274'),
(3,@script_id+2, 5, 0, 0, 0, 0, 0, 0, @script_string+1, @script_string+2, @script_string+3, @script_string+4, 0, 0, 0, 0, 'NPC - 25274');

-- Borean Tundra - Warsong Hold

-- Durkot Wolfbrother
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 95346;
DELETE FROM `creature_movement` WHERE `id` = 95346;
UPDATE `creature_template` SET `MovementType` = 2 WHERE `Entry` = 26044;
DELETE FROM `creature_movement_template` WHERE `entry` = 26044;
INSERT INTO `creature_movement_template` (`entry`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`orientation`,`model1`,`model2`) VALUES
(26044, 1, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 2, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 3, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 4, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 5, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 6, 2791.75,6244.01,84.6092, 22000, @script_id+1,0.717889, 0, 0),
(26044, 7, 2786.42,6245.35,84.3805, 0, 0,2.43222, 0, 0),
(26044, 8, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 9, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 10, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 11, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 12, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 13, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 14, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 15, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 16, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 17, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 18, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 19, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 20, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 21, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 22, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 23, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 24, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 25, 2775.46,6252.13,83.9431, 22000, @script_id+1,3.87735, 0, 0),
(26044, 26, 2780.02,6251.43,84.0246, 0, 0,5.66806, 0, 0),
(26044, 27, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 28, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 29, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 30, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 31, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 32, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 33, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 34, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 35, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 36, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 37, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 38, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 39, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 40, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 41, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 42, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 43, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 44, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0),
(26044, 45, 2788.16,6243.06,84.4932, 5000, 0,5.38473, 0, 0),
(26044, 46, 2773.72,6258.83,83.6357, 5000, 0,2.29026, 0, 0);

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 95342;
DELETE FROM `creature_movement` WHERE `id` = 95342;
UPDATE `creature_template` SET `MovementType` = 2 WHERE `Entry` = 25274;
DELETE FROM `creature_movement_template` WHERE `entry` = 25274;
INSERT INTO `creature_movement_template` (`entry`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`orientation`,`model1`,`model2`) VALUES
(25274, 1, 2761.85,6187.82,83.448, 0, 0,1.39858, 0, 0),
(25274, 2, 2763.1,6203.83,83.4409, 0, 0,1.10327, 0, 0),
(25274, 3, 2765.37,6209.65,83.4451, 0, 0,0.9187, 0, 0),
(25274, 4, 2772.92,6217.22,83.4475, 0, 0,0.804817, 0, 0),
(25274, 5, 2766.39,6211.48,83.437, 0, 0,4.24093, 0, 0),
(25274, 6, 2762.96,6202.62,83.4409, 0, 0,4.4844, 0, 0),
(25274, 7, 2762.31,6187.53,83.4546, 0, 0,4.91244, 0, 0),
(25274, 8, 2765.22,6178.21,83.4565, 0, 0,5.15198, 0, 0),
(25274, 9, 2762.24,6188.36,83.4575, 0, 0,1.44569, 0, 0),
(25274, 10, 2763.33,6204.33,83.4432, 0, 0,1.01608, 0, 0),
(25274, 11, 2766.61,6211.59,83.4381, 0, 0,0.822868, 0, 0),
(25274, 12, 2773.5,6217.87,83.4484, 0, 0,0.690921, 0, 0),
(25274, 13, 2765.7,6210.09,83.4438, 0, 0,4.26684, 0, 0),
(25274, 14, 2762.77,6202.1,83.4395, 0, 0,4.66032, 0, 0),
(25274, 15, 2762.54,6187.41,83.4578, 0, 0,4.91636, 0, 0),
(25274, 16, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0),
(25274, 17, 2764.09,6182.25,83.4576, 15000, @script_id+2,3.38169, 0, 0),
(25274, 18, 2762.03,6188.66,83.4549, 0, 0,1.56349, 0, 0),
(25274, 19, 2763.21,6203.82,83.4422, 0, 0,1.22106, 0, 0),
(25274, 20, 2766.87,6211.5,83.4422, 0, 0,0.828359, 0, 0),
(25274, 21, 2773.88,6218.09,83.4497, 0, 0,0.741966, 0, 0),
(25274, 22, 2765.7,6210.09,83.4438, 0, 0,4.26684, 0, 0),
(25274, 23, 2762.77,6202.1,83.4395, 0, 0,4.66032, 0, 0),
(25274, 24, 2762.54,6187.41,83.4578, 0, 0,4.91636, 0, 0),
(25274, 25, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0),
(25274, 26, 2762.24,6188.36,83.4575, 0, 0,1.44569, 0, 0),
(25274, 27, 2763.33,6204.33,83.4432, 0, 0,1.01608, 0, 0),
(25274, 28, 2766.61,6211.59,83.4381, 0, 0,0.822868, 0, 0),
(25274, 29, 2773.5,6217.87,83.4484, 0, 0,0.690921, 0, 0),
(25274, 30, 2765.7,6210.09,83.4438, 0, 0,4.26684, 0, 0),
(25274, 31, 2762.77,6202.1,83.4395, 0, 0,4.66032, 0, 0),
(25274, 32, 2762.54,6187.41,83.4578, 0, 0,4.91636, 0, 0),
(25274, 33, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0),
(25274, 34, 2762.24,6188.36,83.4575, 0, 0,1.44569, 0, 0),
(25274, 35, 2763.33,6204.33,83.4432, 0, 0,1.01608, 0, 0),
(25274, 36, 2766.61,6211.59,83.4381, 0, 0,0.822868, 0, 0),
(25274, 37, 2773.5,6217.87,83.4484, 0, 0,0.690921, 0, 0),
(25274, 38, 2765.7,6210.09,83.4438, 0, 0,4.26684, 0, 0),
(25274, 39, 2762.77,6202.1,83.4395, 0, 0,4.66032, 0, 0),
(25274, 40, 2762.54,6187.41,83.4578, 0, 0,4.91636, 0, 0),
(25274, 41, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0),
(25274, 42, 2762.24,6188.36,83.4575, 0, 0,1.44569, 0, 0),
(25274, 43, 2763.33,6204.33,83.4432, 0, 0,1.01608, 0, 0),
(25274, 44, 2766.61,6211.59,83.4381, 0, 0,0.822868, 0, 0),
(25274, 45, 2773.5,6217.87,83.4484, 0, 0,0.690921, 0, 0),
(25274, 46, 2765.7,6210.09,83.4438, 0, 0,4.26684, 0, 0),
(25274, 47, 2762.77,6202.1,83.4395, 0, 0,4.66032, 0, 0),
(25274, 48, 2762.54,6187.41,83.4578, 0, 0,4.91636, 0, 0),
(25274, 49, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0),
(25274, 50, 2762.24,6188.36,83.4575, 0, 0,1.44569, 0, 0),
(25274, 51, 2763.33,6204.33,83.4432, 0, 0,1.01608, 0, 0),
(25274, 52, 2766.61,6211.59,83.4381, 0, 0,0.822868, 0, 0),
(25274, 53, 2773.5,6217.87,83.4484, 0, 0,0.690921, 0, 0),
(25274, 54, 2765.7,6210.09,83.4438, 0, 0,4.26684, 0, 0),
(25274, 55, 2762.77,6202.1,83.4395, 0, 0,4.66032, 0, 0),
(25274, 56, 2762.54,6187.41,83.4578, 0, 0,4.91636, 0, 0),
(25274, 57, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0),
(25274, 58, 2762.24,6188.36,83.4575, 0, 0,1.44569, 0, 0),
(25274, 59, 2763.33,6204.33,83.4432, 0, 0,1.01608, 0, 0),
(25274, 60, 2766.61,6211.59,83.4381, 0, 0,0.822868, 0, 0),
(25274, 61, 2773.5,6217.87,83.4484, 0, 0,0.690921, 0, 0),
(25274, 62, 2765.7,6210.09,83.4438, 0, 0,4.26684, 0, 0),
(25274, 63, 2762.77,6202.1,83.4395, 0, 0,4.66032, 0, 0),
(25274, 64, 2762.54,6187.41,83.4578, 0, 0,4.91636, 0, 0),
(25274, 65, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0),
(25274, 66, 2762.24,6188.36,83.4575, 0, 0,1.44569, 0, 0),
(25274, 67, 2763.33,6204.33,83.4432, 0, 0,1.01608, 0, 0),
(25274, 68, 2766.61,6211.59,83.4381, 0, 0,0.822868, 0, 0),
(25274, 69, 2773.5,6217.87,83.4484, 0, 0,0.690921, 0, 0),
(25274, 70, 2766.07,6210.93,83.4391, 0, 0,4.24653, 0, 0),
(25274, 71, 2762.53,6207.16,83.4206, 15000, @script_id+2,2.88465, 0, 0),
(25274, 72, 2762.16,6187.79,83.4531, 0, 0,4.91019, 0, 0),
(25274, 73, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0),
(25274, 74, 2761.85,6187.82,83.448, 0, 0,1.39858, 0, 0),
(25274, 75, 2763.1,6203.83,83.4409, 0, 0,1.10327, 0, 0),
(25274, 76, 2765.37,6209.65,83.4451, 0, 0,0.9187, 0, 0),
(25274, 77, 2772.92,6217.22,83.4475, 0, 0,0.804817, 0, 0),
(25274, 78, 2766.39,6211.48,83.437, 0, 0,4.24093, 0, 0),
(25274, 79, 2762.96,6202.62,83.4409, 0, 0,4.4844, 0, 0),
(25274, 80, 2762.31,6187.53,83.4546, 0, 0,4.91244, 0, 0),
(25274, 81, 2765.22,6178.21,83.4565, 0, 0,5.15198, 0, 0),
(25274, 82, 2762.24,6188.36,83.4575, 0, 0,1.44569, 0, 0),
(25274, 83, 2763.33,6204.33,83.4432, 0, 0,1.01608, 0, 0),
(25274, 84, 2766.61,6211.59,83.4381, 0, 0,0.822868, 0, 0),
(25274, 85, 2773.5,6217.87,83.4484, 0, 0,0.690921, 0, 0),
(25274, 86, 2765.7,6210.09,83.4438, 0, 0,4.26684, 0, 0),
(25274, 87, 2762.77,6202.1,83.4395, 0, 0,4.66032, 0, 0),
(25274, 88, 2762.54,6187.41,83.4578, 0, 0,4.91636, 0, 0),
(25274, 89, 2765.46,6178.01,83.4598, 0, 0,5.05773, 0, 0); 

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


