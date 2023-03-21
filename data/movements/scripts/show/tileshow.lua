local message = [[
Set Saga Nivel [ 1 ]

O Set pode ser conquistado em Quest

Local : Proximo a Saída Sul de Konoha

Requer Lv : 10

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end