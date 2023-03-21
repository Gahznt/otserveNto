function onUse(cid, item, fromPosition, itemEx, toPosition)

local message = [[

[ You Tube ] Kit Nivel 3

Parabens, voce acaba de receber o Kit You Tube Nivel 3
por colaborar com a divulgação de nosso servidor.

Agradecemos por seu trabalho e sua participacao por isso
oferecemos a voce um Kit como forma de recompensa.

Espero que goste, Tenha um Bom Jogo !.


]]
	if getPlayerStorageValue(cid, 111513) < 1 then           
		local bag = doPlayerAddItem(cid, 1987, 1)
		doPlayerAddExp(cid, 10000000)
		doAddContainerItem(bag, 2169, 4)
		doAddContainerItem(bag, 1991, 1)
		doAddContainerItem(bag, 6549, 1)
		doAddContainerItem(bag, 2144, 5)
		doAddContainerItem(bag, 6548, 1)
		doAddContainerItem(bag, 2160, 20)
		doAddContainerItem(bag, 11230, 20)
		setPlayerStorageValue(cid,111513,1)
		doPlayerPopupFYI(cid, message)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(getPlayerPosition(cid), 5)
			else
				doPlayerSendTextMessage(cid,22,"Voce nao pode receber essa recompensa novamente!")
				doSendMagicEffect(getPlayerPosition(cid), 3) 
			end
			
		return 0
end