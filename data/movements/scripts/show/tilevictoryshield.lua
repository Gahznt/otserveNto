local message = [[
Naruto Victory Shield [ III ]

Conquistável em :
Missão - Naruto do Recanto das Bijus


]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end