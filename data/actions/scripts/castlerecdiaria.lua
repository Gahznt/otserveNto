local t = {
storage = 676628,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 1, -- Tempo em horas.
qt = 2, -- quatidade.
itemidxx = 11255 -- Item que ira ganhar.
}


function onUse(cid, item, fromPos, itemEx, toPos)

    if getPlayerStorageValue(cid, t.storage) < os.time() then

       doPlayerSendTextMessage(cid, 25, "Você encontrou 2 Adamantium's.")

       doPlayerAddItem(cid,t.itemidxx,t.qt)
	   
	   doSendMagicEffect(getPlayerPosition(cid), 5)

       setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 * 60)
    else
		doSendMagicEffect(getPlayerPosition(cid), 3)
		doPlayerSendTextMessage(cid, 25, "Você precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para coletar novamente. ( Intervalo de 1 Hora )")
    end
    return true
end