local remove = true -- Remover ao usar?
 
local cfg = {
    [2218] = {newVoc = 17, newOut = {lookType = 476}, levelMax = 30}, -- Madara
	[2198] = {newVoc = 11, newOut = {lookType = 750}, levelMax = 30}, -- Hashirama
	[2219] = {newVoc = 12, newOut = {lookType = 788}, levelMax = 30}, -- Tobirama
	[2220] = {newVoc = 13, newOut = {lookType = 1190}, levelMax = 30}, --  Sarutobi
	[2221] = {newVoc = 14, newOut = {lookType = 560}, levelMax = 30},	-- Minato
	[2222] = {newVoc = 15, newOut = {lookType = 586}, levelMax = 30},	-- Tsunade
	[2201] = {newVoc = 16, newOut = {lookType = 9}, levelMax = 30}, -- Kakashi
	[2338] = {newVoc = 1, newOut = {lookType = 1508}, levelMax = 30}, -- Naruto
	[11191] = {newVoc = 18, newOut = {lookType = 528}, levelMax = 30}, -- Hidan
	[11190] = {newVoc = 19, newOut = {lookType = 1566}, levelMax = 30}, -- Obito
	[11192] = {newVoc = 20, newOut = {lookType = 732}, levelMax = 30}, -- Killer Bee
}
 
function onUse(cid, item)
    local t = cfg[item.itemid]
    
    if t then
        if getPlayerLevel(cid) <= t.levelMax then
            
            doPlayerSetVocation(cid, t.newVoc)
            doPlayerSendCancel(cid, "Parabéns, você trocou seu persomagem.")
            doCreatureChangeOutfit(cid, t.newOut)
            doSendMagicEffect(getThingPos(cid), 5)
 
            if remove then
                doRemoveItem(item.uid, 1)
            end
        end
 
        doPlayerSendCancel(cid, "Apenas jogadores com level inferior a "..t.levelMax.." podem usar.")
    end
    return true
end