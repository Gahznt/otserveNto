local storages = {98110} -- storages que serão verificadas

local message = [[

( Guia Nto Hard )

Area Restrita : Você não tem permissão para acessar esse local.



]]

function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
		doPlayerPopupFYI(cid, message)
        return doTeleportThing(cid, fromPosition)
    end
end
end