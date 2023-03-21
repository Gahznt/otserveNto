local config = {
--{exp, item, quantidade}
	{1000, 2152, 50}, -- menor
	{45000, 2160, 1}, -- mesmo
	{45000, 2160, 2}, -- maior
}


function onKill(cid, target)

from = {x=987, y=1071, z=6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x=1014, y=1091, z=7}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)  

from1 = {x=1047, y=1087, z=5}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to1 = {x=1060, y=1101, z=5}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)  

	if isPlayer(cid) and isPlayer(target) then
		if getPlayerIp(cid) == getPlayerIp(target) then return true end
		if isInRange(getCreaturePosition(cid), from, to) then return true end 	--- Arena1
		if isInRange(getCreaturePosition(cid), from1, to1) then return true end --- Arena2
		if getPlayerLevel(target) < getPlayerLevel(cid) then
			doPlayerAddExp(cid, config[1][1])
			
		elseif getPlayerLevel(target) == getPlayerLevel(cid) then
			doPlayerAddExp(cid, config[2][1])
			
		elseif getPlayerLevel(target) > getPlayerLevel(cid) then
			doPlayerAddExp(cid, config[3][1])
		end
	end
	
	
	return true
end