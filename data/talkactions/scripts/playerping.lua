-- Script by Yan Liima(Night for tibiaking.com)
function onSay(cid, words, param, channel)
local ms = ping.CheckPing(cid)
	doPlayerSendTextMessage(cid,22,"Ping aproximado --> ["..ms.."].")
	return true
end