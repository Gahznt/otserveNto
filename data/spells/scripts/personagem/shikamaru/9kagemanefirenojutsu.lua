local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1600, -15.0, -1800)

arr1 = {
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

function onCastSpell(cid, var)

local waittime = 4 -- Tempo de exhaustion
local storage = 8015

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x+1, y=p.y-1, z=p.z},
[1] = {x=p.x+4, y=p.y+1, z=p.z},
[2] = {x=p.x+1, y=p.y+4, z=p.z},
[3] = {x=p.x-1, y=p.y+1, z=p.z}
}
local y = {
[0] = 207,
[1] = 205,
[2] = 208,
[3] = 206
}
pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]
doSendMagicEffect(pos, eff)
exhaustion.set(cid, storage, waittime)
doCombat(cid, combat1, var)
end