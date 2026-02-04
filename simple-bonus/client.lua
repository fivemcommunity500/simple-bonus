local ESX = exports["es_extended"]:getSharedObject()

-- CONFIGURACIÓN NPC
local npcModel = `a_m_m_business_01`
local npcCoords = vector4(-267.89, -964.53, 31.22, 291.93) -- Ubicación del NPC

-- COORDENADAS DE ENTREGA DEL COCHE 
local entregaCoords = vector4(-301.33, -989.01, 31.08, 159.44) -- CAMBIA ESTO (x, y, z, heading)

Citizen.CreateThread(function()
    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do Wait(1) end

    local npc = CreatePed(4, npcModel, npcCoords.x, npcCoords.y, npcCoords.z - 1.0, npcCoords.w, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)

    exports.ox_target:addLocalEntity(npc, {
        {
            name = 'reclamar_bono',
            icon = 'fas fa-gift',
            label = 'Reclamar Bono Inicial',
            onSelect = function()
                TriggerServerEvent('simple-bonus:intentarReclamar')
            end
        }
    })
end)

RegisterNetEvent('simple-bonus:spawnCoche')
AddEventHandler('simple-bonus:spawnCoche', function(model, plate)
    local hash = GetHashKey(model)
    local playerPed = PlayerPedId()

    -- 1. Cargar el modelo del coche
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(1) end

    local vehicle = CreateVehicle(hash, entregaCoords.x, entregaCoords.y, entregaCoords.z, entregaCoords.w, true, true)
    
    local cleanPlate = string.gsub(plate, "^%s*(.-)%s*$", "%1")
    SetVehicleNumberPlateText(vehicle, cleanPlate)
    
    SetEntityCoords(playerPed, entregaCoords.x, entregaCoords.y, entregaCoords.z, false, false, false, true)
    
    Wait(100)
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    
    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
    TriggerServerEvent('simple-bonus:actualizarPropiedades', cleanPlate, vehicleProps)
    
    PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS", 1)
end)