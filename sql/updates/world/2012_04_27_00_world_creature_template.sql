SET @ENTRY := 26076;
update creature_template set unit_flags=0, mechanic_immune_mask=0 WHERE entry=@ENTRY;
