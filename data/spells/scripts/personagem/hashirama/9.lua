local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1600, -15.0, -1800)

function onCastSpell(cid, var)
local waittime = 4 -- Tempo de exhaustion
local storage = 8244

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local positionME = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(positionME, 28) 
local position0 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position0, 225)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+4, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 307)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
