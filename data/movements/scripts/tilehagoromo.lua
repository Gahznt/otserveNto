local storages = {55003, 55004} -- storages que serão verificadas
function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
        doPlayerSendCancel(cid, "Derrote os dois filhos de Hagoromo antes de passar por aqui !")
        return doTeleportThing(cid, fromPosition)
    end
end
end