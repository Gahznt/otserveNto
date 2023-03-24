local combat_lv4 = createCombatObject()
setCombatParam(combat_lv4, COMBAT_PARAM_EFFECT, 111)
setCombatParam(combat_lv4, COMBAT_PARAM_CREATEITEM, 2636)

local area_lv4 = createCombatArea({
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 2, 0, 0, 0}
})

setCombatArea(combat_lv4, area_lv4)

local function onCastSpell4(parameters)
doCombat(parameters.cid, combat_lv4, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 15 -- Tempo de exhaustion
local storage = 5439

if exhaustion.check(cid, storage) then
    doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
    return false
end

local from,to = {x=901, y=701, z=7},{x=931, y=733, z=7} -- come�o e final do mapa
if isInRange(getCreaturePosition(cid), from, to) then
    doPlayerSendCancel(cid, "Voc� n�o pode usar esse jutsu nessa area!") return true
end
local position = getCreaturePosition(cid)
local t = {
    [4] = {x = position.x - 3, y = position.y, z = position.z},
}

local parameters = { cid = cid, var = var}
addEvent(onCastSpell4, 0, parameters)

exhaustion.set(cid, storage, waittime)
return TRUE
end