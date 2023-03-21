local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)  

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -6.0, -1400, -6.0, -1600)

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 9)
return doCombat(cid, combat1, var)
end
 
local function onCastSpell2(cid, var)
local pos = getCreaturePosition(cid)
local position2 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position2, 358)
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