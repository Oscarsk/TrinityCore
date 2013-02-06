-- Quest: Un asunto grimoso

SET @ENTRY := 22911;
/*Actualizando Creature_Template para ejecutar Smart Scripts*/
UPDATE creature_template 
SET AIName='SmartAI', ScriptName=''
WHERE entry= @ENTRY;

/*Insertando datos en Smar Scripts*/
DELETE FROM smart_scripts WHERE entryorguid= @ENTRY;
INSERT INTO `smart_scripts` VALUES(@ENTRY,'0','0','0','6','0','100','0','0','0','0','0','11','39862','3','0','0','0','0','1','0','0','0','0','0','0','0','Vim\'gol el Vil - On Death - Summon Grimorio de Vim\'gol el Vil');

/*Actualizando el GameObject*/
UPDATE gameobject_template 
SET flags=4
WHERE entry=185562;

/*Insertando las Condiciones en la que aparece el Grimorio, solamente si el pj tiene la quest*/
DELETE FROM Conditions WHERE sourceentry=22911 AND SourceTypeOrReferenceId=22;
INSERT INTO Conditions VALUES 
(22,1,@ENTRY,0,0,9,0,10998,0,0,0,0,'','Execute Summon Object Only If Player has Quest taken');
