function onUse(cid, item, fromPosition, itemEx, toPosition)
    local pos = fromPosition
    local playerPos = getPlayerPosition(cid)
    print(playerPos)
    local vocs = {14, 1410, 1420, 1430, 1440}
    local waterIds = {4610, 4612, 4611, 4664, 4613, 4666, 4646, 4654, 4609, 4665, 4608, 4625, 4665, 4666, 4645}
    local wallsIds = {1030, 1029, 1025, 1026, 1027, 1259, 1028, 1032, 1034, 1033, 1536, 1533, 873, 919, 874, 1037, 2700,
                      2708, 4472, 4475, 4471, 3388, 3373, 3363, 3398, 3408, 3417, 3420, 3407, 3368, 2701, 5130, 6170,
                      6166, 1596, 3361, 3362, 3363, 3364, 3365, 3366, 3367, 3368, 3369, 3370, 3371, 3372, 3373, 3374,
                      3375, 3376, 3377, 3378, 3379, 3380, 3381, 3382, 3383, 3384, 3385, 3386, 3387, 3388, 3389, 3390,
                      3391, 3392, 3393, 3394, 3395, 3396, 3397, 3398, 3399, 3400, 3401, 3402, 3403, 3404, 3405, 3406,
                      3407, 3408, 3409, 3410, 3411, 3412, 3413, 3414, 3415, 3416, 3417, 3418, 3419, 3420, 3421, 3422}
    local itemsExceptions = {4018, 2700, 2708, 1771, 1101, 1480, 1546, 1200, 2703, 2739, 2704, 3404, 3403, 3405, 3406,
                             3411, 3416, 4167, 3311, 2777, 4169}
    local stonesIds = {874, 919, 873, 2707, 2784, 2778, 3330, 4471, 4475, 4473, 4472, 4474, 4468, 4478, 4469, 4470,
                       4479, 2703, 2704, 1534, 2739, 3867, 5324, 5316, 5315, 5317, 1600, 1597, 1601, 1289, 1288, 1287,
                       1286, 1296, 1297, 1298, 1299}

    if getDistanceBetween(playerPos, toPosition) >= 8 then
        return doPlayerSendTextMessage(cid, 27, "Está muito longe.")
    elseif not (isSightClear(playerPos, toPosition, false)) then
        return doPlayerSendTextMessage(cid, 27, "Isso é impossivel.")
    elseif (getTilePzInfo(playerPos)) then
        return doPlayerSendCancel(cid, "Não pode usar a flash kunai em casas ou areas protegidas.")
    elseif (getTilePzInfo(toPosition)) then
        return doPlayerSendCancel(cid, "Não pode usar a flash kunai em casas ou areas protegidas.")
    elseif (isInArray(waterIds, itemEx.itemid)) then
        return doPlayerSendTextMessage(cid, 27, "Voce nao pode usar aqui")
    elseif (isInArray(wallsIds, itemEx.itemid)) then
        return doPlayerSendTextMessage(cid, 27, "Voce nao pode usar aqui")
    elseif (isInArray(stonesIds, itemEx.itemid)) then
        return doPlayerSendTextMessage(cid, 27, "Voce nao pode usar aqui")
    elseif (isInArray(itemsExceptions, itemEx.itemid)) then
        return doPlayerSendTextMessage(cid, 27, "Voce nao pode usar aqui")
    elseif (not (isInArray(vocs, getPlayerVocation(cid)))) then
        return doPlayerSendTextMessage(cid, 27, "Desculpe, Apenas Minato pode usar a flash kunai.")
    elseif (isCreature(itemEx.uid)) then
        return doPlayerSendTextMessage(cid, 27, "Desculpe, mas você não pode teletransportar em criaturas.")
    end

    if (doTeleportThing(cid, toPosition, false)) then
        doSendMagicEffect({
            x = playerPos.x + 1,
            y = playerPos.y + 1,
            z = playerPos.z
        }, 186)
        doSendMagicEffect({
            x = getPlayerPosition(cid).x + 1,
            y = getPlayerPosition(cid).y + 1,
            z = getPlayerPosition(cid).z
        }, 186)
        doCreatureSay(cid, "Shunshin", 19)
        return doSendDistanceShoot(pos, toPosition, 147)
    end

    return doPlayerSendCancel(cid, "Desculpe nao foi possivel.")
end
