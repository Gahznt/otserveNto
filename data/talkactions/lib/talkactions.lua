-- Nothing --
function checkExhausted(cid, storage, seconds)
    local v = exhaustion.get(cid, storage)
    if(not v) then
        exhaustion.set(cid, storage, seconds)
    else
        doPlayerSendCancel(cid, "Please wait " .. v .. " seconds before use that command again.")
        return false
    end

    return true
end