domodlib('task_func')
local t = {
storage = 676642,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 24, -- Tempo em horas.
pos = {x = 1032, y = 1072, z = 6},
}


function onUse(cid, item, fromPos, itemEx, toPos)

    if getPlayerStorageValue(cid, t.storage) < os.time() then
		doPlayerPopupFYI(cid, "[ Batalha Diaria ] Parabéns, você completou o desafio diário do Mestre de Batalhas")
		doPlayerAddExp(cid, 29000)
		doPlayerAddItem(cid, 2152, 26)		
		doSendMagicEffect(getPlayerPosition(cid), 5)	
		doPlayerSendTextMessage(cid,22,"Você ganhou + 1 Ponto de Missão")
		doTeleportThing(cid, t.pos)
		setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
		setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
    else
		doSendMagicEffect(getPlayerPosition(cid), 3)
		doPlayerPopupFYI(cid, "[ Batalha Diaria] Voce precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para pegar a recompensa novamente.")
    end
    return true
end