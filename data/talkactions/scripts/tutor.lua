function onSay(cid, player, words, param)
	cid:registerEvent("modalwindowhelper")
 
    local titulo = "Tutor Hard" -- Esse é o titulo do ModalWindow
    local mensagem = "Ola eu sou Hard, posso responder todas suas duvidas !" -- Subtitulo do ModalWindow
 
    local popup = ModalWindow(1000, titulo, mensagem)
 
    popup:addButton(100, "Confirm")
    popup:addButton(101, "Cancel")
 
    popup:addChoice(1, "Como começar bem no Nto Hard ? ") -- Aqui é onde voce vai adicionar as perguntas, basta seguir a sequencia
    popup:addChoice(2, "Pergunta2")
 
    popup:setDefaultEnterButton(100)
    popup:setDefaultEscapeButton(101)
 
    popup:sendToPlayer(cid)
	
    return true
end