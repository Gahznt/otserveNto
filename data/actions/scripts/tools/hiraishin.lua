function onUse(cid, item, fromPosition, itemEx, toPosition)
    local playerPos = getPlayerPosition(cid)
    local vocs = {14, 1410, 1420, 1430, 1440}

    if getDistanceBetween(playerPos, toPosition) >= 8 then
        return doPlayerSendTextMessage(cid, 27, "Está muito longe.")
    elseif (isCreature(itemEx.uid)) then
        return doPlayerSendTextMessage(cid, 27, "Desculpe, mas você não pode teletransportar em criaturas.")
    elseif (not (isInArray(vocs, getPlayerVocation(cid)))) then
        return doPlayerSendTextMessage(cid, 27, "Desculpe, Apenas Minato pode usar a flash kunai.")
    elseif(not(isWalkable(toPosition, true, true, true))) then
        return doPlayerSendTextMessage(cid, 27, "Voce nao pode usar a flash kunai ali")
    end

    if (doTeleportThing(cid, toPosition, false)) then
        doSendMagicEffect({
            x = playerPos.x,
            y = playerPos.y,
            z = playerPos.z
        }, 694)
        doSendMagicEffect({
            x = getPlayerPosition(cid).x,
            y = getPlayerPosition(cid).y,
            z = getPlayerPosition(cid).z
        }, 694)
        doCreatureSay(cid, "Shunshin", 19)
        return doSendDistanceShoot(fromPosition, toPosition, 147)
    end

    return doPlayerSendCancel(cid, "Desculpe nao foi possivel.")
end
