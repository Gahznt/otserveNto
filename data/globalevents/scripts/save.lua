local config = {
	broadcast = {5, 5},
	flags = 13,
	delay = 5,
	events = 5
}

local function executeSave(seconds)
	if(isInArray(config.broadcast, seconds)) then
		doBroadcastMessage("Saving in " .. seconds .. " seconds...")
	end

	if(seconds > 0) then
		addEvent(executeSave, config.events * 1000, seconds - config.events)
	else
		doSaveServer(config.flags)
	end
end

function onThink(interval)
	if(table.maxn(config.broadcast) == 0) then
		doSaveServer(config.flags)
	else
		executeSave(config.delay)
	end

	return true
end
