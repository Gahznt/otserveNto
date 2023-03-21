function onStepIn(cid, item, position, fromPosition)

level = 5

if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
doPlayerSendCancel(cid,"Você precisa do level " .. level .. " ou + para acessar esse local.")
end
return TRUE
end