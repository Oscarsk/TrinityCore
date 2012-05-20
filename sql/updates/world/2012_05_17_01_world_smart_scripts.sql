 -- Quest Re-Cursive
 SET @ENTRY := 25773;
 UPDATE creature_template SET AIName='SmartAI', ScripName='' WHERE entry=@ENTRY;
 DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100) AND `source_type` IN (0,9);
 INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
 (@ENTRY,0,0,0,54,0,100,0,0,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fizzcrank Survivor - On Just Summoned - Run Script"),
 (@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Fizzcrank Survivor - On Script - Talk Line 0"),
 (@ENTRY*100,9,1,0,0,0,100,0,2000,2000,2000,2000,11,41232,0,0,0,0,0,7,0,0,0,0,0,0,0,"Fizzcrank Survivor - Cast Spell"),
 (@ENTRY*100,9,2,0,0,0,100,0,2000,2000,0,0,33,@ENTRY,0,0,0,0,0,7,0,0,0,0,0,0,0,"Fizzcrank Survivor - On Script - Killed Monster Credit"),
 (@ENTRY*100,9,3,0,0,0,100,0,2000,2000,2000,2000,41,2000,0,0,0,0,0,7,0,0,0,0,0,0,0,"Fizzcrank Survivor - Force Despawn");
 
 
-- Quest Plan B
-- Update Creature_Template
UPDATE creature_template SET gossip_menu_id=9155, AIName='SmartAI', ScripName='' WHERE entry=25342;
UPDATE creature_template SET gossip_menu_id=9156, AIName='SmartAI', ScripName='' WHERE entry=25343;

-- Verify data gossip_menu_option
DELETE FROM gossip_menu_option WHERE menu_id IN (9155,9156);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
('9155','0','0','Retrieve Warsong Outfit.','1','1','0','0','0','0',''),
('9156','0','0','Retrieve Warsong Outfit.','1','1','0','0','0','0','');


-- smart_scripts
DELETE FROM `smart_scripts` WHERE `entryorguid` IN  (25342,25343) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
('25342','0','0','1','62','0','100','0','9155','0','0','0','56','34842','1','0','0','0','0','7','0','0','0','0','0','0','0','Dead Caravan Guard - On Gossip Select - Add Item Warsong Outfit'),
('25342','0','1','0','61','0','100','0','0','0','0','0','41','1000','0','0','0','0','0','1','0','0','0','0','0','0','0','Dead Caravan Guard - On Gossip Select - Forced Despawn'),
('25343','0','0','1','62','0','100','0','9156','0','0','0','56','34842','1','0','0','0','0','7','0','0','0','0','0','0','0','Dead Caravan Worker - On Gossip Select - Add Item Warsong Outfit'),
('25343','0','1','0','61','0','100','0','0','0','0','0','41','1000','0','0','0','0','0','1','0','0','0','0','0','0','0','Dead Caravan Worker - On Gossip Select - Forced Despawn');

-- Flags creatures
UPDATE creature_template SET unit_flags=537133824, type_flags=128 WHERE entry IN (25342,25343);

-- Conditions
DELETE FROM  `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup` IN (9155,9156) AND `SourceEntry`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('15','9155','0','0','1','9','0','11658','0','0','0','0','','Only show gossip if player has quest Plan B'),
('15','9156','0','0','1','9','0','11658','0','0','0','0','','Only show gossip if player has quest Plan B'),
('15','9155','0','0','0','2','0','34842','11','0','0','0','','Only show gossip if player has less then 10 outfits'),
('15','9156','0','0','0','2','0','34842','11','0','0','0','','Only show gossip if player has less then 10 outfits');


