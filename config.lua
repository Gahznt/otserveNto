-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
stairhopDelay = 1 * 1000
blessingOnlyPremium = false

fragsLimit = 24 * 60 * 60
fragsSecondLimit = 1 * 24 * 60 * 60
fragsThirdLimit = 1 * 24 * 60 * 60

fragsToRedSkull = 10
fragsSecondToRedSkull = 60
fragsThirdToRedSkull = 90
redSkullLength = 1 * 24 * 60 * 60


fragsToBlackSkull = 15
fragsSecondToBlackSkull = 65
fragsThirdToBlackSkull = 95
blackSkulledDeathHealth = 40
blackSkulledDeathMana = 0
blackSkullLength = 2 * 24 * 60 * 60
useBlackSkull = true

notationsToBan = 3
warningsToFinalBan = 4
warningsToDeletion = 5
banLength = 7 * 24 * 60 * 60
killsBanLength = 7 * 24 * 60 * 60
finalBanLength = 30 * 24 * 60 * 60
ipBanLength = 1 * 24 * 60 * 60
fragsToBanishment = 25
fragsSecondToBanishment = 70
fragsThirdToBanishment = 99

worldId = 0
worldType = "open"
hotkeyAimbotEnabled = true
protectionLevel = 30

killsToRedSkull = 10
killsToBlackSkull = 15

pzLocked = 30 * 1000
removeChargesFromRunes = true
removeChargesFromPotions = true
removeWeaponAmmunition = true
removeWeaponCharges = true
timeToDecreaseFrags = 24 * 60 * 60 * 1000
whiteSkullTime = 10 * 60 * 1000
stairJumpExhaustion = 1 * 1000
experienceByKillingPlayers = true
rateExperienceFromPlayers = 2
expFromPlayersLevelRange = 40
skipItemsVersionCheck = true
accountManager = false
pushCreatureDelay = 1 * 1500
ingameGuildManagement = false
elfProtectionTarget = true
useFragHandler = true
advancedFragList = false

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
ip = "45.224.128.142"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 200
motd = "Bem-vindo ao NTO Hard Online !"
onePlayerOnlinePerAccount = false
allowClones = false
serverName = "Hard"
statusTimeout = 5 * 1000
replaceKickOnLogin = true
maxPacketsPerSecond = 50


-- Version Manual
clientVersionMin = 860
clientVersionMax = 860
clientVersionStr = "Only clients with protocol 8.60 allowed!"

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1


-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
housePriceEachSquare = 7500
houseRentPeriod = "monthly"

-- Item Usage
timeBetweenActions = 1000
timeBetweenExActions = 1000

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "forgotten.otbm"
mapAuthor = "Eros"

-- MySQL
sqlType = "mysql"
mysqlHost = "127.0.0.1"
mysqlUser = "root"
mysqlPass = "x"
mysqlDatabase = "test"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"

sqlHost = "localhost"
sqlPort = 3306
sqlUser = "root"
sqlPass = "x"
sqlDatabase ="test"
sqlFile = "test.s3db"
sqlKeepAlive = 0
mysqlReadTimeout = 0
mysqlWriteTimeout = 0
mysqlReconnectionAttempts = 3
encryptionType = "sha1"

-- Misc.
allowChangeOutfit = false
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 5
emoteSpells = true
classicEquipmentSlots = false
allowWalkthrough = true
classicAttackSpeed = false

-- Rates
-- NOTE: rateExp is not used if you have enabled stages in data/XML/stages.xml
experienceStages = true
rateExp = 1
rateSkill = 4
rateLoot = 1
rateMagic = 4
rateSpawn = 1
formulaLevel = 3.5
formulaMagic = 3.5

-- Monster rates
rateMonsterHealth = 1.0
rateMonsterAttack = 1.0
rateMonsterDefense = 1.0

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = true

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = true

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = true

-- Global save
	globalSaveEnabled = true
	globalSaveHour = 5
	globalSaveMinute = 5
	shutdownAtGlobalSave = true
	cleanMapAtGlobalSave = false
	closeInstanceOnShutdown = true
	
-- Houses
	buyableAndSellableHouses = true
	houseNeedPremium = true
	bedsRequirePremium = true
	levelToBuyHouse = 100
	housesPerAccount = 1
	houseRentAsPrice = true
	housePriceAsRent = true
	housePriceEachSquare = 45000
	houseRentPeriod = "monthly"
	houseCleanOld = 0
	guildHalls = true
	houseSkipInitialRent = true
	houseProtection = true

-- Status server information
ownerName = "Eros"
ownerEmail = "otserverhard@gmail.com"
url = "www.nto-hard.com"
location = "Brazil"
