local t = {
storage = 626630,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 1, -- Tempo em horas.
pos = {x = 1755, y = 572, z = 9},
}


function onUse(cid, item, fromPos, itemEx, toPos)

    if getPlayerStorageValue(cid, t.storage) < os.time() then

       doPlayerPopupFYI(cid, "[ Batalha Diaria ] Boa Sorte !")
	   
	   doTeleportThing(cid, t.pos)
	   doSendMagicEffect(getPlayerPosition(cid), 5)
       setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 1 * 1)
    else
       doPlayerPopupFYI(cid, "[ Batalha Diaria] Voce precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para batalhar novamente. ( 1 Vez ao Dia )")
   doSendMagicEffect(getPlayerPosition(cid), 3)
   end
    return true
end