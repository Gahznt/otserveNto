
local t = {
storage = 672023,  -- storage, so mude se tiver usando pra outra coisa.
tempo = 5, -- Tempo em horas.
}


function onUse(cid, item, fromPos, itemEx, toPos)

    if getPlayerStorageValue(cid, t.storage) < os.time() then

       doPlayerPopupFYI(cid, "Obrigado por participar do Test Server : Você recebeu Low Rare Box!" )
	    
	   doPlayerAddItem(cid, 1997, 1) -- DANZOU
	   
	   doSendMagicEffect(getPlayerPosition(cid), 5)

       setPlayerStorageValue(cid, t.storage, os.time() + t.tempo * 60 )
    else
       doSendMagicEffect(getPlayerPosition(cid), 3)
	   doPlayerPopupFYI(cid, "Voce precisa aguardar ".. getPlayerStorageValue(cid, t.storage) - os.time() .." segundos para pegar o amuleto novamente.")
    end
    return true
end