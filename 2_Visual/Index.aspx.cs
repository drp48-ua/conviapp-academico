// ============================================================
// Index.aspx.cs – Code-behind de la página principal (Web Forms)
// Carga las estadísticas del dashboard usando la capa CAD.
// ============================================================
using System;
using ConviAppWeb.DataAccess;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Verificar sesión
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            CargarDashboard();
        }
    }

    private void CargarDashboard()
    {
        // Nombre y plan del usuario desde sesión
        lblUserName.Text = Session["UserName"] != null ? Session["UserName"].ToString() : "Usuario";
        lblPlan.Text     = Session["UserRole"] != null ? Session["UserRole"].ToString() : "Basico";

        // Estadísticas: pisos (CADPiso – modo desconectado / DataSet)
        var cadPiso  = new CADPiso();
        var pisos    = cadPiso.ListarTodos();
        lblNumPisos.Text = pisos.Count.ToString();

        // Estadísticas: gastos del mes (CADGasto – modo desconectado / DataSet)
        var cadGasto = new CADGasto();
        var gastos   = cadGasto.ListarTodos();
        decimal totalMes = 0m;
        foreach (var g in gastos) totalMes += g.Importe;
        lblTotalGastos.Text = string.Format("{0:0.00} €", totalMes);

        // Tareas pendientes (CADTarea – modo desconectado)
        var cadTarea = new CADTarea();
        var tareas   = cadTarea.ListarTodos();
        lblNumTareas.Text = tareas.Count.ToString();
    }

    protected void BtnPisos_Click(object sender, EventArgs e)
    {
        Response.Redirect("Pisos.aspx");
    }

    protected void BtnGastos_Click(object sender, EventArgs e)
    {
        Response.Redirect("Gastos.aspx");
    }

    protected void BtnTareas_Click(object sender, EventArgs e)
    {
        Response.Redirect("Tareas.aspx");
    }
}
