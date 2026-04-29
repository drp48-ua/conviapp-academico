<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ConviApp â€“ Iniciar SesiÃ³n</title>
        <link rel="stylesheet" href="css/estilos.css" />
    </head>

    <body>`n    <form id="form1" runat="server">
        <!-- ============================================================
     Login.aspx â€“ Capa Visual (Web Forms)
     Equivale a Views/Account/Login.cshtml en la capa MVC.
     Formulario de autenticaciÃ³n de usuarios.
     ============================================================ -->

        <header class="header">
            <div class="header-inner">
                <a href="Index.aspx" class="logo">ðŸ  ConviApp</a>
            </div>
        </header>

        <main
            style="min-height:calc(100vh - 140px);display:flex;align-items:center;justify-content:center;padding:40px 24px;">
            <div style="width:100%;max-width:420px;">

                <div style="text-align:center;margin-bottom:32px;">
                    <h1 style="font-size:2rem;margin-bottom:8px;">Bienvenido de vuelta ðŸ‘‹</h1>
                    <p style="color:#6b7280;">Ingresa al Sandbox de ConviApp</p>
                </div>

                <!-- Mensaje de error -->
                <asp:Panel ID="pnlError" runat="server" Visible="false">
                    <div class="alert-error" style="margin-bottom:16px;">
                        âš ï¸
                        <asp:Label ID="lblError" runat="server" />
                    </div>
                </asp:Panel>

                <!-- Formulario de login -->
                <asp:Panel ID="pnlForm" runat="server" CssClass="glass-card" DefaultButton="btnLogin">
                    <div style="display:flex;flex-direction:column;gap:20px;">

                        <div>
                            <label class="form-label">Correo ElectrÃ³nico</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-input"
                                placeholder="dani@conviapp.com" required="required" />
                        </div>

                        <div>
                            <label class="form-label">ContraseÃ±a</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input"
                                placeholder="â€¢â€¢â€¢â€¢" required="required" />
                        </div>

                        <div>
                            <label class="form-label">Plan de cuenta (demo)</label>
                            <asp:DropDownList ID="ddlPlan" runat="server" CssClass="form-input"
                                style="width:100%;padding:10px;">
                                <asp:ListItem Value="Basico" Text="ðŸ“¦ Basic (gratuito)" />
                                <asp:ListItem Value="Profesional" Text="â­ Pro (4.99â‚¬/mes)" />
                                <asp:ListItem Value="Enterprise" Text="ðŸ¢ Enterprise (19.99â‚¬/mes)" />
                            </asp:DropDownList>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="Iniciar SesiÃ³n â†’" CssClass="btn btn-primary"
                            Style="justify-content:center;padding:14px;" OnClick="BtnLogin_Click" />
                    </div>
                </asp:Panel>

                <!-- Cuentas demo -->
                <div class="glass-card" style="margin-top:16px;font-size:0.85rem;color:#6b7280;">
                    <div style="font-weight:600;color:#374151;margin-bottom:10px;">ðŸ”‘ Cuentas demo (contraseÃ±a: <code
                            style="color:#3b82f6;">1234</code>)</div>
                    <div style="display:flex;flex-direction:column;gap:6px;">
                        <div>ðŸ¢ <strong>Enterprise:</strong> dani@conviapp.com</div>
                        <div>â­ <strong>Pro:</strong> lidia@conviapp.com</div>
                        <div>ðŸ“¦ <strong>Basic:</strong> marina@conviapp.com</div>
                    </div>
                </div>

                <div style="text-align:center;margin-top:16px;font-size:0.9rem;">
                    Â¿No tienes cuenta? <a href="Registro.aspx" style="color:#3b82f6;">RegÃ­strate</a>
                </div>
            </div>
        </main>

        <footer class="footer">
            <div>Â© 2025 ConviApp</div>
        </footer>

        </form>`n</body>

    </html>
