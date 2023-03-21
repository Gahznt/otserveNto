local t = {
storage = 678754,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 24, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)
    if getPlayerStorageValue(cid, t.storage) < os.time() then  
	   doPlayerAddExp(cid, 60000)	   
	   doPlayerAddItem(cid, 11329, 1)
	   doSendMagicEffect(getPlayerPosition(cid), 5)
       setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
    else
       doSendMagicEffect(getPlayerPosition(cid), 3)
	   doPlayerPopupFYI(cid, "[ Hokage Battle ] Voce precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para pegar a recompensa novamente.")
    end
    return true
end