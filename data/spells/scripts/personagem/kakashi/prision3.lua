local config = {
    wallArea = {
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
        {1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
    },
    effect = 3,          --Efeito.
    wallId = 2718,          --ID da parede.
    time = 15,              --Duração da parede.
    cooldown = {60, 60},   --{sucessCooldown, failCooldown},
    chance = 100,           --Chance da spell funcionar.
    storage = 9571,
}
function isWalkable(pos, creature, proj, pz)-- by Nord
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end
function getPosfromArea(cid, area)    --by Dokmos
    icenter = math.floor(table.getn(area)/2)+1
    jcenter = math.floor(table.getn(area[1])/2)+1
    center = area[icenter]
    ivar = table.getn(area)
    jvar = table.getn(area[1])
    i = table.getn(area)^2
    j = table.getn(area[1])^2
    local mydir = isCreature(getCreatureTarget(cid)) and getCreatureDirectionToTarget(cid, getCreatureTarget(cid)) or getCreatureLookDir(cid)
    setPlayerStorageValue(cid, 21101, -1)
    if center[jcenter] == 3 then
        if mydir == 0 then
            signal = {-1,1,1,2}
        elseif mydir == 1 then
            signal = {1,-1,2,1}
        elseif mydir == 2 then
            signal = {1,-1,1,2}
        elseif mydir == 3 then
            signal = {-1,1,2,1}
        end
    else
        signal = {-1,1,1,2}
    end
    POSITIONS = {}  
    P = 0      
    repeat
        pvar = {0,0}
        I = area[ivar]
        J = I[jvar]
        i = i-1
        j = j-1
        if J == 1 then
            if jvar < jcenter then  
                pvar[signal[3]] = signal[1]*math.abs((jcenter-jvar)) 
            elseif jvar > jcenter then  
                pvar[signal[3]] = signal[2]*math.abs((jcenter-jvar)) 
            end             
            if ivar < icenter then  
                pvar[signal[4]] = signal[1]*math.abs((icenter-ivar)) 
            elseif ivar > icenter then
                pvar[signal[4]] = signal[2]*math.abs((icenter-ivar))
            end
        end    
        if jvar > 1 then
            jvar = (jvar-1)
        elseif ivar > 1 then
            jvar = table.getn(area[1])
            ivar = (ivar-1)
        end  
        local pos = getThingPos(cid)
        local areapos = {x=pos.x+(pvar[1]),y=pos.y+(pvar[2]),z=pos.z}  
        if pos.x ~= areapos.x or pos.y ~= areapos.y then
            P = P+1
            POSITIONS[P] = areapos
        end  
    until i <= 0 and j <= 0
    return POSITIONS
end
function onCastSpell(cid)
    if getPlayerStorageValue(cid, config.storage) > os.time() then
        doPlayerSendCancel(cid, "Wait "..getPlayerStorageValue(cid, config.storage) - os.time().." second(s).")
		doCreatureSay(cid, "Voce precisa aguardar para usar novamente!!.", TALKTYPE_MONSTER)
    else
        if math.random(1, 100) > config.chance then
            doPlayerSendCancel(cid, "Your spell failed.")
            doSendAnimatedText(getThingPos(cid), "FAIL!", 215)
            setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown[2])
        else
            local positions = {}
            setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown[1])
            for _, pos in pairs(getPosfromArea(cid, config.wallArea)) do
                if isWalkable(pos) and not getTileInfo(pos).protection then
                    doCreateItem(config.wallId, 1, pos)
                    doSendMagicEffect(pos, config.effect)
                    table.insert(positions, pos)
                end
            end
            if #positions > 0 then
                addEvent(function()
                    for i = 1, #positions do
                        local item = getTileItemById(positions[i], config.wallId).uid
                        if item > 0 then
                            doRemoveItem(item)
                        end
                    end
                end, config.time * 1000)
            end
        end
    end
    return true
end