function onStepIn(cid, item, pos)

local posz = getCreaturePosition(cid)
setPlayerStorageValue(cid, 55695,1)
				if getPlayerStorageValue(cid, 55695)  >= 1 then	
                local damage = math.floor(getCreatureMaxHealth(cid)/33) -- O dano é a divisão da vida do Player por 10.
				doCreatureAddHealth(cid, -damage)
                doSendMagicEffect({x = posz.x+1, y = posz.y, z = posz.z},117)
                doSendAnimatedText(posz, 'Kabum!', TEXTCOLOR_ORANGE)
				doRemoveItem(item.uid)
				else
				return TRUE
				end
    return TRUE
end