local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1600, -15.0, -1800)

arr1 = {
	{0, 1, 1, 1, 0},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
   return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 4 -- Tempo de exhaustion
local storage = 8224

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local position1 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position4 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}

local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 10, parameters)
addEvent(onCastSpell2, 200, parameters)
doSendMagicEffect(position1, 628)
doSendMagicEffect(position2, 626)
doSendMagicEffect(position3, 627)
doSendMagicEffect(position4, 629)
exhaustion.set(cid, storage, waittime)
return TRUE
end 