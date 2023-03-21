local message = [[
Set Saga Nível [ 11 ]

Conquistável em :

Missão NPC Naruto / Boss Victory Naruto
Local : Castelo Guild Dominante

Requer Lv : 150

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end