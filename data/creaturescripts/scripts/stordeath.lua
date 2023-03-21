function onDeath(cid, corpse, deathList)
	local i = getPlayerStorageValue(cid, voc_stor)
	if i > 0 then
		doPlayerSetVocation(cid, i)
		setPlayerStorageValue(cid, voc_stor, 0)
	end
	return true
end