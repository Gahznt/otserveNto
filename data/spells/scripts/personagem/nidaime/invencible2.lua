local config = { 
storage = 3482101,
cooldown = 120,  --- tempo entre um uso e outro
duration = 5, --- duração
effect1 = 100 -- efeito que sai ao falar a spell
} 


local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration * 80, false)


function onCastSpell(cid, var)
  
  if os.time() - getPlayerStorageValue(cid, 55695) >= config.cooldown then
setPlayerStorageValue(cid, 55695, os.time())
doSendMagicEffect(getCreaturePosition(cid), config.effect1)
setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
doCreatureSay(cid,"KAWARIMI!!!", 19)
doAddCondition(cid, outfit)
doPlayerSendTextMessage(cid, 27, "Agora voce tem ".. config.duration .." segundos de esquiva.")
else
doPlayerSendCancel(cid, "Voce precisa esparar  "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55695))).." segundos.")
return false
end  
    return true
end