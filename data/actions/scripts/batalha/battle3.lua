local t = {
storage = 676633,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 24, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)

    if getPlayerStorageValue(cid, t.storage) < os.time() then
       doPlayerPopupFYI(cid, "[ Batalha Diaria ] Parabens ! aqui esta a recompensa da [ 3 ] das [ 12 ] Batalhas Diarias!")	   	   
	   doPlayerAddExp(cid, 29000)	   
	   doPlayerAddItem(cid, 2152, 6)
	   doSendMagicEffect(getPlayerPosition(cid), 5)
       setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
    else
       doSendMagicEffect(getPlayerPosition(cid), 3)
	   doPlayerPopupFYI(cid, "[ Batalha Diaria] Voce precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para pegar a recompensa novamente.")
    end
    return true
end