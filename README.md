# 🎁 Simple Bonus NPC | Initial Welcome Reward System

![GitHub License](https://img.shields.io/badge/license-Personal_Use-blueviolet)
![Framework](https://img.shields.io/badge/framework-ESX-blue)
![Optimized](https://img.shields.io/badge/optimized-0.00ms-brightgreen)

Un script de bienvenida inmersivo para **ESX Legacy**. Permite a los nuevos jugadores reclamar un bono inicial (dinero y vehículo) mediante una interacción con un NPC utilizando el sistema de "ojito".


<p align="center">
  <img src="https://github.com/user-attachments/assets/4ebc2978-9aff-4162-8be8-63633312cd37" alt="Radio UI" width="45%">
</p>

---


## ✨ Features | Características

* ✅ **One-Time Claim:** Sistema persistente que evita que un jugador reclame el bono dos veces.
* ✅ **Permanent Vehicle:** Registro automático en la tabla `owned_vehicles` para que sea propiedad del jugador.
* ✅ **Target Interaction:** Optimizado para `ox_target` para una mejor experiencia de usuario.
* ✅ **Smart Teleport:** Teletransporta al jugador directamente al asiento del conductor en la zona de entrega.
* ✅ **High Performance:** Consumo nulo de recursos (0.00ms en resmon).

---

## 🕹️ Reward Logic | Lógica de Recompensas

| Recompensa | Tipo | Cantidad / Modelo |
| :--- | :---: | :--- |
| **Money / Dinero** | 💵 | $5,000 (Banco) |
| **Vehicle / Vehículo** | 🚗 | Sultan (Configurable) |
| **Registration** | 📝 | Matrícula Personalizada |

---

## 📦 Dependencies | Dependencias

| Resource | Description | Descripción |
| :--- | :--- | :--- |
| **ESX Legacy** | Core framework. | Base del servidor. |
| **oxmysql** | Database handler. | Gestor de base de datos. |
| **ox_target** | Interaction system. | Sistema de interacción (ojito). |

## 📜 License & Terms | Licencia y Términos

| Condition | English | Español |
| :--- | :--- | :--- |
| 🚫 **Re-upload** | Do not re-upload: Licensed & registered. | No resubir: Script bajo licencia y registrado. |
| 🔐 **Personal Use** | Free to use and edit for your server. | Libre de usar y editar para tu servidor. |
| ⚙️ **Optimized** | High performance & clean code. | Alto rendimiento y código limpio. |

---

## 📢 Support | Soporte

¿Buscas actualizaciones o nuevos scripts? ¡Únete a nuestra comunidad!

[![Discord Shield](https://img.shields.io/badge/Discord-Join%20Us-7289da?style=for-the-badge&logo=discord)](https://discord.gg/2W9PMsYWTZ)

---

## 🛠️ Installation | Instalación

1. **SQL:** Ejecuta la siguiente consulta en tu base de datos:
   ```sql
   ALTER TABLE `users` ADD COLUMN `bono_reclamado` TINYINT(1) DEFAULT 0;
   UPDATE users SET bono_reclamado = 0 WHERE identifier = 'TU_IDENTIFIER_AQUÍ';
   -- O si quieres resetear a todos los jugadores:
   UPDATE users SET bono_reclamado = 0;
   ALTER TABLE `owned_vehicles` ADD COLUMN `parking` VARCHAR(60) DEFAULT 'Garage_Center';
   ALTER TABLE `owned_vehicles` ADD COLUMN `impound` TINYINT(1) DEFAULT 0;

