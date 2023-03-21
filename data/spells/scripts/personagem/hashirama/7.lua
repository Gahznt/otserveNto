local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1600, -9.0, -1800)

arr1 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

function onCastSpell(cid, var)
local positionME = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(positionME, 28) 
local waittime = 2
local storage = 8202

if exhaustion.check(cid, storage) then
return false
end
local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x+1, y=p.y-1, z=p.z},
[1] = {x=p.x+5, y=p.y+1, z=p.z},
[2] = {x=p.x+1, y=p.y+5, z=p.z},
[3] = {x=p.x-1, y=p.y+1, z=p.z}
}
local y = {
[0] = 229,
[1] = 226,
[2] = 228,
[3] = 227
}
pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]
doSendMagicEffect(pos, eff)
exhaustion.set(cid, storage, waittime)
doCombat(cid, combat1, var)
end