local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)


local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -7.5, -800, -2.0, -900)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -7.5, -800, -2.0, -900)



arr1 = {
	{3}
}

arr2 = {
	{3}
}

arr3 = {
	{3}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

 
local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 37)
return doCombat(cid, combat1, var)
end

local function onCastSpell2(cid, var)
return doCombat(cid, combat2, var)
end 

local function onCastSpell3(cid, var)
return doCombat(cid, combat3, var)
end 

function onCastSpell(cid, var)
local waittime = 4
local storage = 5832

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local parameters = { cid = cid, var = var}
			addEvent(onCastSpell1, 1, cid, var)
			addEvent(onCastSpell2, 400, cid, var)
			addEvent(doSendMagicEffect, 600, {x = pos.x, y = pos.y+2, z = pos.z}, 149)
			addEvent(doSendMagicEffect, 600, {x = pos.x+2, y = pos.y+2, z = pos.z}, 149)
			addEvent(onCastSpell3, 600, cid, var)
			exhaustion.set(cid, storage, waittime)
return TRUE
end 