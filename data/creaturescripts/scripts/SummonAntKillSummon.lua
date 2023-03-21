function onCombat(cid, target)
	if (isMonster(cid) and isMonster(target)) then
		if ((getCreatureMaster(cid)) == getCreatureMaster(target)) then
			return false
		end
	end
	return true
end