-- Generated from template

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

if score == nil then
  score = class({})
  score.Bad = 0
  score.Good = 0
end

if CONSTANTS == nil then
  CONSTANTS = {}
  CONSTANTS.scoreToWin = 10
  CONSTANTS.goldForPoint = 50
  CONSTANTS.goldForCatch = 15
  CONSTANTS.goldForSave = 10
  CONSTANTS.goldForLineCross = 20 
  CONSTANTS.experience = 1000
  -- using this for scoreboard
  -- deny is point
  -- kill is catch
  -- death is be caught
  -- assist is save a friend
end

_G.GAME_ROUND = 1
_G.GAME_ROUND1experiencelose = 250
_G.GAME_ROUND1experiencewin = 300

_G.GAME_ROUND2experiencelose = 270
_G.GAME_ROUND2experiencewin = 330

_G.GAME_ROUND3experiencelose = 330
_G.GAME_ROUND3experiencewin = 370

_G.GAME_ROUND4experiencelose = 420
_G.GAME_ROUND4experiencewin = 450

_G.GAME_ROUND5experiencelose = 440
_G.GAME_ROUND5experiencewin = 480

_G.GAME_ROUND6experiencelose = 480
_G.GAME_ROUND6experiencewin = 530

_G.GAME_ROUND7experiencelose = 530
_G.GAME_ROUND7experiencewin = 560

_G.GAME_ROUND8experiencelose = 560
_G.GAME_ROUND8experiencewin = 590

_G.GAME_ROUND9experiencelose = 590
_G.GAME_ROUND9experiencewin = 630

_G.GAME_ROUND10experiencelose = 630
_G.GAME_ROUND10experiencewin = 660

_G.GAME_ROUND11experiencelose = 660
_G.GAME_ROUND11experiencewin = 700

_G.GAME_ROUND12experiencelose = 700
_G.GAME_ROUND12experiencewin = 730

_G.GAME_ROUND13experiencelose = 730
_G.GAME_ROUND13experiencewin = 750

_G.GAME_ROUND14experiencelose = 750
_G.GAME_ROUND14experiencewin = 790

_G.GAME_ROUND15experiencelose = 790
_G.GAME_ROUND15experiencewin = 820

_G.GAME_ROUND16experiencelose = 800
_G.GAME_ROUND16experiencewin = 900

_G.GAME_ROUND17experiencelose = 900
_G.GAME_ROUND17experiencewin = 1000

_G.GAME_ROUND18experiencelose = 950
_G.GAME_ROUND18experiencewin = 1050

_G.GAME_ROUND19experiencelose = 9070
_G.GAME_ROUND19experiencewin = 1070

_G.GAME_ROUND20experiencelose = 1000
_G.GAME_ROUND20experiencewin = 1200




function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
  print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	GameMode = GameRules:GetGameModeEntity()
  	--Override the values of the team values on the top game bar.
  GameMode:SetTopBarTeamValuesOverride(true)
 	GameMode:SetTopBarTeamValuesVisible(true)
  GameMode:SetTopBarTeamValue(DOTA_TEAM_GOODGUYS, 0)
	GameMode:SetTopBarTeamValue(DOTA_TEAM_BADGUYS, 0)
  GameMode:SetRecommendedItemsDisabled(true)
	
  spawnGoodFlag()
  spawnBadFlag()
  print(" Gamemode rules are set.")
  
  GameRules:SendCustomMessage("Welcome To Capture The Flag Alpha by buymyhat.com", DOTA_TEAM_NOTEAM, 0)
  GameRules:GetGameModeEntity():SetThink("OnThink", self, "GlobalThink", 2)
  
  ListenToGameEvent('npc_spawned', Dynamic_Wrap(CAddonTemplateGameMode, 'OnNPCSpawned'), self)
  ListenToGameEvent('entity_hurt', Dynamic_Wrap(CAddonTemplateGameMode, 'OnEntityHurt'), self)
  ListenToGameEvent("entity_killed", Dynamic_Wrap(CAddonTemplateGameMode, "OnEntityKilled"), self)
  --GameRules:GetGameModeEntity():SetItemAddedToInventoryFilter( Dynamic_Wrap(CAddonAdvExGameMode, "ItemAddedFilter"), self )

end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

function spawnGoodFlag()
  print("spawnGoodFlag")
--  local flag = CreateItem("item_capture_good_flag", nil, nil)
--  CreateItemOnPositionSync(Vector(-1822.81, -636.813, 128), flag)
  local flag = CreateItem("item_capture_good_flag", nil, nil)
  CreateItemOnPositionSync(Vector(-3303.79, 1382.76, 128), flag)


end

function spawnBadFlag()
  print("spawnBadFlag")
  --local flag = CreateItem("item_capture_bad_flag", nil, nil)
  --CreateItemOnPositionSync(Vector(-153.281, 2337.62, 128), flag)
  local flag = CreateItem("item_capture_bad_flag", nil, nil)
  CreateItemOnPositionSync(Vector(4091.37, 1269.95, 128), flag)



end


function reset()
  print("reset")
  _G.GAME_ROUND = _G.GAME_ROUND + 1
 -- local heroes = GetAllRealHeroes()
  for i = 0, (DOTA_MAX_TEAM_PLAYERS-1) do
    player = PlayerResource:GetPlayer(i)
    --print(player)
      if (player ~=nil) then
        hero = player:GetAssignedHero()
        gold = CONSTANTS.goldForPoint
        --GIVE GOLD TO ALL UNITS AT EVERY RESET 
        hero:SetGold(hero:GetGold() + gold, false)
        --print(hero)
        if (hero ~=nil) then
      --hero:RemoveModifierByName("modifier_stunned")
          if hero:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
            local point =  Entities:FindByName( nil, "radiantTP" ):GetAbsOrigin()
            FindClearSpaceForUnit(hero, point, false)
            hero:Stop()
            SendToConsole("dota_camera_center")
            hero:AddNewModifier(hero, nil, "modifier_stun", nil)
            --Timers:CreateTimer(3)
            --hero:RemoveModifierByName("modifier_stun")
            --print("LAL")
          end
          if hero:GetTeamNumber() == DOTA_TEAM_BADGUYS then
            local point =  Entities:FindByName( nil, "direTP" ):GetAbsOrigin()
            FindClearSpaceForUnit(hero, point, false)
            hero:Stop()
            SendToConsole("dota_camera_center")
            hero:AddNewModifier(hero, nil, "modifier_stun", nil)
            --Timers:CreateTimer(3)
            --hero:RemoveModifierByName("modifier_stun")
            --print("LAL")
          end
          for i = 0,5 do
            local item = hero:GetItemInSlot(i)
            if item then
              if item:GetAbilityName() == "item_capture_good_flag" then
                print("force drop")
                hero:RemoveItem(item)
                spawnGoodFlag()
              end
              if item:GetAbilityName() == "item_capture_bad_flag" then
                print("force drop")
                hero:RemoveItem(item)
                spawnBadFlag()
              end
            end
          end
        end
      end
    end
end


function CAddonTemplateGameMode:OnNPCSpawned(keys)
  local hero = EntIndexToHScript(keys.entindex)
  if hero:IsHero() then
    print("OnNPCSpawnedX")
    hero:SetAbilityPoints(1)
  end
end

function CAddonTemplateGameMode:OnEntityHurt(tbl)
        print("!!! BEGIN OnEntityHurt !!!")
        local victim = EntIndexToHScript(tbl.entindex_killed)
        local attacker = EntIndexToHScript(tbl.entindex_attacker)
        print(attacker:GetName() .. " is attacking " .. victim:GetName())
        -- DeepPrintTable(tbl)
        print("!!! END OnEntityHurt !!!")
        --CTF:Teleport(victim, attacker)
        --CTF:JailRelease(victim, attacker)
end

function CAddonTemplateGameMode:OnGameRulesStateChange()
        local nNewState = GameRules:State_Get()
        if nNewState == DOTA_GAMERULES_STATE_PRE_GAME then
                print( "[CTF] Gamemode is running." )
                ShowGenericPopup( "#CTF_instructions_title", "#CTF_instructions_body", "", "", DOTA_SHOWGENERICPOPUP_TINT_SCREEN )
                GameRules:SendCustomMessage("Welcome to " .. COLOR_GREEN .. "Capture The Flag " .. VERSION .. COLOR_NONE .. " by " .. COLOR_RED .. AUTHOR, DOTA_TEAM_NOTEAM, 0)
        end
end

function CAddonTemplateGameMode:OnEntityHurt(tbl)
  --DebugPrint("[BAREBONES] Entity Hurt")
  --DebugPrintTable(keys)
  print( "SOMEONE GOT HURT" )
  local victim = EntIndexToHScript(tbl.entindex_killed)
  local attacker = EntIndexToHScript(tbl.entindex_attacker)

  if attacker:IsHero() then
    attacker:AddExperience(30 + _G.GAME_ROUND * 5, DOTA_ModifyXP_Unspecified, false, false)
    --attacker:AddExperience(hero:GetCurrentXP() + 100, DOTA_ModifyXP_Unspecified, false, false)
    attacker:SetGold(attacker:GetGold() + 25, false)
  end


  if attacker:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    for i = 0,5 do
      local item = victim:GetItemInSlot(i)
      if item then
        if item:GetAbilityName() == "item_capture_bad_flag" or item:GetAbilityName() == "item_capture_good_flag" then
          victim:RemoveItem(item)
          GameRules:SendCustomMessage("Bad Guys' Flag Has Been Dropped ", DOTA_TEAM_NOTEAM, 0)
          spawnBadFlag()          
        end
      end
    end       
  local ent = Entities:FindByName( nil, "point_teleport_jail_dire" ):GetAbsOrigin()
  FindClearSpaceForUnit(victim, ent, false)
  victim:Stop()
  --victim:AddNewModifier(victim, nil, "modifier_invulnerable", nil)
  print("inv")
  end

  if attacker:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    for i = 0,5 do
    local item = victim:GetItemInSlot(i)
      if item then
        if item:GetAbilityName() == "item_capture_bad_flag" or item:GetAbilityName() == "item_capture_good_flag" then
          victim:RemoveItem(item)
          GameRules:SendCustomMessage("Good Guys' Flag Has Been Dropped ", DOTA_TEAM_NOTEAM, 0)
          spawnGoodFlag()          
        end
      end
    end      
  local ent = Entities:FindByName( nil, "point_teleport_jail_radiant" ):GetAbsOrigin()
  FindClearSpaceForUnit(victim, ent, false)
  victim:Stop()
  --victim:AddNewModifier(victim, nil, "modifier_invulnerable", nil)
  print("inv")
  end

end

function CAddonTemplateGameMode:OnEntityKilled (event)
	print("Someone Died Lol")
	local killedEntity = EntIndexToHScript(event.entindex_killed)
	if killedEntity ~= nil then
	end
end


function updateScore(scoreGood, scoreBad)
  print("Updating score: " .. scoreGood .. " x " .. scoreBad)

  local CAddonTemplateGameMode = GameRules:GetGameModeEntity()
  --GameMode:SetTopBarTeamValue(DOTA_TEAM_GOODGUYS, scoreGood)
  --GameMode:SetTopBarTeamValue(DOTA_TEAM_BADGUYS, scoreBad)
  GameRules:GetGameModeEntity():SetTopBarTeamValue(DOTA_TEAM_GOODGUYS, scoreGood)
  GameRules:GetGameModeEntity():SetTopBarTeamValue(DOTA_TEAM_BADGUYS, scoreBad)

  -- If any team reaches scoreToWin, the game ends and that team is considered winner.
  if scoreGood == CONSTANTS.scoreToWin then
    print("Team GOOD GUYS victory!")
    GameRules:SetGameWinner(DOTA_TEAM_GOODGUYS)
  end
  if scoreBad == CONSTANTS.scoreToWin then
    print("Team BAD GUYS victory!")
    GameRules:SetGameWinner(DOTA_TEAM_BADGUYS)
  end
end


--[[
function CAddonTemplateGameMode:ItemAddedFilter( keys )
  print("ItemAddedFilter")
  local unit = EntIndexToHScript(keys.inventory_parent_entindex_const)
  local item = EntIndexToHScript(keys.item_entindex_const)
  local item_name = 0
  print(item)
  if item:GetName() then
    item_name = item:GetName()
    print(item_name)
  end
  -------------------------------------------------------------------------------------------------
  -- Rune pickup logic
  -------------------------------------------------------------------------------------------------
  if item_name == "item_rune_bounty" then

    -- Only real heroes can pick up runes
    --if unit:IsRealHero() then
      if item_name == "item_rune_bounty" then
        PickupBountyRune(item, unit)
        return false
      end

      if item_name == "item_rune_double_damage" then
        PickupDoubleDamageRune(item, unit)
        return false
      end

      if item_name == "item_rune_haste" then
        PickupHasteRune(item, unit)
        return false
      end

      if item_name == "item_rune_regeneration" then
        PickupRegenerationRune(item, unit)
        return false
      end

    -- If this is not a real hero, drop another rune in place of the picked up one
    -- else
    --  local new_rune = CreateItem(item_name, nil, nil)
    --  CreateItemOnPositionForLaunch(item:GetAbsOrigin(), new_rune)
    --  return false
    -- end
  end
  return true
end
]]--



--[[
function point(nameHero)
  print("Check NAMEHERO:")
  print(nameHero)
  if nameHero == CONSTANTS.goodGuysHero then
    print("Radiant Point!}")
    GameRules:SendCustomMessage("Good Guys Scored", DOTA_TEAM_NOTEAM, 0)
    score.Good = score.Good + 1
  else
    print("Dire Point!")
    GameRules:SendCustomMessage("Bad Guys Scored", DOTA_TEAM_NOTEAM, 0)
    score.Bad = score.Bad + 1
  end
  updateScore(score.Good, score.Bad)
  -- gold for the team how made point
 print("pre")
 ]]--
  
--end

function pointBad()
    print("Bad Team Point!}")
    GameRules:SendCustomMessage("Bad Guys Scored", DOTA_TEAM_NOTEAM, 0)
    score.Bad = score.Bad + 1
    updateScore(score.Good, score.Bad)
end

function pointGood()
    print("Good Team Point!}")
    GameRules:SendCustomMessage("Good Guys Scored", DOTA_TEAM_NOTEAM, 0)
    score.Good = score.Good + 1
    updateScore(score.Good, score.Bad)
end





--[[
function GetAllRealHeroes()
    local rheroes = {}
    local heroes = HeroList:GetAllHeroes()
    
    for i=1,#heroes do
        if heroes[i]:IsRealHero() then
            print("woo")
            print(heroes[i])
            print("woo")
            table.insert(rheroes,heroes[i])
        end
    end
    return rheroes
end
]]--


