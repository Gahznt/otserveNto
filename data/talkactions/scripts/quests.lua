--###################################
--## Developed by: MaXwEllDeN ##
--## Contact:  ##
--##  maxwellmda@gmail.com ##
--###################################
 
local quests = {
   ["Ajudar Mizuki"] = 12001,
   ["Ajudar Zabuza"] = 12002,
   ["Ajudar Jirobo"] = 12003,
   ["Ajudar Orochimaru"] = 12004,
   ["Ajudar Kimimaru"] = 12005,
   ["Ajudar Kisame"] = 12006,
   ["Ajudar Deidara"] = 12007,
   ["Ajudar Hidan"] = 12008,
   ["Ajudar Kakuzo"] = 12209,
   ["Ajudar Kabuto"] = 12010,
   ["Ajudar Sasori"] = 12011,
   ["Ajudar Tobi"] = 15522,
   ["Ajudar Nagato"] = 12012,
   ["Ajudar Konan"] = 635212,
   ["Ajudar Danzou"] = 10812,
   ["Ajudar Obito"] = 15512,
   ["Ajudar Itachi"] = 15532,
   ["Ajudar Renegade Nagato"] = 13559,
   ["Ajudar Madara"] = 22542,   
   ["Ajudar Temari"] = 13231,
   ["Ajudar Kiba"] = 13232,
   ["Ajudar Ino"] = 13233,
   ["Ajudar Chouji"] = 13234,
   ["Ajudar Guy"] = 13235,
   ["Ajudar Dosu Kinuta"] = 13236,
   ["Ajudar Gaara"] = 13237,
   ["Ajudar Haku"] = 13238,
   ["Ajudar Anbu Nucleo"] = 13239,
   ["Ajudar Shisui"] = 13240,
   ["Ajudar Lee"] = 13241,
   ["Ajudar Kankuro"] = 13242,   
   ["Quest Saga 1"] = 11211,
   ["Quest Saga 2"] = 11202,
   ["Quest Saga 3"] = 11203,
   ["Quest Saga 4"] = 11204,
   ["Quest Saga 5"] = 11205,
   ["Quest Distance"] = 16866,
   ["Quest Samehada"] = 11812,
   ["Quest Raikage Gloves"] = 11811,
   ["Quest Zabuza Sword"] = 11813,
   ["Quest Kakuzo"] = 13395,  
   ["Tesouro Dragon Gloves"] = 11814,
   ["Box Adaga Cortante"] = 11816,
   ["Box Eletric Katana"] = 11817,
   ["Box Esmerald Sword"] = 17329,
   ["Box Plate Gloves"] = 11815,
   ["Box Sound Gloves"] = 11818,
}
 
function onSay(cid)
   local str = "#Objetivos não concluídos:\n"
   local conc = {}
 
   for i, v in pairs(quests) do
      if getPlayerStorageValue(cid, v) > 0 then
         table.insert(conc, i)
      else
         str = str .. "\n".. i .. " - Não concluída"
      end
   end
 
   str = str .. "\n\n#Objetivos concluídos:\n"
 
   for _, v in pairs(conc) do
      str = str .. "\n".. v .. " - Ok"
   end
 
   return doShowTextDialog(cid, 1746, str)
end