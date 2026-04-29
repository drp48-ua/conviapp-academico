<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pisos.aspx.cs" Inherits="Pisos" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ConviApp â€“ Pisos</title>
        <link rel="stylesheet" href="css/estilos.css" />
    </head>

    <body>`n    <form id="form1" runat="server">
        <!-- ============================================================
     Pisos.aspx â€“ Capa Visual (Web Forms)
     Equivale a Views/Home/Pisos.cshtml + Views/Dashboard/MisPisos.cshtml
     Muestra el listado de pisos disponibles y los propios.
     ============================================================ -->

        <header class="header">
            <div class="header-inner">
                <a href="Index.aspx" class="logo">ðŸ  ConviApp</a>
                <nav>
                    <a href="Index.aspx" class="btn btn-outline">â† Volver</a>
                </nav>
            </div>
        </header>

        <main style="max-width:1100px;margin:40px auto;padding:0 24px;">

            <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:24px;">
                <h1>ðŸ¢ Mis Pisos</h1>
                <asp:Button ID="btnNuevoPiso" runat="server" Text="+ AÃ±adir Piso" CssClass="btn btn-primary"
                    OnClick="BtnNuevoPiso_Click" />
            </div>

            <!-- Lista de pisos (GridView - modo desconectado) -->
            <asp:GridView ID="gvPisos" runat="server" AutoGenerateColumns="false" CssClass="table"
                EmptyDataText="No tienes pisos registrados. Â¡AÃ±ade el primero!" OnRowCommand="GvPisos_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Piso">
                        <ItemTemplate>
                            <div style="display:flex;gap:16px;align-items:center;">
                                <img src="https://images.unsplash.com/photo-1560518883-ce09059eeffa?auto=format&fit=crop&w=120&q=70"
                                    alt="Foto piso"
                                    style="width:80px;height:60px;object-fit:cover;border-radius:8px;" />
                                <div>
                                    <strong>
                                        <%# Eval("Direccion") %>
                                    </strong><br />
                                    <span style="color:#6b7280;font-size:0.85rem;">
                                        <%# Eval("Ciudad") %>, <%# Eval("CodigoPostal") %>
                                    </span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Habitaciones">
                        <ItemTemplate>
                            <span>
                                <%# Eval("NumeroHabitaciones") %> hab. / <%# Eval("NumeroBanos") %> baÃ±o(s)
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio">
                        <ItemTemplate>
                            <strong>
                                <%# string.Format("{0:0.00} â‚¬", Eval("PrecioTotal")) %>
                            </strong><br />
                            <span style="font-size:0.8rem;color:#6b7280;">/mes</span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <%# (bool)Eval("Disponible")
                                ? "<span style='background:#d1fae5;color:#065f46;padding:4px 12px;border-radius:20px;font-size:0.8rem;'>Disponible</span>"
                                : "<span style='background:#fee2e2;color:#991b1b;padding:4px 12px;border-radius:20px;font-size:0.8rem;'>Ocupado</span>"
                                %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" CommandName="Editar"
                                CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-outline btn-sm">âœï¸ Editar
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- Formulario de nuevo piso -->
            <asp:Panel ID="pnlFormPiso" runat="server" Visible="false" CssClass="flat-card" style="margin-top:32px;">
                <h2 style="margin-bottom:20px;">AÃ±adir nuevo piso</h2>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px;">
                    <div>
                        <label class="form-label">DirecciÃ³n *</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-input"
                            placeholder="Calle Ejemplo, 10" />
                    </div>
                    <div>
                        <label class="form-label">Ciudad *</label>
                        <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-input" placeholder="Alicante" />
                    </div>
                    <div>
                        <label class="form-label">CÃ³digo Postal</label>
                        <asp:TextBox ID="txtCodPostal" runat="server" CssClass="form-input" placeholder="03001" />
                    </div>
                    <div>
                        <label class="form-label">Precio mensual (â‚¬)</label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-input" TextMode="Number"
                            placeholder="750" />
                    </div>
                    <div>
                        <label class="form-label">Habitaciones</label>
                        <asp:TextBox ID="txtHabitaciones" runat="server" CssClass="form-input" TextMode="Number"
                            placeholder="3" />
                    </div>
                    <div>
                        <label class="form-label">BaÃ±os</label>
                        <asp:TextBox ID="txtBanos" runat="server" CssClass="form-input" TextMode="Number"
                            placeholder="1" />
                    </div>
                </div>
                <div style="margin-top:16px;display:flex;gap:12px;">
                    <asp:Button ID="btnGuardarPiso" runat="server" Text="Guardar Piso" CssClass="btn btn-primary"
                        OnClick="BtnGuardarPiso_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-outline"
                        OnClick="BtnCancelar_Click" />
                </div>
            </asp:Panel>

        </main>

        <footer class="footer">
            <div>Â© 2025 ConviApp</div>
        </footer>

        </form>`n</body>

    </html>
