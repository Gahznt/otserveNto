local message = [[
 
- Grande Castelo Ninja -

O Grande Castelo Ninja é um evento PVP Coletivo do servidor.

Objetivo : Durante 1 Hora o castelo será Aberto e o Trono ficará acessível !
A Guild que busca dominar o castelo deve pisar no Trono e impedir até o ultimo segundo
que outra guild venha fazer o mesmo.

O Evento dura exatamento 1 Hora, apos se esgotar o tempo todos serão teleportados ao DP.

Vantagens :
Treiners com Regeneração de Stamina.
Acesso a Fábrica de Adamantium.
NPC Comerciante Exclusívo.
Boss's Exclusivos.

Horarios :
Quarta Feira  20:00 Hrs
Domingo 	  15:00 Hrs

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end