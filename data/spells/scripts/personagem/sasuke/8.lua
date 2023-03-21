local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1600, -12.0, -1800)

function onCastSpell(cid, var)

local waittime = 3 -- Tempo de exhaustion
local storage = 5223

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
	return false
end

local positionME = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	doSendMagicEffect(positionME, 516) 
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	doSendMagicEffect(position1, 515) 
local position2 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
	doSendMagicEffect(position2, 4) 

exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
