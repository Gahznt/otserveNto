function onGetFormulaValues(cid, level, maglevel)
    min = -(level * 3.3 + maglevel * 3) * 2
    max = -(level * 4 + maglevel * 4.9) * 2 
    return min, max
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 5119

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local positionME = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(positionME, 22) 
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 651) 
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
