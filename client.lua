local txdName = 'dk_plates_txd'
local txd = CreateRuntimeTxd(txdName)
CreateRuntimeTextureFromImage(txd, 'dk_plate', 'dk_plate.png')

local sources = { 'vehshare', 'vehshare_truck', 'vehshare_army', 'vehshare_worn' }
local plates = { 'plate01', 'plate02', 'plate03', 'plate04', 'plate05' }

for _, src in ipairs(sources) do
    for _, plate in ipairs(plates) do
        AddReplaceTexture(src, plate, txdName, 'dk_plate')
    end
end

CreateThread(function()
    while true do
        Wait(2000)
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if veh ~= 0 and GetVehicleNumberPlateTextIndex(veh) ~= 0 then
            SetVehicleNumberPlateTextIndex(veh, 0)
        end
    end
end)
