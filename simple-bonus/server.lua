local ESX = exports["es_extended"]:getSharedObject()
local modeloVehiculo = 'sultan' 

RegisterNetEvent('simple-bonus:intentarReclamar', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    exports.oxmysql:scalar('SELECT bono_reclamado FROM users WHERE identifier = ?', {xPlayer.identifier}, function(reclamado)
        if not reclamado or reclamado == 0 then
            
           
            exports.oxmysql:update('UPDATE users SET bono_reclamado = 1 WHERE identifier = ?', {xPlayer.identifier})

            -- 2. DINERO DEL BONO (ACTUALMENTE 5000€)
            xPlayer.addAccountMoney('bank', 5000)

            -- 3. Generamos los datos del vehículo
            local plate = "BONO"..math.random(100, 999)
            local vehicleData = json.encode({model = GetHashKey(modeloVehiculo), plate = plate})

            exports.oxmysql:insert('INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type) VALUES (?, ?, ?, ?, ?)', {
                xPlayer.identifier,
                plate,
                vehicleData,
                1,          
                'car'       
            }, function(id)
                TriggerClientEvent('simple-bonus:spawnCoche', src, modeloVehiculo, plate)
                xPlayer.showNotification('¡Bono recibido! Tu vehículo ha sido registrado.')
            end)

        else
            xPlayer.showNotification('Ya has reclamado este bono anteriormente.')
        end
    end)
end)

RegisterNetEvent('simple-bonus:actualizarPropiedades', function(plate, props)
    exports.oxmysql:update('UPDATE owned_vehicles SET vehicle = ? WHERE plate = ?', {
        json.encode(props),
        plate
    })
end)