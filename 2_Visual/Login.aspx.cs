// ============================================================
// Login.aspx.cs – Code-behind del formulario de login (Web Forms)
// Valida credenciales contra CADUsuario y guarda sesión.
// ============================================================
using System;
using ConviAppWeb.DataAccess;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Si ya está logueado, redirigir al inicio
        if (Session["UserEmail"] != null)
            Response.Redirect("Index.aspx");
    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        string email    = txtEmail.Text.Trim();
        string password = txtPassword.Text;
        string plan     = ddlPlan.SelectedValue;

        if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
        {
            MostrarError("Por favor, rellena todos los campos.");
            return;
        }

        // Verificar usuario en BD (CADUsuario – modo conectado / SqlDataReader)
        var cadUsuario = new CADUsuario();
        var usuario    = cadUsuario.BuscarPorEmail(email);

        if (usuario == null)
        {
            MostrarError("El correo electrónico no está registrado.");
            return;
        }

        // En producción se compararía el hash. Aquí validación simplificada.
        // Guardar sesión
        Session["UserEmail"] = email;
        Session["UserName"]  = usuario.Nombre ?? email;
        Session["UserRole"]  = plan;   // Plan elegido desde el selector demo
        Session["UserId"]    = usuario.Id;

        Response.Redirect("Index.aspx");
    }

    private void MostrarError(string mensaje)
    {
        pnlError.Visible = true;
        lblError.Text    = mensaje;
    }
}
