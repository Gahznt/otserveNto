local combat_lv1 = createCombatObject()
setCombatParam(combat_lv1, COMBAT_PARAM_EFFECT, 111)
setCombatParam(combat_lv1, COMBAT_PARAM_CREATEITEM, 2636)

local combat_lv2 = createCombatObject()
setCombatParam(combat_lv2, COMBAT_PARAM_EFFECT, 111)
setCombatParam(combat_lv2, COMBAT_PARAM_CREATEITEM, 2636)

local combat_lv3 = createCombatObject()
setCombatParam(combat_lv3, COMBAT_PARAM_EFFECT, 111)
setCombatParam(combat_lv3, COMBAT_PARAM_CREATEITEM, 2636)

local combat_lv4 = createCombatObject()
setCombatParam(combat_lv4, COMBAT_PARAM_EFFECT, 111)
setCombatParam(combat_lv4, COMBAT_PARAM_CREATEITEM, 2636)

local area_lv1 = createCombatArea({
{1, 0, 1},
{1, 0, 1},
{0, 1, 0},
{0, 2, 0}
})

local area_lv2 = createCombatArea({
{0, 1, 0},
{1, 1, 1},
{1, 1, 1},
{0, 1, 0},
{0, 2, 0}
})

local area_lv3 = createCombatArea({
{1, 1, 1, 1, 1},
{1, 1, 1, 1, 1},
{1, 1, 1, 1, 1},
{0, 1, 1, 1, 0},
{0, 0, 1, 0, 0},
{0, 0, 2, 0, 0}
})

local area_lv4 = createCombatArea({
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 2, 0, 0, 0}
})

setCombatArea(combat_lv1, area_lv1)
setCombatArea(combat_lv2, area_lv2)
setCombatArea(combat_lv3, area_lv3)
setCombatArea(combat_lv4, area_lv4)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat_lv1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat_lv2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat_lv3, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, combat_lv4, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 10 -- Tempo de exhaustion
local storage = 5439

if exhaustion.check(cid, storage) then
return false
end

local from,to = {x=901, y=701, z=7},{x=931, y=733, z=7} -- começo e final do mapa
if isInRange(getCreaturePosition(cid), from, to) then
doPlayerSendCancel(cid, "Você não pode usar esse jutsu nessa area!") return true
end
local position = getCreaturePosition(cid)
local t = {
[0] = {x = position.x, y = position.y - 3, z = position.z},
[1] = {x = position.x + 3, y = position.y, z = position.z},
[2] = {x = position.x, y = position.y + 3, z = position.z},
[3] = {x = position.x - 3, y = position.y, z = position.z},
[4] = {x = position.x - 3, y = position.y, z = position.z},
}

local parameters = { cid = cid, var = var}
local spell_storage = 42552

if getPlayerStorageValue(cid, spell_storage) < 100 then
addEvent(onCastSpell1, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 100 then
addEvent(onCastSpell2, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Seu jutsu progrediu para o level 2")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Jutsu UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 100 and getPlayerStorageValue(cid, spell_storage) < 300 then
addEvent(onCastSpell2, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 300 then
addEvent(onCastSpell3, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Seu jutsu progrediu para o level 3")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Jutsu UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 300 and getPlayerStorageValue(cid, spell_storage) < 500 then
addEvent(onCastSpell3, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 500 then
addEvent(onCastSpell4, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Seu jutsu progrediu para o level 4")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Jutsu UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 500 then
addEvent(onCastSpell4, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
end

exhaustion.set(cid, storage, waittime)
return TRUE
end