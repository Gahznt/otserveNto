local message = [[
Set Saga Nível [ 8 ]

O Set é uma evolução do Kurama Set Nível [ 7 ]

Item necessário para o Upgrade do Senju Set = Sannin Enchant

O Sannin Enchanted pode ser forjado com Adamantium pelo NPC
Hishura. O Item também pode ser conquistado na Loja Vip.

]]

		--Mensagem que aparecerá ao pisar no tile.

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end