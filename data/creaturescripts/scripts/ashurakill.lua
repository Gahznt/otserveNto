function onDeath(cid, corpse, deathList, target)
local storage = 55004
if getPlayerStorageValue(deathList[1], storage) < 1 then
	if isPlayer(deathList[1]) then
		setPlayerStorageValue(deathList[1], storage, 1) 
		doSendMagicEffect(getPlayerPosition(deathList[1]), 12)
	end
else
return true
end
return true

end