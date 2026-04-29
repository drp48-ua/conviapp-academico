<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Perfil" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ConviApp â€“ Mi Perfil</title>
        <link rel="stylesheet" href="css/estilos.css" />
    </head>

    <body>`n    <form id="form1" runat="server">
        <!-- ============================================================
     Perfil.aspx â€“ Capa Visual (Web Forms)
     Equivale a Views/Account/Profile.cshtml en la capa MVC.
     EdiciÃ³n de perfil de usuario y cambio de contraseÃ±a.
     ============================================================ -->

        <header class="header">
            <div class="header-inner">
                <a href="Index.aspx" class="logo">ðŸ  ConviApp</a>
                <nav>
                    <a href="Index.aspx" class="btn btn-outline">â† Volver</a>
                </nav>
            </div>
        </header>

        <main style="max-width:600px;margin:40px auto;padding:0 24px;">

            <!-- Mensaje de Ã©xito -->
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
                <div
                    style="background:rgba(16,185,129,0.1);border:1px solid #10b981;color:#065f46;padding:12px;border-radius:8px;margin-bottom:24px;">
                    âœ…
                    <asp:Label ID="lblSuccess" runat="server" />
                </div>
            </asp:Panel>

            <div class="glass-card">
                <h2 style="margin-bottom:24px;color:#1e3a8a;">ðŸ‘¤ Mi Perfil</h2>

                <!-- Avatar -->
                <div style="text-align:center;margin-bottom:24px;">
                    <asp:Image ID="imgAvatar" runat="server" Width="100" Height="100"
                        Style="border-radius:50%;object-fit:cover;display:none;" />
                    <svg id="svgAvatar" width="100" height="100" viewBox="0 0 64 64"
                        style="border-radius:50%;background:#e0e7ff;" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="32" cy="26" r="12" fill="#818cf8" />
                        <ellipse cx="32" cy="50" rx="20" ry="14" fill="#a5b4fc" />
                    </svg>
                </div>

                <asp:Panel ID="pnlFormPerfil" runat="server" DefaultButton="btnGuardar">
                    <div style="display:flex;flex-direction:column;gap:20px;">

                        <div>
                            <label class="form-label">URL Foto de perfil</label>
                            <asp:TextBox ID="txtFotoUrl" runat="server" TextMode="Url" CssClass="form-input"
                                placeholder="https://ejemplo.com/mifoto.jpg" />
                        </div>

                        <div>
                            <label class="form-label">Nombre *</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-input" required="required" />
                        </div>

                        <div>
                            <label class="form-label">Correo electrÃ³nico *</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-input"
                                required="required" />
                        </div>

                        <hr style="border:0;border-top:1px solid #e5e7eb;" />
                        <h4 style="color:#374151;">Cambiar ContraseÃ±a</h4>

                        <div>
                            <label class="form-label">ContraseÃ±a Actual</label>
                            <asp:TextBox ID="txtPassActual" runat="server" TextMode="Password" CssClass="form-input" />
                        </div>
                        <div>
                            <label class="form-label">Nueva ContraseÃ±a</label>
                            <asp:TextBox ID="txtPassNueva" runat="server" TextMode="Password" CssClass="form-input" />
                        </div>
                        <div>
                            <label class="form-label">Confirmar ContraseÃ±a</label>
                            <asp:TextBox ID="txtPassConfirm" runat="server" TextMode="Password" CssClass="form-input" />
                        </div>

                        <div style="display:flex;gap:12px;margin-top:8px;">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-primary"
                                Style="flex:1;justify-content:center;" OnClick="BtnGuardar_Click" />
                            <a href="Index.aspx" class="btn btn-outline"
                                style="flex:1;justify-content:center;">Volver</a>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </main>

        <footer class="footer">
            <div>Â© 2025 ConviApp</div>
        </footer>

        </form>`n</body>

    </html>
