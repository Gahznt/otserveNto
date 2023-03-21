function onCombat(cid, target)
if cid == getCreatureMaster(target) then
doPlayerSendCancel(cid, "Voce nao pode matar seu summon.")
return false
end
return true
end