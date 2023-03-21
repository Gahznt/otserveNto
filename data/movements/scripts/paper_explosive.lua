local condition = createConditionObject(CONDITION_PARALYZE)
  setConditionParam(condition, CONDITION_PARAM_TICKS, 3 * 1000)
  setConditionFormula(condition, -0.9, 0, -0.9, 0)
  doCreatureSay(cid, "I'm Hurt", TALKTYPE_MONSTER)
  
local pos = getThingPosition(cid)

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
  doAddCondition(cid, condition)
  doRemoveItem(item.uid)
  addEvent(doSendMagicEffect, 0, {x = pos.x+1, y = pos.y, z = pos.z}, 305)
  return doAreaCombatHealth(0, COMBAT_PHYSICALDAMAGE, getThingPosition(cid), 0, -3000, -5000, CONST_ME_DRAWBLOOD)
end