# Taller Datos Abiertos Colombia - Flutter App

Esta es una aplicación móvil desarrollada en Flutter que consume datos públicos de la API de Colombia. El objetivo del proyecto es demostrar la implementación de una arquitectura limpia, manejo de estados dinámico y navegación avanzada.

## 🚀 API Utilizada

Se utiliza la [API Pública de Colombia](https://api-colombia.com/), la cual proporciona información diversa sobre el país.

**Base URL:** `https://api-colombia.com/api/v1/`

### Endpoints Seleccionados:
1.  **Departamentos:** `/api/v1/Department`
2.  **Regiones:** `/api/v1/Region`
3.  **Presidentes:** `/api/v1/President`
4.  **Atracciones Turísticas:** `/api/v1/TouristicAttraction`

---

## 🏗️ Arquitectura y Estructura

El proyecto sigue una estructura modular y escalable (Clean Architecture):

```text
lib/
├── config/             # Configuración global
├── models/             # Modelos de datos (POJO) con fromJson/toJson
├── routes/             # Configuración de GoRouter
├── services/           # Lógica de consumo de API (HTTP)
├── themes/             # Estilo global de la app (Material 3)
├── views/              # Pantallas de la aplicación
└── widgets/            # Componentes reutilizables
```

### Principios aplicados:
*   **Separación de responsabilidades:** La lógica HTTP está aislada en los servicios.
*   **Seguridad:** Uso de archivos `.env` para variables de entorno.
*   **Reutilización:** Uso de un `BasicStateWidget` para manejar estados de carga y error de forma uniforme.

---

## 📱 Previsualización y Estados

### Pantallas principales:
*   **Dashboard:** Acceso directo a cada categoría mediante tarjetas interactivas.
*   **Listado:** Muestra una lista de elementos obtenidos de la API con scroll infinito.
*   **Detalle:** Información técnica y detallada de un elemento específico.

![Dashboard Preview](dashboard_preview.png)

### Manejo de Estados:
La aplicación maneja tres estados fundamentales de manera reactiva:
*   **Loading:** Se muestra un indicador de carga mientras se espera la respuesta de la API.
*   **Success:** Se renderiza la lista o el detalle una vez los datos son procesados exitosamente.
*   **Error:** Se muestra un mensaje descriptivo y un botón de "Reintentar" en caso de fallos de red o de servidor.

---

## 🗺️ Rutas Implementadas

Se utiliza **GoRouter** para una navegación declarativa y paso de parámetros efectivo.

| Ruta | Vista | Parámetros |
| :--- | :--- | :--- |
| `/` | Dashboard | Ninguno |
| `/list/:type` | Listado | `type`: Indica el recurso a listar (departments, regions, etc.) |
| `/detail/:type/:id` | Detalle | `type`: Recurso, `id`: Identificador único del elemento |

---

## 📊 Ejemplo de Respuesta JSON

Ejemplo de respuesta obtenido del endpoint `/Department/1`:

```json
{
  "id": 1,
  "name": "Amazonas",
  "description": "El departamento de Amazonas es uno de los treinta y dos departamentos...",
  "population": 76589,
  "surface": 109665
}
```

---

## 🛠️ Configuración Loca

1. Clona el repositorio.
2. Crea un archivo `.env` basado en el `.env.example`.
3. Ejecuta `flutter pub get`.
4. Corre la aplicación con `flutter run`.
