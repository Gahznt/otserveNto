local key = 14567

function onStepIn(cid, item, position)
		if isCreature(cid) then
			local pos = getPos(cid, key)
			a = type(pos) == "table" and doTeleportThing(cid, pos) or doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
			addEvent(function()
				if isCreature(cid) then
					doSendMagicEffect(getCreaturePosition(cid), 10)
				end
			end, 10)
		end
return true
end