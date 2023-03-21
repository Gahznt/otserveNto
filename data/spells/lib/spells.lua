--Waves
AREA_WAVE4 = {
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 3, 0, 0}
}

AREA_SQUAREWAVE5 = {
	{1, 1, 1},
	{1, 1, 1},
	{1, 1, 1},
	{0, 1, 0},
	{0, 3, 0}
}

AREA_WAVE5 = {
	{0, 1, 1, 1, 0},
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0},
	{0, 0, 1, 0, 0},
	{0, 0, 3, 0, 0}
}

--Diagonal waves
AREADIAGONAL_WAVE4 = {
	{0, 0, 0, 0, 1, 0},
	{0, 0, 0, 1, 1, 0},
	{0, 0, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 0},
	{0, 0, 0, 0, 0, 3}
}

AREADIAGONAL_SQUAREWAVE5 = {
	{1, 1, 1, 0, 0},
	{1, 1, 1, 0, 0},
	{1, 1, 1, 0, 0},
	{0, 0, 0, 1, 0},
	{0, 0, 0, 0, 3}
}

AREADIAGONAL_WAVE5 = {
	{0, 0, 0, 0, 1, 0},
	{0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 0, 0},
	{1, 0, 0, 0, 1, 0},
	{0, 0, 0, 0, 0, 3}
}

--Beams
AREA_BEAM1 = {
	{3}
}

AREA_BEAM5 = {
	{1},
	{1},
	{1},
	{1},
	{1},
	{3}
}

AREA_BEAM7 = {
	{1},
	{1},
	{1},
	{1},
	{1},
	{1},
	{1},
	{3}
}

--Diagonal Beams
AREADIAGONAL_BEAM5 = {
	{1, 0, 0, 0, 0, 0},
	{0, 1, 0, 0, 0, 0},
	{0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0},
	{0, 0, 0, 0, 1, 0},
	{0, 0, 0, 0, 0, 3}
}

AREADIAGONAL_BEAM7 = {
	{1, 0, 0, 0, 0, 0, 0, 0},
	{0, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 0},
	{0, 0, 0, 0, 0, 0, 0, 3}
}

--Circles
AREA_CIRCLE2X2 = {
	{0, 1, 1, 1, 0},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{0, 1, 1, 1, 0}
}

AREA_CIRCLE3X3 = {
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0}
}

-- Crosses
AREA_CROSS1X1 = {
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
}

AREA_CROSS2X2 = {
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1}
}

AREA_CROSS3X3 = {
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1}
}

AREA_CROSS5X5 = {
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

AREA_CROSS6X6 = {
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0}
}

--Squares
AREA_SQUARE1X1 = {
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

AREA_SQUARE1X7 = {
	{0, 0, 0},
	{0, 0, 0},
	{0, 0, 1}
}


-- Walls
AREA_WALLFIELD = {
	{0, 1, 3, 1, 0}
}

AREADIAGONAL_WALLFIELD = {
	{0, 0, 0, 0, 0},
	{0, 0, 0, 1, 0},
	{0, 0, 3, 0, 0},
	{0, 1, 0, 0, 0},
	{0, 0, 0, 0, 0},
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

function getPositionsAround(pos)
return {
[1] = {x = pos.x, y = pos.y - 1, z = pos.z, stackpos = 0},
[2] = {x = pos.x + 1, y = pos.y - 1, z = pos.z, stackpos = 0},
[3] = {x = pos.x + 1, y = pos.y, z = pos.z, stackpos = 0},
[4] = {x = pos.x + 1, y = pos.y + 1, z = pos.z, stackpos = 0},
[5] = {x = pos.x, y = pos.y + 1, z = pos.z, stackpos = 0},
[6] = {x = pos.x - 1, y = pos.y + 1, z = pos.z, stackpos = 0},
[7] = {x = pos.x - 1, y = pos.y, z = pos.z, stackpos = 0},
[8] = {x = pos.x - 1, y = pos.y - 1, z = pos.z, stackpos = 0}
}
end
function checkInterceptions(cid, pos, toPos, creature)
local p = pos
local dir = getDirectionTo(pos, toPos)
local d = getDistanceBetween(pos, toPos)
 
    if dir < SOUTHWEST then
        while d > 0 do
            dir = getDirectionTo(p, toPos)
            p = getPosByDir(p, dir, 1)
            d = getDistanceBetween(p, toPos)
            if not isWalkable(p, creature, true, true) then
                return p
            end
        end
    else
        local nextPositions = {pos}
        local tam = 1
        while d > 0 do
            local i = tam
 
            if tam > 2 then tam = 2 end
            local positions = getPositionsAround(nextPositions[tam])
 
            if (dir == SOUTHWEST and (nextPositions[tam].x < toPos.x or nextPositions[tam].y > toPos.y))
            or (dir == NORTHEAST and (nextPositions[tam].x > toPos.x or nextPositions[tam].y < toPos.y)) then
                positions = getPositionsAround(nextPositions[tam+1])
            end
 
            if dir == SOUTHEAST and (nextPositions[tam].x > toPos.x or nextPositions[tam].y > toPos.y)
            or (dir == NORTHWEST and (nextPositions[tam].x < toPos.x or nextPositions[tam].y < toPos.y)) then
                positions = getPositionsAround(nextPositions[tam-1])
            end
 
            d = getDistanceBetween(nextPositions[tam], toPos)
            tam = 0
            if d == 0 then break end
 
            local sum = 0
 
            if dir == SOUTHWEST then sum = 4
            elseif dir == SOUTHEAST then sum = 2
            elseif dir == NORTHWEST then sum = 6
            elseif dir == SOUTHEAST then sum = 0 end
 
            for j=1, 3 do
                local index = j+sum
                local check = 0
                if index > #positions then index = 1 end
 
                if dir == SOUTHWEST and (positions[index].x < toPos.x or positions[index].y > toPos.y)
                or (dir == SOUTHEAST and (positions[index].x > toPos.x or positions[index].y > toPos.y))
                or (dir == NORTHWEST and (positions[index].x < toPos.x or positions[index].y < toPos.y))
                or (dir == NORTHEAST and (positions[index].x > toPos.x or positions[index].y < toPos.y)) then
                    check = 1
                end
 
                local dx, dy = math.abs(positions[index].x - toPos.x) , math.abs(positions[index].y - toPos.y)
                if dx == dy and (positions[index].x == pos.x or positions[index].y == pos.y)
                and ((getDistanceBetween(positions[index], pos) > 1 and getDistanceBetween(positions[index], toPos) > 1)
                or getDistanceBetween(positions[index], pos) > 5 and getDistanceBetween(positions[index], toPos) > 0)then
                    check = 1
                end
 
                if getDistanceBetween(positions[index], toPos) == 0 then return toPos end
                if getDistanceBetween(positions[index], toPos) < d and check == 0 then
                    if not isWalkable(positions[index], creature, true, true) then
                        return positions[index]
                    end
                    tam = tam + 1
                    nextPositions[tam] = positions[index]
                end
            end
        end
    end
    return toPos
end
function setSpellTarget(cid, var)
    local target = getCreatureTarget(cid)
    var.pos = checkInterceptions(cid, getPlayerPosition(cid), getCreaturePosition(target), true)
    if isCreature(getThingFromPos(var.pos).uid) then
        var.number = getThingFromPos(var.pos).uid
    else
        var.number = false
    end
    return var
end