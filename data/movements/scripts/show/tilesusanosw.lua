local message = [[
Susano Sword Rare Nivel [ III ]

Conquistável em :
Drop - Indra Renegade


]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end