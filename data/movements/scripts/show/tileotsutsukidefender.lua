local storages = {55002} -- storages que serão verificadas
function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
        doPlayerSendCancel(cid, "Você não tem permissão para passar aqui.")
        return doTeleportThing(cid, fromPosition)
    end
end
end