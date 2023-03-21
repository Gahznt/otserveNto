local t = {
storage = 9998, --poe numero de storage aqui que não tenha no servidor
timer =  45, --tempo em segundos sem poder usar dinovo
quant = 8, -- quantidade de monstros sumonados
summon = "Kage Bunshin",  -- poe name aki
nMin = 15, -- tempo em segundos aqui da creatura sumir
effect = CONST_ME_MAGIC_RED
}
function onCastSpell(cid, var)
	if exhaustion.check(cid, t.storage) == false then
		if #getCreatureSummons(cid) < t.quant then
			exhaustion.set(cid, t.storage, t.timer*1000)
			local pos = getThingPos(cid)
			local mons = doSummonMonster(cid,t.summon)	
				if #getCreatureSummons(cid) == 1 then
					local remover = getCreatureSummons(cid)[1] 
						addEvent(doRemoveCreature, t.nMin *1000,remover)
						doPlayerSendTextMessage(cid, 27, "O summon será removido em "..t.nMin.." segundos. Aproveite!")
				else
					for i = 1,#getCreatureSummons(cid) do
					local remover = getCreatureSummons(cid)[i] 				
						addEvent(doRemoveCreature, t.nMin * 1000,remover)					
					end
					doPlayerSendTextMessage(cid, 27, "O summon será removido em "..t.nMin.." segundos. Aproveite!")
				end
			doSendMagicEffect(pos, t.effect) 
			-- print("executei")
		else
			doPlayerSendTextMessage(cid, 27, "Você já tem criatura summonada")
		return false 
		end
	else
		doPlayerSendCancel(cid, "Pode summonar outro em :  " ..exhaustion.get(cid, t.storage).." segundos.")
		return false  
	end
return true
end