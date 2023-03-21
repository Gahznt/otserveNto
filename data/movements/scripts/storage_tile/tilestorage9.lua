local storages = {75558} -- storages que serão verificadas
function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
        doPlayerSendCancel(cid, "Voce precisa derrotar todas as Bijus.!")
       doTeleportThing(cid, fromPosition, true)
    end
end
end