local message = [[
Set Saga Nível [ 7 ]

O Set pode ser conquistado na Loja VIP

OBS : Não possui restrição de level para usar

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end