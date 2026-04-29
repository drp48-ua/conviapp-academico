<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ConviApp â€“ Inicio</title>
    <link rel="stylesheet" href="css/estilos.css" />
</head>
<body>`n    <form id="form1" runat="server">
<!-- ============================================================
     Index.aspx â€“ Capa Visual (Web Forms)
     Equivale a Views/Home/Index.cshtml en la capa MVC.
     Muestra el dashboard principal de ConviApp.
     ============================================================ -->

<header class="header">
    <div class="header-inner">
        <a href="Index.aspx" class="logo">ðŸ  ConviApp</a>
        <nav>
            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login.aspx" CssClass="btn btn-outline">Iniciar SesiÃ³n</asp:HyperLink>
            <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="Login.aspx" CssClass="btn btn-primary">Registrarse</asp:HyperLink>
        </nav>
    </div>
</header>

<main class="layout-main" style="display:flex;gap:24px;padding:32px 24px;max-width:1400px;margin:0 auto;">

    <!-- SIDEBAR IZQUIERDO -->
    <aside class="sidebar-left">
        <div class="flat-card">
            <div style="text-align:center;padding:20px 0;">
                <svg width="64" height="64" viewBox="0 0 64 64" style="border-radius:50%;background:#e0e7ff;" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="32" cy="26" r="12" fill="#818cf8"/>
                    <ellipse cx="32" cy="50" rx="20" ry="14" fill="#a5b4fc"/>
                </svg>
                <h4 style="margin:12px 0 4px;">
                    <asp:Label ID="lblUserName" runat="server" Text="Usuario" />
                </h4>
                <span class="badge" style="background:#3b82f6;color:white;padding:2px 10px;border-radius:20px;font-size:0.75rem;">
                    <asp:Label ID="lblPlan" runat="server" Text="BÃ¡sico" />
                </span>
            </div>
        </div>

        <!-- NavegaciÃ³n principal -->
        <div class="flat-card" style="margin-top:16px;">
            <nav>
                <a href="Index.aspx" class="menu-link active">ðŸ  Inicio</a>
                <a href="Pisos.aspx" class="menu-link">ðŸ¢ Mis Pisos</a>
                <a href="Gastos.aspx" class="menu-link">ðŸ’¶ Gastos</a>
                <a href="Perfil.aspx" class="menu-link">ðŸ‘¤ Perfil</a>
            </nav>
        </div>
    </aside>

    <!-- CONTENIDO CENTRAL -->
    <section style="flex:1;">
        <!-- Bienvenida -->
        <div class="flat-card" style="margin-bottom:24px;">
            <h1 style="font-size:1.6rem;">Bienvenido a ConviApp ðŸ‘‹</h1>
            <p style="color:#6b7280;margin-top:8px;">Gestiona tu piso compartido fÃ¡cilmente.</p>
        </div>

        <!-- PestaÃ±as de caracterÃ­sticas -->
        <div class="flat-card">
            <div style="display:flex;gap:8px;flex-wrap:wrap;margin-bottom:20px;">
                <asp:Button ID="btnPisos" runat="server" Text="ðŸ  Pisos" CssClass="btn btn-outline" OnClick="BtnPisos_Click" />
                <asp:Button ID="btnGastos" runat="server" Text="ðŸ’¶ Gastos" CssClass="btn btn-outline" OnClick="BtnGastos_Click" />
                <asp:Button ID="btnTareas" runat="server" Text="âœ… Tareas" CssClass="btn btn-outline" OnClick="BtnTareas_Click" />
            </div>

            <!-- Panel de resumen -->
            <asp:Panel ID="pnlResumen" runat="server" Visible="true">
                <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(160px,1fr));gap:16px;">
                    <div class="stat-card">
                        <div style="font-size:2rem;">ðŸ¢</div>
                        <div style="font-size:1.5rem;font-weight:700;">
                            <asp:Label ID="lblNumPisos" runat="server" Text="0" />
                        </div>
                        <div style="color:#6b7280;font-size:0.85rem;">Pisos activos</div>
                    </div>
                    <div class="stat-card">
                        <div style="font-size:2rem;">ðŸ’¶</div>
                        <div style="font-size:1.5rem;font-weight:700;">
                            <asp:Label ID="lblTotalGastos" runat="server" Text="0.00 â‚¬" />
                        </div>
                        <div style="color:#6b7280;font-size:0.85rem;">Gastos este mes</div>
                    </div>
                    <div class="stat-card">
                        <div style="font-size:2rem;">âœ…</div>
                        <div style="font-size:1.5rem;font-weight:700;">
                            <asp:Label ID="lblNumTareas" runat="server" Text="0" />
                        </div>
                        <div style="color:#6b7280;font-size:0.85rem;">Tareas pendientes</div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </section>

    <!-- SIDEBAR DERECHO (Anuncios) -->
    <aside class="sidebar-right" style="flex-grow:1;">
        <div class="flat-card" style="background:linear-gradient(135deg,#1e3a8a,#3b82f6);color:white;padding:0;overflow:hidden;margin-bottom:16px;">
            <img src="https://images.unsplash.com/photo-1581578731548-c64695cc6952?auto=format&fit=crop&w=300&q=80" alt="Limpieza" style="width:100%;height:120px;object-fit:cover;" />
            <div style="padding:16px;">
                <div style="font-size:0.6rem;letter-spacing:2px;opacity:0.6;margin-bottom:6px;">PUBLICIDAD</div>
                <h3 style="font-size:1rem;margin-bottom:8px;">Limpieza a domicilio</h3>
                <p style="font-size:0.8rem;color:#dbeafe;">Primera limpieza al 50%. CÃ³digo CONVI50.</p>
            </div>
        </div>
        <div style="text-align:center;margin-top:8px;">
            <a href="Login.aspx?plan=Profesional" style="font-size:0.75rem;color:#6b7280;text-decoration:underline;">ðŸ’Ž Actualizar a Pro para eliminar anuncios</a>
        </div>
    </aside>

</main>

<footer class="footer">
    <div>Â© 2025 ConviApp Â· <a href="#">TÃ©rminos</a> Â· <a href="#">Privacidad</a></div>
</footer>

    </form>`n</body>
</html>

