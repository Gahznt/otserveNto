--- Xtibia
--- Xtibia.

local ids_bloqueados = {2160, 5706, 2463} -- Itens que não podem ser refinados

local controle = {
    {level = 0, quantOre = 1, chance = 100}, -- Level do item, quantidade de Iron Ore necessaria, chance de 
    {level = 1, quantOre = 2, chance = 90},
    {level = 2, quantOre = 3, chance = 80},
    {level = 3, quantOre = 4, chance = 70},
    {level = 4, quantOre = 5, chance = 60},
    {level = 5, quantOre = 6, chance = 50},
    {level = 6, quantOre = 7, chance = 40},
    {level = 7, quantOre = 8, chance = 30},
    {level = 8, quantOre = 9, chance = 20},
    {level = 9, quantOre = 10, chance = 10}
}

function getItemLevel(uid)
    if uid > 0 then
        return getItemAttribute(uid, "lvl") or 0
    end
    return false
end

function doItemAddLevel(uid, count)
    if uid > 0 and tonumber(count) then
        return doItemSetAttribute(uid, "lvl", getItemLevel(uid) + count)
    end
    return false
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if isInArray(ids_bloqueados, itemEx.uid) then
        return doPlayerSendCancel(cid, "Este item não pode ser aprimorado!")
    end 
    
    if getItemInfo(itemEx.itemid).attack > 0 or getItemInfo(itemEx.itemid).defense > 0 or getItemInfo(itemEx.itemid).armor > 0 then
        for _, upgrade in pairs(controle) do
            local atk = getItemAttribute(itemEx.uid, "attack") or getItemInfo(itemEx.itemid).attack
            local def = getItemAttribute(itemEx.uid, "defense") or getItemInfo(itemEx.itemid).defense
            local arm = getItemAttribute(itemEx.uid, "armor") or getItemInfo(itemEx.itemid).armor
            local chance = math.random(1, 100)
            if getItemLevel(itemEx.uid) == upgrade.level then
               if doPlayerRemoveItem(cid, 2448, upgrade.quantOre) then
                   doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_EXPLOSIONAREA)
                  if chance <= upgrade.chance then
                      if getItemLevel(itemEx.uid) == 0 then
                          doItemSetAttribute(itemEx.uid, "description", "Aprimorado por " ..getCreatureName(cid))
                      end
                      doItemAddLevel(itemEx.uid, 1)
                      doItemSetAttribute(itemEx.uid, "name", getItemNameById(itemEx.itemid).. " + " ..getItemLevel(itemEx.uid))
                      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sucesso ! Agora seu "..getItemNameById(itemEx.itemid).." possui aprimoramento nível " ..getItemLevel(itemEx.uid))
                      if getItemInfo(itemEx.itemid).attack > 0 then
                          doItemSetAttribute(itemEx.uid, "attack", atk + 25)
                          return true
                      elseif getItemInfo(itemEx.itemid).armor > 0 then
                          doItemSetAttribute(itemEx.uid, "armor", arm + 2)
                          return true
                      elseif getItemInfo(itemEx.itemid).defense > 0 and getItemInfo(itemEx.itemid).attack <= 0 then
                          doItemSetAttribute(itemEx.uid, "defense", def + 10)
                          return true
                      end
                  else
                      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Falhou !")
                      if getItemLevel(itemEx.uid) > 0 then
                          doItemAddLevel(itemEx.uid, -1)
                          doItemSetAttribute(itemEx.uid, "name", getItemNameById(itemEx.itemid).. " + " ..getItemLevel(itemEx.uid))
                          if getItemInfo(itemEx.itemid).attack > 0 then
                              doItemSetAttribute(itemEx.uid, "attack", atk - 25)
                              return true
                          elseif getItemInfo(itemEx.itemid).armor > 0 then
                              doItemSetAttribute(itemEx.uid, "armor", arm - 2)
                              return true
                          elseif getItemInfo(itemEx.itemid).defense > 0 and getItemInfo(itemEx.itemid).attack <= 0 then
                              doItemSetAttribute(itemEx.uid, "defense", def - 5)
                              return true
                          end
                      end
					  return true
                  end
              else
                  doPlayerSendCancel(cid, "Você não tem Kits o suficiente. Você precisa de "..upgrade.quantOre.." Kits de Aprimoramento para aprimorar.")
              end
          end
      end
  else
      doPlayerSendCancel(cid, "Esse item nao pode ser aprimorado.")
  end
  return true
end  