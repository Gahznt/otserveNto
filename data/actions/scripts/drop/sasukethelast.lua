local time = 7200 -- tempo em segundos para usar
local monster = "Sasuke The Last" -- "Monstro" entre aspas
local pos = {x=1177, y=879, z=6} -- Posi��o que ir� nascer.
local from,to = {x=1171, y=872, z=6},{x=1171, y=872, z=6} -- area total da area onde o monstro vai estar


function CheckArea(area)
	local var = 0
	for x = area[1].x - 1, area[2].x + 1 do
		for y = area[1].y - 1, area[2].y + 1 do
			local pos = {x=x, y=y, z=area[1].z}
			local m = getTopCreature(pos).uid
			if m ~= 0 and isMonster(m) then 
				var = var +1 
			end
		end
	end
	return var
end

function onUse(cid, item, frompos, itemex, topos)
	if getStorage(2312) - os.time() < 1 then
		if CheckArea({from,to}) == 0 then
			doSetStorage(2312, os.time() + time)
			addEvent(function() doCreateMonster(monster, pos) end, 5000)
			doCreatureSay(cid, "Prepare-se !", TALKTYPE_MONSTER)
		else
			doPlayerSendCancel(cid, "H� monstros no local, utilize KAI !")
			doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) return true
		end
	else
		doPlayerSendCancel(cid, "Voce precisa esperar ".. getStorage(2312) - os.time() .." Segundos restantes")
		doSendMagicEffect(getThingPos(cid), CONST_ME_POFF) return true
	end	
	return true
end