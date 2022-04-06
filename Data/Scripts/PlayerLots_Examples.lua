-- --[[#SampleStart
-- 		method: FindPlayerOwnedLots
-- 	#description
-- 		Get all the lots owned by a player.
-- ]]
-- local PLAYER_LOTS = require(script:GetCustomProperty("APIPlayerLots"))
-- local LOCAL_PLAYER = Game.GetLocalPlayer()

-- local function OnTeleportedToLot()
-- 	print(PLAYER_LOTS.FindLotByAncestors(LOCAL_PLAYER))
-- end

-- Events.Connect(PLAYER_LOTS.Events.TeleportedToLot, OnTeleportedToLot)

-- --#SampleEnd