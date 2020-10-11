require('addon_game_mode')


function pickOrReturnGoodFlag(event)
  local unit = EntIndexToHScript(event.caster_entindex)
  CustomGameEventManager:Send_ServerToAllClients( "Good Flag Taken", {})
  print("Good Flag Taken")
  print(unit:GetUnitName())
  
  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    print('Bad Guys Took Good Flag')
    GameRules:SendCustomMessage("<font color='#ff4c4c'>BAD GUYS TOOK THE FLAG!!!</font>", DOTA_TEAM_NOTEAM, 0)
    EmitGlobalSound("tutorial_rockslide")
    _G.BadHasFlag = 1
    
    local WhoHasFlag = 
    {
    GoodHasFlag = _G.GoodHasFlag, 
    BadHasFlag = _G.BadHasFlag 
    }
    CustomGameEventManager:Send_ServerToAllClients( "has_flag", WhoHasFlag )
  end
  
  --[[
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    print("Good Guy took Good Flag")
    GameRules:SendCustomMessage("good guys took their own flag. pls dont. good players who pick up their own flag again will go to jail", DOTA_TEAM_NOTEAM, 0)
    for i = 0,5 do
      print("i:"..i)
      local item = unit:GetItemInSlot(i)
      if item then
        print("item:"..item:GetAbilityName())
        if item:GetAbilityName() == "item_capture_good_flag" then
          unit:RemoveItem(item)
          spawnGoodFlag()
          print("good guy drop their own flag")
        end
      end
    end
  end
--]]


end

function pickOrReturnBadFlag(event)
  local unit = EntIndexToHScript(event.caster_entindex)
  print("Bad Flag Taken")
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    GameRules:SendCustomMessage("<font color='#66b266'>GOOD GUYS TOOK THE FLAG!!!</font>", DOTA_TEAM_NOTEAM, 0)    
    print('Good Guys Took Good Flag')
    EmitGlobalSound( "Hero_Invoker.SunStrike.Ignite" )
    _G.GoodHasFlag = 1
    local WhoHasFlag = 
    {
    GoodHasFlag = _G.GoodHasFlag, 
    BadHasFlag = _G.BadHasFlag 
    } 

    
    CustomGameEventManager:Send_ServerToAllClients("has_flag", WhoHasFlag )

  end
  EmitGlobalSound("compendium_levelup")
  print(unit:GetUnitName())
  --[[
  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    print("Bad Guy took Bad Flag")
    GameRules:SendCustomMessage("bad guys took their own flag. pls dont. bad players who pick up their own flag again will go to jail", DOTA_TEAM_NOTEAM, 0)
    for i = 0,5 do
      print("i:"..i)
      local item = unit:GetItemInSlot(i)
      if item then
        print("item nome:"..item:GetAbilityName())
        if item:GetAbilityName() == "item_capture_bad_flag" then
         unit:RemoveItem(item)
          print("Bad Guy Drop Bad Flag")
          spawnBadFlag()
        end
      end
    end
  end
  --]]
end



function bountypickup(event)
    local unit = EntIndexToHScript(event.caster_entindex)
    print(unit)
    print("potato")
    unit:AddExperience(15 + _G.GAME_ROUND * 3 , DOTA_ModifyXP_Unspecified, false, false)
    --attacker:AddExperience(hero:GetCurrentXP() + 100, DOTA_ModifyXP_Unspecified, false, false)
    unit:SetGold(unit:GetGold() + 15 + _G.GAME_ROUND * 7, false)
end

function OnPlayerPickupCoinA(keys)
  local caster = keys.caster
  local unit = EntIndexToHScript(keys.caster_entindex)
  local bountyrune1 = CreateItem("item_bounty_rune_A", nil, nil)  
  
  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    unit:AddExperience(15 + _G.GAME_ROUND * 3 , DOTA_ModifyXP_Unspecified, false, false)
    unit:SetGold(unit:GetGold() + 15 + _G.GAME_ROUND * 7, false)
    UTIL_RemoveImmediate(keys.ability)
    EmitSoundOn("General.Coins",caster)
  end

  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    CreateItemOnPositionSync(Vector(-1845.27, 2654.2, 472.1),bountyrune1)
    print("potatoGood")
    for i = 0,5 do
    local item = unit:GetItemInSlot(i)
    if item then
      --print("item:"..item:GetAbilityName())
      if item:GetAbilityName() == "item_bounty_rune_A" then
          --print("found the item!")
        unit:RemoveItem(item)
        print("good guy drop their own bounty")
      end
     end
  end
 end
end


function OnPlayerPickupCoinB(keys)
  local caster = keys.caster
  local unit = EntIndexToHScript(keys.caster_entindex)
  local bountyrune2 = CreateItem("item_bounty_rune_B", nil, nil)  

  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
  unit:AddExperience(15 + _G.GAME_ROUND * 3 , DOTA_ModifyXP_Unspecified, false, false)
  unit:SetGold(unit:GetGold() + 15 + _G.GAME_ROUND * 7, false)
  UTIL_RemoveImmediate(keys.ability)
  EmitSoundOn("General.Coins",caster)
  end
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    CreateItemOnPositionSync(Vector(-3474.08, 3185.92, 267.534), bountyrune2)
    print("potatoGood")
    for i = 0,5 do
    local item = unit:GetItemInSlot(i)
    if item then
      --print("item:"..item:GetAbilityName())
      if item:GetAbilityName() == "item_bounty_rune_B" then
          --print("found the item!")
        unit:RemoveItem(item)
          print("good guy drop their own bounty")
      end
     end
  end
 end
end

function OnPlayerPickupCoinC(keys)
  local caster = keys.caster
  local unit = EntIndexToHScript(keys.caster_entindex)
  local bountyrune3 = CreateItem("item_bounty_rune_C", nil, nil)  

  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
  CreateItemOnPositionSync(Vector(-1971.92, -415.389, 289.565), bountyrune3)
  unit:AddExperience(15 + _G.GAME_ROUND * 3 , DOTA_ModifyXP_Unspecified, false, false)
  unit:SetGold(unit:GetGold() + 15 + _G.GAME_ROUND * 7, false)
  UTIL_RemoveImmediate(keys.ability)
  EmitSoundOn("General.Coins",caster)
  end
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    print("potatoGood")
    for i = 0,5 do
    local item = unit:GetItemInSlot(i)
    if item then
      --print("item:"..item:GetAbilityName())
      if item:GetAbilityName() == "item_bounty_rune_C" then
          --print("found the item!")
        unit:RemoveItem(item)
          print("good guy drop their own bounty")
      end
     end
  end
 end
end

function OnPlayerPickupCoinD(keys)
  local caster = keys.caster
  local unit = EntIndexToHScript(keys.caster_entindex)
  
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
  unit:AddExperience(15 + _G.GAME_ROUND * 3 , DOTA_ModifyXP_Unspecified, false, false)
  unit:SetGold(unit:GetGold() + 15 + _G.GAME_ROUND * 7, false)
  UTIL_RemoveImmediate(keys.ability)
  EmitSoundOn("General.Coins",caster)
  end
end

function OnPlayerPickupCoinE(keys)
  local caster = keys.caster
  local unit = EntIndexToHScript(keys.caster_entindex)
  
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
  unit:AddExperience(15 + _G.GAME_ROUND * 3 , DOTA_ModifyXP_Unspecified, false, false)
  unit:SetGold(unit:GetGold() + 15 + _G.GAME_ROUND * 7, false)
  UTIL_RemoveImmediate(keys.ability)
  EmitSoundOn("General.Coins",caster)
  end
end

function OnPlayerPickupCoinF(keys)
  local caster = keys.caster
  local unit = EntIndexToHScript(keys.caster_entindex)
  
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
  unit:AddExperience(15 + _G.GAME_ROUND * 3 , DOTA_ModifyXP_Unspecified, false, false)
  unit:SetGold(unit:GetGold() + 15 + _G.GAME_ROUND * 7, false)
  UTIL_RemoveImmediate(keys.ability)
  EmitSoundOn("General.Coins",caster)
  end
end