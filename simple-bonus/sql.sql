ALTER TABLE `users` ADD COLUMN `bono_reclamado` TINYINT(1) DEFAULT 0;
UPDATE users SET bono_reclamado = 0 WHERE identifier = 'TU_IDENTIFIER_AQUÍ';
-- O si quieres resetear a todos los jugadores:
UPDATE users SET bono_reclamado = 0;
ALTER TABLE `owned_vehicles` ADD COLUMN `parking` VARCHAR(60) DEFAULT 'Garage_Center';
ALTER TABLE `owned_vehicles` ADD COLUMN `impound` TINYINT(1) DEFAULT 0;