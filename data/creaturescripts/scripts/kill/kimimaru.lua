function onKill(cid, target, lastHit)

if not (isPlayer(cid) and isMonster(target)) then
   return true
end

local tab = { 
      ["Indra Otsutsuki"] = 55003,
      ["Ashura Otsutsuki"] = 55004,
	  ["Kimimaru"] = 98110,
}

setPlayerStorageValue(cid, tab[getCreatureName(target)], 1)

return true
end