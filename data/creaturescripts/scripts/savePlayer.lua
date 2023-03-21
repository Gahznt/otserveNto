local save = {}
function saveRepeat(cid)
if not isPlayer(cid) then return true end
doPlayerSave(cid)
save[cid] = addEvent(saveRepeat, math.random(1,1) *30*1000, cid)
end
function onLogin(cid)
save[cid] = addEvent(saveRepeat, math.random(1,1)*30*1000, cid)
return true
end
function onLogout(cid)
stopEvent(save[cid])
return true
end