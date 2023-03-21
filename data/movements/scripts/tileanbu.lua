local storages = {55000} -- storages que serão verificadas
function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
        doPlayerSendCancel(cid, "Você precisa completar a missão do NPC Defender primeiro!")
        return doTeleportThing(cid, fromPosition)
    end
end
end