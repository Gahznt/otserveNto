local storages = {11205} -- storages que serão verificadas


function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você não tem permissão para acessar esse local.")
        return doTeleportThing(cid, fromPosition)
    end
end
end