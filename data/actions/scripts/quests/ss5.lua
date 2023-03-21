
local t = {
storage = 619115,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 24, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)

    if getPlayerStorageValue(cid, t.storage) < os.time() then
		doPlayerAddItem(cid, 2160, 10)		
		doSendMagicEffect(getPlayerPosition(cid), 5)	
		doPlayerSendTextMessage(cid,22,"Você ganhou 10 Gold por completar a quest.")
		setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
    else
		doSendMagicEffect(getPlayerPosition(cid), 3)
		doPlayerPopupFYI(cid, "[ Recompensa ] Voce precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para pegar a recompensa novamente.")
    end
    return true
end