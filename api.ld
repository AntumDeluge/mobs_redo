--- Mobs Api (26th July 2017)
-- @module api.lua


-- SETTINGS

--- Enable damage.
--
-- If *true* monsters will attack players.
--
-- **type:** boolean<br>
-- **default:** true
-- @setting enable_damage

--- Only peaceful mobs.
--
-- If *true* only animals will spawn in game.
--
-- **type:** boolean<br>
-- **default:** false
-- @setting only_peaceful_mobs

--- Disable blood.
--
-- If *false* blood effects appear when mob is hit.
--
-- **type:** boolean<br>
-- **default:** false
-- @setting mobs_disable_blood

--- Protect mob spawns.
--
-- If set to *false* then mobs will not spawn in protected areas.
--
-- **type:** boolean<br>
-- **default:** true
-- @setting mobs_spawn_protected

--- Remove far mobs.
--
-- If *true* then mobs that are outside players visual range will be removed.
--
-- **type:** boolean<br>
-- **default:** false
-- @setting remove_far_mobs

--- Mob name.
--
-- Can change specific mob chance rate (0 to disable) and spawn number.
--
-- **Example:** mobs_animal:cow = 1000,5.
-- @setting mobname

--- Mob difficulty.
--
-- Sets difficulty level (health and hit damage multiplied by this number).
--
-- **type:** float<br>
-- **default:** 1.0
-- @setting mob_difficulty

--- Show mobs health.
--
-- If *false* then punching mob will not show health status.
--
-- **type:** boolean<br>
-- **default:** true
-- @setting mob_show_health


-- FUNCTIONS

--- above function exported for mount.lua
-- @function mobs:set_animation
-- @param self
-- @param anim

--- Registers a new mob as a Minetest entity.
--
-- @function mobs:register_mob
-- @param name Name of the mob (e.g. "mobs:dirt_monster")
-- @param def A table with the fields listed in *mobs:register_mod.def*
-- @see mobs:register_mob.def

--- Mobs spawn specific
-- @function mobs:spawn_specific
-- @param name
-- @param nodes
-- @param neighbors
-- @param min_light
-- @param max_light
-- @param interval
-- @param chance
-- @param aoc
-- @param min_height
-- @param max_height
-- @param day_toggle
-- @param on_spawn

--- compatibility with older mob registration
-- @function mobs:register_spawn
-- @param name
-- @param nodes
-- @param max_light
-- @param min_light
-- @param chance
-- @param active_object_count
-- @param max_height
-- @param day_toggle

--- MarkBu's spawn function
-- @function mobs:spawn
-- @param def

--- register arrow for shoot attack
-- @function mobs:register_arrow
-- @param name
-- @param def

--- compatibility function
-- @function mobs:explosion
-- @param pos
-- @param radius

--- make explosion with protection and tnt mod check
-- @function mobs:boom
-- @param self
-- @param pos
-- @param radius

--- Register spawn eggs
--
-- Note: This also introduces the “spawn_egg” group:
-- * spawn_egg=1: Spawn egg (generic mob, no metadata)
-- * spawn_egg=2: Spawn egg (captured/tamed mob, metadata)
-- @param mob
-- @param desc
-- @param background
-- @param addegg
-- @param no_creative

--- capture critter (thanks to blert2112 for idea)
-- @function mobs:capture_mob
-- @param self
-- @param clicker
-- @param chance_hand
-- @param chance_net
-- @param chance_lasso
-- @param force_take
-- @param replacewith

--- protect tamed mob with rune item
-- @function mobs:protect
-- @param self
-- @param clicker

--- feeding, taming and breeding (thanks blert2112)
-- @function mobs:feed_tame
-- @param self
-- @param clicker
-- @param feed_count
-- @param breed
-- @param tame

--- compatibility function for old entities to new modpack entities
-- @function mobs:alias_mob
-- @param old_name
-- @param new_name



-- TABLES

--- Spawning mobs
-- @table mobs.spawning_mobs


--- Definition table for ***mobs:register_mob***
-- 
-- @table mobs:register_mob.def
-- @field type' the type of the mob ("monster", "animal" or "npc") where monsters attack players and npc's, animals and npc's tend to wander around and can attack when hit 1st.
-- @field passive' will mob defend itself, set to false to attack
-- @field docile_by_day' when true, mob will not attack during daylight hours unless provoked
-- @field attacks_monsters' usually for npc's to attack monsters in area
-- @field group_attack' true to defend same kind of mobs from attack in area
-- @field owner_loyal' when true owned mobs will attack any monsters you punch
-- @field attack_animals' true for monster to attack animals as well as player and npc's
-- @field specific_attack' has a table of entity names that monsters can attack {"player", "mobs_animal:chicken"}
-- @field hp_min' minimum health
-- @field hp_max' maximum health (mob health is randomly selected between both)
-- @field physical' same is in minetest.register_entity()
-- @field collisionbox' same is in minetest.register_entity()
-- @field visual' same is in minetest.register_entity()
-- @field visual_size' same is in minetest.register_entity()
-- @field textures' same is in minetest.register_entity()
-- although you can add multiple lines for random textures {{"texture1.png"},{"texture2.png"}}, 
-- @field gotten_texture' alt. texture for when self.gotten value is set to true (used for shearing sheep)
-- @field child_texture' texture of mod for when self.child is set to true
-- @field mesh' same is in minetest.register_entity()
-- @field gotten_mesh' alternative mesh for when self.gotten is true (used for sheep)
-- @field makes_footstep_sound' same is in minetest.register_entity()
-- @field follow' item when held will cause mob to follow player, can be single string "default:apple" or table {"default:apple", "default:diamond"}.  These are also items that are used to feed and tame mob.
-- @field view_range' the range in which the mob will follow or attack player
-- @field walk_chance' chance of mob walking around (0 to 100), set to 0 for jumping mob only
-- @field walk_velocity' the velocity when the monster is walking around
-- @field run_velocity' the velocity when the monster is attacking a player
-- @field runaway' when true mob will turn and run away when punched
-- @field stepheight' minimum node height mob can walk onto without jumping (default: 0.6)
-- @field jump' can mob jump, true or false
-- @field jump_height' height mob can jump, default is 6 (0 to disable jump)
-- @field fly' can mob fly, true or false (used for swimming mobs also)
-- @field fly_in' node name that mob flys inside, e.g "air", "default:water_source" for fish
-- @field damage' the damage mobs inflict per melee attack.
-- @field recovery_time' how much time from when mob is hit to recovery (default: 0.5 seconds)
-- @field knock_back' strength of knock-back when mob hit (default: 3)
-- @field immune_to' table holding special tool/item names and damage the incur e.g.
-- {"default:sword_wood", 0}, {"default:gold_lump", -10} immune to sword, gold lump heals
-- @field blood_amount' number of droplets that appear when hit
-- @field blood_texture' texture of blood droplets (default: "mobs_blood.png")
-- @field drops' is list of tables with the following fields:
-- @field armor' this integer holds armor strength with 100 being normal, with lower numbers hardening the armor and higher numbers making it weaker (weird I know but compatible with simple mobs)
-- @field drawtype' "front" or "side" (DEPRECATED, replaced with below)
-- @field rotate' set mob rotation, 0=front, 90=side, 180=back, 270=other side
-- @field water_damage' the damage per second if the mob is in water
-- @field lava_damage' the damage per second if the mob is in lava
-- @field light_damage' the damage per second if the mob is in light
-- @field suffocation' health value mob loses when inside a solid node
-- @field fall_damage' will mob be hurt when falling from height
-- @field fall_speed' maximum falling velocity of mob (default is -10 and must be below -2)
-- @field fear_height' when mob walks near a drop then anything over this value makes it stop and turn back (default is 0 to disable)
-- @field on_die' a function that is called when the mob is killed the parameters are (self, pos)
-- @field floats' 1 to float in water, 0 to sink
-- @field on_rightclick' its same as in minetest.register_entity()
-- @field pathfinding' set to 1 for mobs to use pathfinder feature to locate player, set to 2 so they can build/break also (only works with dogfight attack)
-- @field attack_type' the attack type of a monster
-- 'dogfight' follows player in range and attacks when in reach
-- 'shoot' shoots defined arrows when player is within range
-- 'explode' follows player in range and will flash and explode when in reach
-- 'dogshoot' shoots arrows when in range and one on one attack when in reach
-- @field dogshoot_switch' allows switching between shoot and dogfight modes inside dogshoot using timer (1 = shoot, 2 = dogfight)
-- @field dogshoot_count_max' number of seconds before switching to dogfight mode.
-- @field dogshoot_count2_max' number of seconds before switching back to shoot mode.
-- @field custom_attack' when set this function is called instead of the normal mob melee attack, parameters are (self, to_attack)
-- @field double_melee_attack' if false then api will choose randomly between 'punch' and 'punch2' attack animations
-- @field on_blast' is called when an explosion happens near mob when using TNT functions, parameters are (object, damage) and returns (do_damage, do_knockback, drops)
-- @field explosion_radius' radius of explosion attack (defaults to 1)
-- @field arrow' if the attack_type is "shoot" or "dogshoot" then the entity name of a pre-defined arrow is required, see below for arrow definition.
-- @field shoot_interval' the minimum shoot interval
-- @field shoot_offset' +/- value to position arrow/fireball when fired
-- @field reach' how far a reach this mob has, default is 3
-- @field sounds' this is a table with sounds of the mob
--
--Mobs can look for specific nodes as they walk and replace them to mimic eating.
--
-- @field replace_what' group if items to replace e.g. {"farming:wheat_8", "farming:carrot_8"}
-- @field replace_with' replace with what e.g. "air" or in chickens case "mobs:egg"
-- @field replace_rate' how random should the replace rate be (typically 10)
-- @field replace_offset' +/- value to check specific node to replace
--   'on_replace(self, pos, oldnode, newnode)' gets called when mob is about to replace a node
--   self: ObjectRef of mob
--   pos: Position of node to replace
--   oldnode: Current node
--   newnode: What the node will become after replacing
--
--   If false is returned, the mob will not replace the node.
--
--   By default, replacing sets self.gotten to true and resets the object properties.
--
-- The 'replace_what' has been updated to use tables for what, with and y_offset e.g.
--
--   replace_what = { {"group:grass", "air", 0}, {"default:dirt_with_grass", "default:dirt", -1} }
--
-- Mob animation comes in three parts, start_frame, end_frame and frame_speed which
-- can be added to the mob definition under pre-defined mob animation names like:
--
--   'animation' a table with the animation ranges and speed of the model
--      'stand_start', 'stand_end', 'stand_speed' when mob stands still
--      'walk_start', 'walk_end', 'walk_speed' when mob walks
--      'run_start', 'run_end', 'run_speed' when mob runs
--      'fly_start', 'fly_end', 'fly_speed' when mob flies
--      'punch_start', 'punch_end', 'punch_speed' when mob attacks
--      'punch2_start', 'punch2_end', 'punch2_speed' when mob attacks (alternative)
--      'die_start', 'die_end', 'die_speed' when mob dies
--      '*_loop' bool value to determine if any set animation loops e.g (die_loop = false)
--      defaults to true if not set
--also  'speed_normal' for compatibility with older mobs for animation speed (deprecated)
-- @see mobs:register_mob


--- Textures for ***mobs:register_mob***
-- 
-- @table mobs:register_mob.def.textures
-- @see mobs:register_mob.def


--- @table mobs:register_mob.def.immune_to
-- @see mobs:register_mob.def


--- Drops for ***mobs:register_mod***
-- 
-- @table mobs:register_mob.def.drops
-- @field name' itemname e.g. default:stone
-- @field chance' the inverted chance (same as in abm) to get the item
-- @field min' the minimum number of items
-- @field max' the maximum number of items
-- @see mobs:register_mob.def


--- Sounds for ***mobs:register_mob***
-- 
-- @table mobs:register_mob.def.sounds
-- @field random' random sounds during gameplay
-- @field war_cry' sound when starting to attack player
-- @field attack' sound when attacking player
-- @field shoot_attack' sound when attacking player by shooting arrow/entity
-- @field damage' sound when being hit
-- @field death' sound when killed
-- @field jump' sound when jumping
-- @field explode' sound when exploding
-- @field distance' maximum distance sounds are heard from (default is 10)
-- @see mobs:register_mob.def


--- @table mobs:register_mob.def.animation
-- @see mobs:register_mob.def
