require('effect_modifiers')


print("testjail0")


function BountyTriggered(trigger)
  if trigger.activator and trigger.activator:GetTeamNumber() == DOTA_TEAM_BADGUYS then
	  --local point1 = Entities:FindByName( nil, "point_teleport_spot1" ):GetAbsOrigin()
    --FindClearSpaceForUnit(trigger.activator, point1, false)
    --trigger.activator:Stop()
    --SendToConsole("dota_camera_center")
    trigger.activator:SetGold(trigger.activator:GetGold() + 50, false)
    trigger.activator:AddExperience(50, DOTA_ModifyXP_Unspecified, false, false)
  end
end

function BountyTriggered2(trigger)
  if trigger.activator and trigger.activator:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    --local point2 = Entities:FindByName( nil, "point_teleport_spot2" ):GetAbsOrigin()
    --FindClearSpaceForUnit(trigger.activator, point2, false)
    --trigger.activator:Stop()
    --SendToConsole("dota_camera_center")
    trigger.activator:SetGold(trigger.activator:GetGold() + 50, false)
    trigger.activator:AddExperience(50, DOTA_ModifyXP_Unspecified, false, false)
  end
end

function BountyTriggered3(trigger)
    print("In Trigger 3")
   -- local point3 = Entities:FindByName(Vector(345.051, -4556.62, 143.059):GetAbsOrigin()
    --FindClearSpaceForUnit(trigger.activator, Vector(345.051, 4556.62, 143.059), false)
    --trigger.activator:Stop()
    --SendToConsole("dota_camera_center")
    trigger.activator:SetGold(trigger.activator:GetGold() + 50, false)
    trigger.activator:AddExperience(50, DOTA_ModifyXP_Unspecified, false, false)
end

function BountyTriggered4(trigger)
  if trigger.activator and trigger.activator:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    --print("in trigger 4")
    --local point4 = Entities:FindByName( nil, Vector(1993.81, 3523.18, 283.178) ):GetAbsOrigin()
    --FindClearSpaceForUnit(trigger.activator, Vector(1993.81, 3523.18, 283.178), false)
    --trigger.activator:Stop()
    --SendToConsole("dota_camera_center")
    trigger.activator:SetGold(trigger.activator:GetGold() + 50, false)
    trigger.activator:AddExperience(50, DOTA_ModifyXP_Unspecified, false, false)
  end
end

function BountyTriggered5(trigger)
  if trigger.activator and trigger.activator:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
    --print("in trigger 5")
    --local point5 = Entities:FindByName( nil, "point_teleport_spot5" ):GetAbsOrigin()
    --FindClearSpaceForUnit(trigger.activator, Vector(3771.01, 4031.09, 162.295), false)
    --trigger.activator:Stop()
    --SendToConsole("dota_camera_center")
    trigger.activator:SetGold(trigger.activator:GetGold() + 50, false)
    trigger.activator:AddExperience(50, DOTA_ModifyXP_Unspecified, false, false)
  end
end



function OnEndTouch(trigger)

  print(trigger.activator)
  print(trigger.caller)
end


function JailTriggeredDire(trigger)
  print("YAY")
    
--[[    if trigger.activator and trigger.activator:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
      -- Get the position of the "point_teleport_spot"-entity we put in our map
      local point =  Entities:FindByName( nil, "point_teleport_spot2" ):GetAbsOrigin()
      -- Find a spot for the hero around 'point' and teleports to it
      FindClearSpaceForUnit(trigger.activator, point, false)
      -- Stop the hero, so he doesn't move
      trigger.activator:Stop()
      -- Refocus the camera of said player to the position of the teleported hero.
      SendToConsole("dota_camera_center")
      --local v = point
--v.x = v.x + RandomInt(0,5)
--v.y = v.y + RandomInt(0,5)

    end
 
--]]
  end

function JailTriggeredDire2(trigger)
  print(trigger.activator)
  print(trigger.caller)
end


function JailMuteDire(trigger)
    print("YAY1")
    if trigger.activator and trigger.activator:GetTeamNumber() == DOTA_TEAM_GOODGUYS then
      trigger.activator:AddNewModifier(trigger.activator, nil, "modifier_invulnerable", nil)
      trigger.activator:AddNewModifier(trigger.activator, nil, "modifier_silence", nil)
      giveUnitDataDrivenModifier(trigger.activator, trigger.activator, "modifier_make_muted", nil)
      --giveUnitDataDrivenModifier(trigger.activator, trigger.activator, "modifier_make_muted", nil) -- "-1" means that it will last forever (or until its removed)
      trigger.activator:AddNewModifier(trigger.activator, nil, "modifier_disarmed", nil)
      _G.GoodinPrison = _G.GoodinPrison + 1
      print("Good in Prison is")
      print (_G.GoodinPrison)
      if _G.GoodinPrison == _G.GoodPlayers then
        pointBad()
        reset()
     end
   end
  end



function JailMuteDire2(trigger)
    print(trigger.activator)
    print(trigger.caller)
    if trigger.activator then
    trigger.activator:RemoveModifierByName("modifier_invulnerable")
    trigger.activator:RemoveModifierByName("modifier_silence")
    trigger.activator:RemoveModifierByName("modifier_disarmed")
    trigger.activator:RemoveModifierByName("modifier_make_muted")
    _G.GoodinPrison = _G.GoodinPrison - 1
    print("Bad in Prison is")
   end
end

function JailMuteRadiant(trigger)
    print("YAY1")
    if trigger.activator and trigger.activator:GetTeamNumber() == DOTA_TEAM_BADGUYS then
    print("YAY2")
      trigger.activator:AddNewModifier(trigger.activator, nil, "modifier_invulnerable", nil)
      trigger.activator:AddNewModifier(trigger.activator, nil, "modifier_silence", nil)
      giveUnitDataDrivenModifier(trigger.activator, trigger.activator, "modifier_make_muted", nil)

      --giveUnitDataDrivenModifier(trigger.activator, trigger.activator, "modifier_make_muted", nil) -- "-1" means that it will last forever (or until its removed)
      trigger.activator:AddNewModifier(trigger.activator, nil, "modifier_disarmed", nil)
      _G.BadinPrison = _G.BadinPrison + 1
      print (_G.BadinPrison)
      if _G.BadinPrison == _G.BadPlayers then
        pointGood()
        reset()
     end
     end
  end



function JailMuteRadiant2(trigger)
    print(trigger.activator)
    print(trigger.caller)
    if trigger.activator then
    trigger.activator:RemoveModifierByName("modifier_invulnerable")
    trigger.activator:RemoveModifierByName("modifier_silence")
    trigger.activator:RemoveModifierByName("modifier_disarmed")
    trigger.activator:RemoveModifierByName("modifier_make_muted")
    _G.BadinPrison = _G.BadinPrison - 1
    end
end


  
function GiveFlask (hero)
    if hero:HasRoomForItem("item_flask", true, true) then
       local flask = CreateItem("item_flask", hero, hero)
       flask:SetPurchaseTime(0)
       hero:AddItem(flask)
    end
 end

function OnStartTouch(trigger)
  print("testjail1")
  GiveFlask(hero)
  print(trigger.activator)
  print(trigger.caller)
  
end








--[[function spawn(keys)
  local inTrigger = false
  local CHECKINGRADIUS = 10

    for _,thing in pairs(Entities:FindAllInSphere(GetGroundPosition(keys.target_points[1], nil), CHECKINGRADIUS) )  do

        if (thing:GetName() == "jail_box") then
            --In no_ward trigger. Set flag.
            inTrigger = true
        end

    end
    
    if (inTrigger == True)
       --Used onto specified area. Do stuff...
       print("in JAIL")
    end
end
--]]