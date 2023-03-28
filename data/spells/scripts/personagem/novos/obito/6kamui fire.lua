local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)  

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -6.0, -1400, -6.0, -1600)

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)

local target = getCreatureTarget(cid)
if not target or not isCreature(target) then
    return false
end

local position11 = getThingPosition(target)
if not position11 then
    return false
end
local position1 = {x=position11.x+2, y=position11.y+2, z=position11.z}
doSendMagicEffect(position1, 9)
return doCombat(cid, combat1, var)
end
 
local function onCastSpell2(cid, var)
local pos = getCreaturePosition(cid)

local target2 = getCreatureTarget(cid)
if not target2 or not isCreature(target2) then
    return false
end
local position22 = getThingPosition(target2)
if not position22 then
    return false
end
local position2 = {x=position22.x, y=position22.y, z=position22.z}
doSendMagicEffect(position2, 10)
return doCombat(cid, combat2, var)
end
 
function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 8241

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
for k = 1, 1 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 1, cid, var)
			addEvent(onCastSpell2, 600, cid, var)
        end
    end, 1 + ((k-1) * 1000))
end
exhaustion.set(cid, storage, waittime)
return true
end