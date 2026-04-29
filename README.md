# ConviApp – Aplicación de Gestión de Pisos Compartidos

Proyecto de aplicación web desarrollado como entrega académica para la asignatura de Desarrollo de Software orientado a Datos y Modelos (DSDM / HADS).

## Tecnologías

- **ASP.NET Core 8 MVC** – Capa de presentación web
- **ADO.NET** (SQLite) – Acceso a datos sin ORM, implementando modos conectado y desconectado
- **SQLite** – Base de datos relacional embebida (`conviapp.db`)
- **C# .NET 8** – Lenguaje de implementación

## Estructura del Proyecto

```
ConviApp.sln
├── Library/                  ← Librería de negocio y acceso a datos
│   ├── EN/                   ← Entidades de Negocio (prefijo EN)
│   │   ├── ENUsuario.cs
│   │   ├── ENPiso.cs
│   │   └── ... (18 entidades)
│   ├── CAD/                  ← Componentes de Acceso a Datos (prefijo CAD)
│   │   ├── CADUsuario.cs     ← CRUD completo con modo conectado + desconectado
│   │   ├── CADPiso.cs
│   │   └── ... (18 CADs + DbConfig.cs)
│   └── Program.cs            ← Programa de consola de demostración EN/CAD
└── ConviAppWeb/              ← Aplicación web ASP.NET Core MVC
    ├── Controllers/
    ├── Views/
    ├── wwwroot/
    ├── Program.cs            ← Punto de entrada web
    └── conviapp.db           ← Base de datos SQLite
```

## Patrón ADO.NET implementado

Todos los CAD implementan **dos modos de acceso**:

| Método | Modo | Clase ADO.NET usada |
|--------|------|---------------------|
| Crear / Borrar | **Desconectado** | `DataSet`, `SQLiteDataAdapter`, `SQLiteCommandBuilder` |
| Leer / Buscar | **Conectado** | `SQLiteConnection`, `SQLiteCommand`, `SQLiteDataReader` |
| Actualizar | **Conectado** | `SQLiteCommand`, `ExecuteNonQuery` |

## Cómo ejecutar

### Programa de consola (demo EN/CAD)
```bash
cd Library
dotnet run
```

### Aplicación web
```bash
cd ConviAppWeb
dotnet run
```
Abre `https://localhost:5000` en el navegador.

## Base de datos

El archivo `conviapp.db` se incluye en `ConviAppWeb/` y se crea automáticamente si no existe mediante las migraciones definidas en `Program.cs`.

## Funcionalidades principales

- 🏠 Gestión de pisos compartidos (CRUD completo)
- 👥 Registro y autenticación de usuarios (3 planes: Básico, Pro, Enterprise)
- 💶 Control de gastos del hogar
- 📋 Gestión de contratos y pagos
- ✅ Tareas del hogar asignables
- 🔔 Sistema de notificaciones
- 📁 Gestión de documentos
- 💬 Mensajería entre compañeros

## Autores

Proyecto desarrollado por el grupo — Universidad de Alicante.
