local message = [[
Set Saga Nível [ 10 ]

Conquistável em :

Set Completo - Drop : Hagoromo

Requer Lv : 100

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end