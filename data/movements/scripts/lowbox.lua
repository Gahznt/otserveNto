local message = [[
Rare Box 

Conquistável em :
Quest P/ Kages / NPC Kakashi

Sorteie ( 1 ) Item

Items disponíveis : 
Items Raros Nível I e II
]]

		

function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then
        return true
    end
    doPlayerPopupFYI(cid, message)
    return true
end