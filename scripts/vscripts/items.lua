require('addon_game_mode')

function pickOrReturnGoodFlag(event)
  local unit = EntIndexToHScript(event.caster_entindex)
  print("Good Flag Taken")
  print(unit:GetUnitName())
  if unit:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    print("Good Guy took Good Flag")
    for i = 0,5 do
      print("i:"..i)
      local item = unit:GetItemInSlot(i)
      if item then
        print("item nome:"..item:GetAbilityName())
        if item:GetAbilityName() == "item_capture_good_flag" then
          unit:RemoveItem(item)
          print("Good Guy Drop Good Flag")
        end
      end
    end
    spawnGoodFlag()
  end
end

function pickOrReturnBadFlag(event)
  local unit = EntIndexToHScript(event.caster_entindex)
  print("Bad Flag Taken")
  print(unit:GetUnitName())
  if unit:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    print("Bad Guy took Bad Flag")
    for i = 0,5 do
      print("i:"..i)
      local item = unit:GetItemInSlot(i)
      if item then
        print("item nome:"..item:GetAbilityName())
        if item:GetAbilityName() == "item_capture_bad_flag" then
          unit:RemoveItem(item)
          print("Bad Guy Drop Bad Flag")
        end
      end
    end
    spawnBadFlag()
  end
end
