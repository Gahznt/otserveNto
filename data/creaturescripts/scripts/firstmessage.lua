function onLogin(cid)
local storage = 2522

local message1  = [[

Bem-Vindo ao NTO Hard !

Aqui você encontrará um genuíno entretenimento shinobi, somos um servidor
clássico que busca valorizar o tempo de jogo e o empenho que cada jogador
realiza ao interpretar nosso RPG.

Vá com calma e divirta-se !

]]

if getPlayerStorageValue(cid, storage) == -1 then
doPlayerPopupFYI(cid, message1)
setPlayerStorageValue(cid, storage, 1)
else
doPlayerSendTextMessage(cid, 22, "Obrigado por voltar "..getPlayerName(cid)..", esperávamos por você, divirta-se !")
end
return true
end