function onCombat(cid, target)
	if isPlayer(target) and getPlayerGuildId(cid) ~= 0 and getPlayerGuildId(cid) == getPlayerGuildId(target) then
		doPlayerSendCancel(cid, "Não pode atacar players da mesma guild.")
		return false
	end
	return true
end