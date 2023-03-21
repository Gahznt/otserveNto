local config = { 
storage = 318210, -- storage (use o mesmo do spells)
percent = 50, -- porcentagem que vai refletir
effect1 = 502, --- efeito que sai ao dar reflect
msg = "Reflect!",
effect2 = 0 -- efeito que aparece na pessoa que levou reflect
} 

function onStatsChange(cid, attacker, type, combat, value)
	if value >= 1 and (type == STATSCHANGE_HEALTHLOSS or (getCreatureCondition(cid, CONDITION_MANASHIELD) and type == STATSCHANGE_MANALOSS))  then
		if getPlayerStorageValue(cid,config.storage) - os.time() >= 0 and isCreature(attacker) then
			local refl = math.ceil(value * config.percent / 100)
			doSendAnimatedText(getCreaturePosition(attacker),"-"..refl, 215)
			doCreatureAddHealth(attacker, -refl, true)
			doCreatureSay(cid, config.msg, 19)
			doSendMagicEffect(getCreaturePosition(cid), config.effect1)
			doSendMagicEffect(getCreaturePosition(attacker), config.effect2)
		return false
		end
	end
return true
end