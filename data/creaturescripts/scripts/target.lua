function onAttack(cid, target)
	if isCreature(cid) and isCreature(target) then
		dir = getDirectionTo(getCreaturePosition(cid), getCreaturePosition(target))
		doCreatureSetLookDirection(cid, dir)
	end
return true
end