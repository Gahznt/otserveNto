local message = [[
Set Saga Nivel [ 3 ]

O Set pode ser conquistado em Quest

Local : Proximidades de Konoha

Requer Lv : 30

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end