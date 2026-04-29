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
        lblTotal.Text      = string.Format("{0:0.00} €", total);
        lblPorPersona.Text = string.Format("{0:0.00} €", total / 3); // Suponemos 3 compañeros
    }

    protected void BtnNuevoGasto_Click(object sender, EventArgs e)
    {
        pnlFormGasto.Visible = true;
        txtFecha.Text        = DateTime.Today.ToString("yyyy-MM-dd");
    }

    protected void BtnGuardarGasto_Click(object sender, EventArgs e)
    {
        int userId = (int?)Session["UserId"] ?? 1;

        decimal imp;
        decimal.TryParse(txtImporte.Text, out imp);
        
        DateTime f;
        if (!DateTime.TryParse(txtFecha.Text, out f)) f = DateTime.Today;

        var nuevoGasto = new ENGasto
        {
            Concepto        = txtConcepto.Text.Trim(),
            Importe         = imp,
            Descripcion     = txtDescripcion.Text.Trim(),
            Fecha           = f,
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
    {
        pnlFormGasto.Visible = false;
    }

    protected void GvGastos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        int id;
        if (e.CommandName == "Pagar" && e.CommandArgument != null && int.TryParse(e.CommandArgument.ToString(), out id))
        {
            // TODO: marcar gasto como pagado usando CADGasto.ActualizarGasto()
            CargarGastos();
        }
    }
}
