local config = {
message = "Teleport será fechado em ( 45 ) segundos. ",
timeToRemove = 45, -- seconds
teleportId = 1387,
bosses = {
-- Bijus --
["Shukaku"] = {x=1669, y=750, z=8},
["Matatabi"] = {x=1701, y=751, z=8},
["Isobu"] = {x=1732, y=750, z=8},
["Yonbi"] = {x=1765, y=748, z=8},
["Gobi"] = {x=1799, y=749, z=8},
["Saiken"] = {x=1831, y=749, z=8},
["Shichibi"] = {x=1864, y=749, z=8},
["Hachibi"] = {x=1921, y=750, z=8},
["Kyuubi"] = {x=1968, y=752, z=8},
-- Battle --
["Naruto Battle"] = {x=1757, y=555, z=9},
["Sasuke Battle"] = {x=1824, y=555, z=9},
["Neji Battle"] = {x=1884, y=555, z=9},
["Lee Battle"] = {x=1756, y=600, z=9},
["Gaara Battle"] = {x=1823, y=598, z=9},
["Zabuza Battle"] = {x=1886, y=600, z=9},
["Kisame Battle"] = {x=1757, y=648, z=9},
["Deidara Battle"] = {x=1826, y=648, z=9},
["Itachi Battle"] = {x=1892, y=648, z=9},
["Madara Battle"] = {x=1757, y=690, z=9},
["Kaguya Battle"] = {x=1825, y=689, z=9},
["Rikkudo Battle"] = {x=1892, y=691, z=9},
-- Hokage --
["Hashirama Hokage"] = {x=1068, y=1044, z=10},
["Tobirama Hokage"] = {x=1082, y=1044, z=10},
["Sarutobi Hokage"] = {x=1096, y=1044, z=10},
["Minato Hokage"] = {x=1068, y=1057, z=10},
["Tsunade Hokage"] = {x=1082, y=1057, z=10},
["Kakashi Hokage"] = {x=1096, y=1057, z=10},

-- Quest Caminho Sem Volta --
["Kimimaru Boss"] = {x=1084, y=1222, z=7},
["Sasori Boss"] = {x=816, y=1179, z=8},
["Madara Boss"] = {x=1258, y=1253, z=9},
["Kabuto Boss"] = {x=650, y=791, z=9},
["Raikage Boss"] = {x=978, y=908, z=9},
["Zabuza Boss"] = {x=1532, y=1185, z=8},
["Roshi"] = {x=496, y=1239, z=6},
["Yamata"] = {x=1502, y=1134, z=8}
}
}

local function removal(position)
doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
return TRUE
end

function onDeath(cid, corpse, killer)
registerCreatureEvent(cid, "teleportmonster")
local position = getCreaturePosition(cid)

for name, pos in pairs(config.bosses) do
if name == getCreatureName(cid) then
teleport = doCreateTeleport(config.teleportId, pos, position)
doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
addEvent(removal, config.timeToRemove * 1000, position)
doSendMagicEffect(position,10)
end
end
return TRUE
end