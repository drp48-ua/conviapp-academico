// ============================================================
// ConviApp – Librería de acceso a datos (ADO.NET + SQLite)
// Programa de demostración para la entrega académica.
// ============================================================
// Demuestra el patrón EN / CAD implementado con ADO.NET:
//   · ENUsuario  / CADUsuario   → creación, lectura por ID y por email
//   · ENPiso     / CADPiso      → creación y listado (modo desconectado)
//   · ENGasto    / CADGasto     → creación y listado (modo desconectado)
// ============================================================

using ConviAppWeb.DataAccess;
using ConviAppWeb.Models;

Console.OutputEncoding = System.Text.Encoding.UTF8;
Console.WriteLine("=======================================================");
Console.WriteLine("  ConviApp – Demo de la capa de acceso a datos (CAD)  ");
Console.WriteLine("=======================================================");
Console.WriteLine();

// -------------------------------------------------------
// 1. CREAR USUARIO (CADUsuario – Modo desconectado / DataSet + DataAdapter)
// -------------------------------------------------------
Console.WriteLine(">> 1. CREAR USUARIO (modo desconectado)");
var cadUsuario = new CADUsuario();
var nuevoUsuario = new ENUsuario
{
    Nombre       = "Demo",
    Apellidos    = "Académico",
    Email        = $"demo.{DateTime.Now.Ticks}@conviapp.com",
    PasswordHash = "demo1234",
    Telefono     = "600000000",
    RolId        = 1
};
bool creado = cadUsuario.CrearUsuario(nuevoUsuario);
Console.WriteLine($"   Resultado: {(creado ? "OK" : "NO")}  |  Email: {nuevoUsuario.Email}");
Console.WriteLine();

// -------------------------------------------------------
// 2. LEER USUARIO POR ID (CADUsuario – Modo conectado / SqlCommand + SqlDataReader)
// -------------------------------------------------------
Console.WriteLine(">> 2. LEER USUARIO POR ID=1 (modo conectado)");
var usuarioLeido = cadUsuario.LeerUsuario(1);
if (usuarioLeido != null)
    Console.WriteLine($"   Nombre={usuarioLeido.Nombre}  Email={usuarioLeido.Email}");
else
    Console.WriteLine("   (usuario ID=1 no encontrado en la BD)");
Console.WriteLine();

// -------------------------------------------------------
// 3. BUSCAR USUARIO POR EMAIL (CADUsuario – Modo conectado)
// -------------------------------------------------------
Console.WriteLine(">> 3. BUSCAR USUARIO POR EMAIL (modo conectado)");
var usuarioBuscado = cadUsuario.BuscarPorEmail(nuevoUsuario.Email);
if (usuarioBuscado != null)
    Console.WriteLine($"   Encontrado: {usuarioBuscado.Nombre} ({usuarioBuscado.Email})");
else
    Console.WriteLine($"   No encontrado: {nuevoUsuario.Email}");
Console.WriteLine();

// -------------------------------------------------------
// 4. CREAR PISO (CADPiso – Modo desconectado / DataSet)
// -------------------------------------------------------
Console.WriteLine(">> 4. CREAR PISO (modo desconectado)");
var cadPiso = new CADPiso();
var nuevoPiso = new ENPiso
{
    Direccion          = "Calle Ejemplo, 10",
    Ciudad             = "Alicante",
    CodigoPostal       = "03001",
    NumeroHabitaciones = 3,
    NumeroBanos        = 1,
    PrecioTotal        = 850m,
    Descripcion        = "Piso demo para pruebas académicas",
    Caracteristicas    = "Parking, Ascensor",
    Disponible         = true
};
bool pisoCr = cadPiso.CrearPiso(nuevoPiso);
Console.WriteLine($"   Resultado: {(pisoCr ? "OK" : "NO")}  |  {nuevoPiso.Direccion}, {nuevoPiso.Ciudad}");
Console.WriteLine();

// -------------------------------------------------------
// 5. LISTAR PISOS (CADPiso – Modo desconectado / DataSet)
// -------------------------------------------------------
Console.WriteLine(">> 5. LISTAR PISOS (modo desconectado)");
var pisos = cadPiso.ListarTodos();
foreach (var p in pisos)
    Console.WriteLine($"   ID={p.Id}  Dir={p.Direccion}  Precio={p.PrecioTotal:0.00} €  Disponible={p.Disponible}");
Console.WriteLine();

// -------------------------------------------------------
// 6. CREAR GASTO (CADGasto – Modo desconectado / DataSet)
// -------------------------------------------------------
Console.WriteLine(">> 6. CREAR GASTO (modo desconectado)");
var cadGasto = new CADGasto();
var nuevoGasto = new ENGasto
{
    Concepto        = "Factura luz",
    Descripcion     = "Factura de electricidad del mes de demo",
    Importe         = 74.50m,
    Fecha           = DateTime.Today,
    RegistradoPorId = 1
};
bool gastoCr = cadGasto.CrearGasto(nuevoGasto);
Console.WriteLine($"   Resultado: {(gastoCr ? "OK" : "NO")}  |  {nuevoGasto.Concepto}: {nuevoGasto.Importe:0.00} €");
Console.WriteLine();

// -------------------------------------------------------
// 7. LISTAR GASTOS (CADGasto – Modo desconectado / DataSet)
// -------------------------------------------------------
Console.WriteLine(">> 7. LISTAR GASTOS (modo desconectado)");
var gastos = cadGasto.ListarTodos();
foreach (var g in gastos)
    Console.WriteLine($"   ID={g.Id}  Concepto={g.Concepto}  Importe={g.Importe:0.00} €  Fecha={g.Fecha:dd/MM/yyyy}");
Console.WriteLine();

Console.WriteLine("=======================================================");
Console.WriteLine("  Demo completado. Pulsa ENTER para salir.");
Console.WriteLine("=======================================================");
Console.ReadLine();
