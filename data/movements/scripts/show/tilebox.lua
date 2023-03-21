local message = [[
Rare Box 

Conquistável em :
Missão com NPC / Loja VIP

Sorteie ( 1 ) Item

Items disponíveis : 
1x Item Raro Nível [I]
1x Item Raro Nível [II]

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end