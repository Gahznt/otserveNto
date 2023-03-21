local bizz = 18832
function onUse(cid, item, fromPos, itemEx, toPos)
local positionME = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
	if getPlayerStorageValue(cid, bizz) < 5 then
	setPlayerStorageValue(cid, bizz, getPlayerStorageValue(cid, bizz) +1)       
	doCreatureSay(cid, "Fuuuua", TALKTYPE_MONSTER)
	doSendMagicEffect(positionME, 54) 
	elseif getPlayerStorageValue(cid, bizz) >= 5 and getPlayerStorageValue(cid, bizz) <= 6 then
	setPlayerStorageValue(cid, bizz, getPlayerStorageValue(cid, bizz) +1)
	doCreatureSay(cid, "Hehe tá batendo o buzz", TALKTYPE_MONSTER)
	doSendMagicEffect(positionME, 54) 
	else 
	doCreatureSay(cid, "Quero mais NÃO !", TALKTYPE_MONSTER)
	setPlayerStorageValue(cid, bizz, 1) 
    return true
	end
end