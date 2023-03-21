local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_DARKPURPLE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -4.5, -800, -2.0, -900)

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x-1, y=getThingPosition(getCreatureTarget(cid)).y-1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 46)
local position2 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position2, 418)
return doCombat(cid, combat1, var)
end
 
function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8222

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
for k = 1, 2 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 100, cid, var)
        end
    end, 1 + ((k-1) * 600))
end
exhaustion.set(cid, storage, waittime)
return true
end