require('addon_game_mode')


function enterGoodArea(trigger)
  local unit = trigger.activator
  print("Enter Good")
  print(unit:GetUnitName())
  print(unit:GetTeamNumber())
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    unit:AddNewModifier(unit, nil, "modifier_magic_immune", {})
    unit:AddNewModifier(unit, nil, "modifier_attack_immune", {})
    for i = 0,5 do
      local item = unit:GetItemInSlot(i)
      if item then
        if item:GetAbilityName() == "item_capture_bad_flag" then
          unit:RemoveModifierByName("modifier_magic_immune")
          unit:RemoveModifierByName("modifier_attack_immune")
        end
      end
     end
  end
end

function enterBadArea(trigger)
  local unit = trigger.activator
  print("Enter Bad")
  print(unit:GetUnitName())
  print(unit:GetTeamNumber())
  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    unit:AddNewModifier(unit, nil, "modifier_magic_immune", {})
    unit:AddNewModifier(unit, nil, "modifier_attack_immune", {})
    for i = 0,5 do
      local item = unit:GetItemInSlot(i)
      if item then
        if item:GetAbilityName() == "item_capture_good_flag" then
          unit:RemoveModifierByName("modifier_magic_immune")
          unit:RemoveModifierByName("modifier_attack_immune")
        end
      end
     end
  end
end


function leaveGoodArea(trigger)
  local unit = trigger.activator
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    unit:RemoveModifierByName("modifier_magic_immune")
    unit:RemoveModifierByName("modifier_attack_immune")
  end
end



function leaveBadArea(trigger)
  local unit = trigger.activator
  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    unit:RemoveModifierByName("modifier_magic_immune")
    unit:RemoveModifierByName("modifier_attack_immune")
  end
end

function enterGoodAreaBack(trigger)
  local unit = trigger.activator
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    for i = 0,5 do
      local item = unit:GetItemInSlot(i)
      if item then
        if item:GetAbilityName() == "item_capture_bad_flag" then
          unit:RemoveItem(item)
          spawnBadFlag()
          pointGood()
         -- point(CONSTANTS.goodGuysHero)
          unit:IncrementDenies()
          reset()
          rewardGoodWin()
          unit:SetGold(unit:GetGold() + 100, false)        
        end
      end
    end    
  end
end



function enterBadAreaBack(trigger)
  local unit = trigger.activator
  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    for i = 0,5 do
      local item = unit:GetItemInSlot(i)
      if item then
        if item:GetAbilityName() == "item_capture_good_flag" then
          unit:RemoveItem(item)
          pointBad()
          --point(CONSTANTS.badGuysHero)
          unit:IncrementDenies()
          spawnGoodFlag()
          reset()
          unit:SetGold(unit:GetGold() + 100, false)
          rewardBadWin()
        end
      end
    end    
  end
end



function rewardBadWin()
    for i = 0, (DOTA_MAX_TEAM_PLAYERS-1) do
      player = PlayerResource:GetPlayer(i)
      --print(player)
        if (player ~=nil) then
          hero = player:GetAssignedHero()
--          hero:HeroLevelUp(true)
          if hero:GetTeamNumber() == DOTA_TEAM_BADGUYS then             
            if _G.GAME_ROUND == 1 then
              hero:AddExperience(GAME_ROUND1experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 2 then
              hero:AddExperience(GAME_ROUND2experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 3 then
              hero:AddExperience(GAME_ROUND3experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 4 then
              hero:AddExperience(GAME_ROUND4experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 5 then
              hero:AddExperience(GAME_ROUND5experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 6 then
              hero:AddExperience(GAME_ROUND6experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 7 then
              hero:AddExperience(GAME_ROUND7experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 8 then
              hero:AddExperience(GAME_ROUND8experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 9 then
              hero:AddExperience(GAME_ROUND9experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 10 then
              hero:AddExperience(GAME_ROUND10experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 11 then
              hero:AddExperience(GAME_ROUND11experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 12 then
              hero:AddExperience(GAME_ROUND12experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 13 then
              hero:AddExperience(GAME_ROUND13experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 14 then
              hero:AddExperience(GAME_ROUND14experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 15 then
              hero:AddExperience(GAME_ROUND15experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 16 then
              hero:AddExperience(GAME_ROUND16experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 17 then
              hero:AddExperience(GAME_ROUND17experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 18 then
              hero:AddExperience(GAME_ROUND18experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 19 then
              hero:AddExperience(GAME_ROUND19experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 20 then
              hero:AddExperience(GAME_ROUND20experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
          end
          if hero:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
            if _G.GAME_ROUND == 1 then
              hero:AddExperience(GAME_ROUND1experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 2 then
              hero:AddExperience(GAME_ROUND2experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 3 then
              hero:AddExperience(GAME_ROUND3experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 4 then
              hero:AddExperience(GAME_ROUND4experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 5 then
              hero:AddExperience(GAME_ROUND5experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 6 then
              hero:AddExperience(GAME_ROUND6experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 7 then
              hero:AddExperience(GAME_ROUND7experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 8 then
              hero:AddExperience(GAME_ROUND8experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 9 then
              hero:AddExperience(GAME_ROUND9experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 10 then
              hero:AddExperience(GAME_ROUND10experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 11 then
              hero:AddExperience(GAME_ROUND11experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 12 then
              hero:AddExperience(GAME_ROUND12experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 13 then
              hero:AddExperience(GAME_ROUND13experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 14 then
              hero:AddExperience(GAME_ROUND14experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 15 then
              hero:AddExperience(GAME_ROUND15experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 16 then
              hero:AddExperience(GAME_ROUND16experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 17 then
              hero:AddExperience(GAME_ROUND17experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 18 then
              hero:AddExperience(GAME_ROUND18experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 19 then
              hero:AddExperience(GAME_ROUND19experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 20 then
              hero:AddExperience(GAME_ROUND20experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
          end
        end
      end
    end

function rewardGoodWin()
    for i = 0, (DOTA_MAX_TEAM_PLAYERS-1) do
      player = PlayerResource:GetPlayer(i)
      --print(player)
        if (player ~=nil) then
          hero = player:GetAssignedHero()
--          hero:HeroLevelUp(true)
          if hero:GetTeamNumber() == DOTA_TEAM_GOODGUYS then             
            if _G.GAME_ROUND == 1 then
              hero:AddExperience(GAME_ROUND1experiencewin(), DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 2 then
              hero:AddExperience(GAME_ROUND2experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 3 then
              hero:AddExperience(GAME_ROUND3experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 4 then
              hero:AddExperience(GAME_ROUND4experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 5 then
              hero:AddExperience(GAME_ROUND5experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 6 then
              hero:AddExperience(GAME_ROUND6experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 7 then
              hero:AddExperience(GAME_ROUND7experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 8 then
              hero:AddExperience(GAME_ROUND8experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 9 then
              hero:AddExperience(GAME_ROUND9experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 10 then
              hero:AddExperience(GAME_ROUND10experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 11 then
              hero:AddExperience(GAME_ROUND11experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 12 then
              hero:AddExperience(GAME_ROUND12experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 13 then
              hero:AddExperience(GAME_ROUND13experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 14 then
              hero:AddExperience(GAME_ROUND14experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 15 then
              hero:AddExperience(GAME_ROUND15experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 16 then
              hero:AddExperience(GAME_ROUND16experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 17 then
              hero:AddExperience(GAME_ROUND17experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 18 then
              hero:AddExperience(GAME_ROUND18experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 19 then
              hero:AddExperience(GAME_ROUND19experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 20 then
              hero:AddExperience(GAME_ROUND20experiencewin, DOTA_ModifyXP_Unspecified, false, false)
            end
          end
          if hero:GetTeamNumber() == DOTA_TEAM_BADGUYS then
            if _G.GAME_ROUND == 1 then
              hero:AddExperience(GAME_ROUND1experiencelose(), DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 2 then
              hero:AddExperience(GAME_ROUND2experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 3 then
              hero:AddExperience(GAME_ROUND3experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 4 then
              hero:AddExperience(GAME_ROUND4experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 5 then
              hero:AddExperience(GAME_ROUND5experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 6 then
              hero:AddExperience(GAME_ROUND6experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 7 then
              hero:AddExperience(GAME_ROUND7experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 8 then
              hero:AddExperience(GAME_ROUND8experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 9 then
              hero:AddExperience(GAME_ROUND9experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 10 then
              hero:AddExperience(GAME_ROUND10experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 11 then
              hero:AddExperience(GAME_ROUND11experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 12 then
              hero:AddExperience(GAME_ROUND12experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 13 then
              hero:AddExperience(GAME_ROUND13experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 14 then
              hero:AddExperience(GAME_ROUND14experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 15 then
              hero:AddExperience(GAME_ROUND15experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 16 then
              hero:AddExperience(GAME_ROUND16experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 17 then
              hero:AddExperience(GAME_ROUND17experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 18 then
              hero:AddExperience(GAME_ROUND18experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 19 then
              hero:AddExperience(GAME_ROUND19experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
            if _G.GAME_ROUND == 20 then
              hero:AddExperience(GAME_ROUND20experiencelose, DOTA_ModifyXP_Unspecified, false, false)
            end
          end
        end
      end
    end







  
