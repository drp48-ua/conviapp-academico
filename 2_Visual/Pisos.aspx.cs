// ============================================================
// Pisos.aspx.cs – Code-behind de la lista de pisos (Web Forms)
// Carga y guarda pisos usando CADPiso (modo conectado + desconectado).
// ============================================================
using System;
using ConviAppWeb.DataAccess;
using ConviAppWeb.Models;

public partial class Pisos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] == null) { Response.Redirect("Login.aspx"); return; }

        if (!IsPostBack)
            CargarPisos();
    }

    private void CargarPisos()
    {
        // CADPiso.ListarTodos() → modo desconectado (DataSet + DataAdapter)
        var cadPiso = new CADPiso();
        gvPisos.DataSource = cadPiso.ListarTodos();
        gvPisos.DataBind();
    }

    protected void BtnNuevoPiso_Click(object sender, EventArgs e)
    {
        pnlFormPiso.Visible = true;
        txtFecha_reset();
    }

    private void txtFecha_reset() { /* placeholder */ }

    protected void BtnGuardarPiso_Click(object sender, EventArgs e)
    {
        int h;
        if (!int.TryParse(txtHabitaciones.Text, out h) || h == 0) h = 1;

        int b;
        if (!int.TryParse(txtBanos.Text, out b) || b == 0) b = 1;

        decimal p;
        decimal.TryParse(txtPrecio.Text, out p);

        var nuevoPiso = new ENPiso
        {
            Direccion          = txtDireccion.Text.Trim(),
            Ciudad             = txtCiudad.Text.Trim(),
            CodigoPostal       = txtCodPostal.Text.Trim(),
            NumeroHabitaciones = h,
            NumeroBanos        = b,
            PrecioTotal        = p,
            Disponible         = true
        };

        // CADPiso.CrearPiso() → modo desconectado (DataSet + DataAdapter + CommandBuilder)
        var cadPiso = new CADPiso();
        cadPiso.CrearPiso(nuevoPiso);

        pnlFormPiso.Visible = false;
        CargarPisos();
    }

    protected void BtnCancelar_Click(object sender, EventArgs e)
    {
        pnlFormPiso.Visible = false;
    }

    protected void GvPisos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            // TODO: cargar formulario de edición con los datos del piso seleccionado
        }
    }
}
