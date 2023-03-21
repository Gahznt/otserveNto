function onModalWindow(cid, modalWindowId, buttonId, choiceId)
	cid:unregisterEvent("modalwindowhelper")
	local mensagem = { 
		[1] = "Tutor Hard [99]: Nosso servidor possui formas diferentes para voce evoluir seu persoangem! Recomendamos que siga o cronograma de Tasks da NPC Tsunade ele lhe mostrará as principais Hunts do Jogo ! Voce também pode Explorar todo o nosso mapa e conseguir recompensas por isso. Não se esqueça de fazer nossas Quests Diarias como as do Mestre de Batalhas e outras. Quer saber mais ? Acesse nosso forum :", -- aqui é voce vai adicionar as respostas respeitando a sequencia
		[2] = "Tutor Hard [99]: Resposta2",

	}
	
	if modalWindowId == 1000 then
		if buttonId == 100 then
			for x = 1,#mensagem do
				if choiceId == x then
					cid:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, mensagem[x]) 			
				end
			end	
		end
	end
end	