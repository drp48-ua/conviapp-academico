// ============================================================
// Gastos.aspx.cs – Code-behind de gastos del mes (Web Forms)
// Carga y registra gastos usando CADGasto.
// ============================================================
using System;
using System.Linq;
using ConviAppWeb.DataAccess;
using ConviAppWeb.Models;

public partial class Gastos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] == null) { Response.Redirect("Login.aspx"); return; }

        if (!IsPostBack)
            CargarGastos();
    }

    private void CargarGastos()
    {
        // CADGasto.ListarTodos() → modo desconectado (DataSet + DataAdapter)
        var cadGasto = new CADGasto();
        var gastos   = cadGasto.ListarTodos();

        gvGastos.DataSource = gastos;
        gvGastos.DataBind();

        // Calcular total del mes
        decimal total = gastos.Sum(g => g.Importe);
        lblTotal.Text      = $"{total:0.00} €";
        lblPorPersona.Text = $"{(total / 3):0.00} €"; // Suponemos 3 compañeros
    }

    protected void BtnNuevoGasto_Click(object sender, EventArgs e)
    {
        pnlFormGasto.Visible = true;
        txtFecha.Text        = DateTime.Today.ToString("yyyy-MM-dd");
    }

    protected void BtnGuardarGasto_Click(object sender, EventArgs e)
    {
        int userId = (int?)Session["UserId"] ?? 1;

        var nuevoGasto = new ENGasto
        {
            Concepto        = txtConcepto.Text.Trim(),
            Importe         = decimal.TryParse(txtImporte.Text, out decimal imp) ? imp : 0m,
            Descripcion     = txtDescripcion.Text.Trim(),
            Fecha           = DateTime.TryParse(txtFecha.Text, out DateTime f) ? f : DateTime.Today,
            RegistradoPorId = userId,
            Pagado          = false
        };

        // CADGasto.CrearGasto() → modo desconectado (DataSet + DataAdapter + CommandBuilder)
        var cadGasto = new CADGasto();
        cadGasto.CrearGasto(nuevoGasto);

        pnlFormGasto.Visible = false;
        CargarGastos();
    }

    protected void BtnCancelarGasto_Click(object sender, EventArgs e)
        => pnlFormGasto.Visible = false;

    protected void GvGastos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Pagar" && int.TryParse(e.CommandArgument?.ToString(), out int id))
        {
            // TODO: marcar gasto como pagado usando CADGasto.ActualizarGasto()
            CargarGastos();
        }
    }
}
