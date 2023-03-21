local storages = {12510} -- storages que serão verificadas
function onStepIn(cid, item, position, fromPosition)
for _, v in ipairs(storages) do
    if getPlayerStorageValue(cid, v)  <= 0 then
        doPlayerSendCancel(cid, "Voce precisa da permissão do Kakuzo, ajude-o antes!")
       doTeleportThing(cid, fromPosition, true)
    end
end
end