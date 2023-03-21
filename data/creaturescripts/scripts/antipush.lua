function isPosInArray(array, pos)

   for _, v in pairs(array) do

          if v.x == pos.x and v.y == pos.y and v.z == pos.z then

                 return true

          end

   end

   return false

end

local pos = {

   {x = 1059, y = 1088, z = 5},

   {x = 1087, y = 1101, z = 5},

}

function onPush(cid, target)

   if isPlayer(target) and isPosInArray(pos, getThingPos(target)) then

          doPlayerSendCancel(cid, "Você não pode empurrar este player.")

          return false

   end

   return true

end