local message = [[
Parabéns, esta é a sala de recompensas para Shinobis
de graduação ( Kage ) !

Aqui você terá o direito de escolher ( UM ) Personagem
Exclusivo ( OU ) ( Uma ) Super Rare Box.

Ambos os Items podem ser encontrados em nossa Loja VIP
por 50 Pontos, esperamos que você faça um bom proveito.

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end