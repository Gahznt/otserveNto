local message = [[
Set Saga Nível [ 8 ]

O Set é uma evolução do Senju Set Nível [ 7 ]

Item necessário para o Upgrade do Senju Set = Senju Enchant

O Senju Enchanted pode ser forjado com Adamantium pelo NPC
Hishura. O Item também pode ser conquistado na Loja Vip.

]]


function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end