local effect = {13} -- efeito q vai sair quando remover o summon

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 13)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 500)
setConditionFormula(condition, 1.2, -60, 1.2, -60)
setCombatCondition(combat, condition)


function onCastSpell(cid, var)
local waittime = 4 -- Tempo de exhaustion
local storage = 8121

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

summons = getCreatureSummons(cid)

for _, summon in pairs(summons) do

  doSendMagicEffect(getThingPos(summon), effect)

  doRemoveCreature(summon)

end

exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end