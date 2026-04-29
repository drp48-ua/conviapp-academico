// ============================================================
// Perfil.aspx.cs – Code-behind del perfil de usuario (Web Forms)
// Actualiza datos de usuario usando CADUsuario (modo conectado).
// ============================================================
using System;
using ConviAppWeb.DataAccess;

public partial class Perfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] == null) { Response.Redirect("Login.aspx"); return; }

        if (!IsPostBack)
            CargarPerfil();
    }

    private void CargarPerfil()
    {
        txtNombre.Text  = Session["UserName"] != null ? Session["UserName"].ToString() : "";
        txtEmail.Text   = Session["UserEmail"] != null ? Session["UserEmail"].ToString() : "";
        txtFotoUrl.Text = Session["UserPhotoUrl"] != null ? Session["UserPhotoUrl"].ToString() : "";

        // Mostrar imagen si hay URL
        string fotoUrl = txtFotoUrl.Text;
        if (!string.IsNullOrEmpty(fotoUrl))
        {
            imgAvatar.ImageUrl  = fotoUrl;
            imgAvatar.Style["display"] = "block";
        }
    }

    protected void BtnGuardar_Click(object sender, EventArgs e)
    {
        string nombre  = txtNombre.Text.Trim();
        string email   = txtEmail.Text.Trim();
        string fotoUrl = txtFotoUrl.Text.Trim();

        // Actualizar sesión
        Session["UserName"]  = nombre;
        Session["UserEmail"] = email;
        if (!string.IsNullOrEmpty(fotoUrl))
            Session["UserPhotoUrl"] = fotoUrl;

        // Actualizar en BD (CADUsuario – modo conectado / SqlCommand + ExecuteNonQuery)
        int userId     = (int?)Session["UserId"] ?? 1;
        var cadUsuario = new CADUsuario();
        var usuario    = cadUsuario.LeerUsuario(userId);

        if (usuario != null)
        {
            usuario.Nombre = nombre;
            usuario.Email  = email;
            cadUsuario.ActualizarUsuario(usuario);
        }

        pnlSuccess.Visible = true;
        lblSuccess.Text    = "Perfil actualizado correctamente.";
        CargarPerfil();
    }
}
