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
  end
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
end

function pickOrReturnBadFlag(event)
  local unit = EntIndexToHScript(event.caster_entindex)
  print("Bad Flag Taken")
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    GameRules:SendCustomMessage("<font color='#66b266'>GOOD GUYS TOOK THE FLAG!!!</font>", DOTA_TEAM_NOTEAM, 0)    
    print('Good Guys Took Good Flag')
    EmitGlobalSound( "Hero_Invoker.SunStrike.Ignite" )
    _G.GoodHasFlag = 1
  end
  EmitGlobalSound("compendium_levelup")
  print(unit:GetUnitName())
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
end
