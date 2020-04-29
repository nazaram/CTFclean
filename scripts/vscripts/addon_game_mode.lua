-- Generated from template

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

if score == nil then
  score = class({})
  score.Bad = 0
  score.Good = 0
end



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
  	GameRules:GetGameModeEntity():SetThink("OnThink", self, "GlobalThink", 2)

  	--ListenToGameEvent('npc_spawned', Dynamic_Wrap(CTF, 'OnNPCSpawned'), self)
  	--ListenToGameEvent('entity_hurt', Dynamic_Wrap(CTF, 'OnEntityHurt'), self)


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
  local flag = CreateItem("item_capture_good_flag", nil, nil)
  CreateItemOnPositionSync(Vector(-1822.81, -636.813, 128), flag)
end

function spawnBadFlag()
  print("spawnBadFlag")
  local flag = CreateItem("item_capture_bad_flag", nil, nil)
  CreateItemOnPositionSync(Vector(-153.281, 2337.62, 128), flag)
end


function CAddonTemplateGameMode:OnNPCSpawned(keys)
  local hero = EntIndexToHScript(keys.entindex)
  if hero:IsHero() then
    print("OnNPCSpawnedX")
    hero:SetAbilityPoints(0)
  end
end