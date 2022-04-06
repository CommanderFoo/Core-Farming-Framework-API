--[[#SampleStart
		method: SetCurrencyAmount
		method: GetCurrencyAmount
		method: HasRoomForCurrency
	#description
		In this example, the player's coins will be doubled when coins has been added.
]]
	local CURRENCY = require(script:GetCustomProperty("APICurrency"))

	local coinsMultiplier = 2
	local currency = "coins"

	local function OnCurrencyAdded(player, currencyId, amountAdded)
		if coinsMultiplier > 1 and currencyId == currency and CURRENCY.HasRoomForCurrency(player, currencyId, amountAdded) then
			local currentAmount = CURRENCY.GetCurrencyAmount(player, currencyId)

			CURRENCY.SetCurrencyAmount(player, currencyId, currentAmount + (amountAdded * coinsMultiplier))
		end
	end

	Events.Connect(CURRENCY.Events.CurrencyAdded, OnCurrencyAdded)
--#SampleEnd