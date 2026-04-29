<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gastos.aspx.cs" Inherits="Gastos" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ConviApp – Gastos del mes</title>
        <link rel="stylesheet" href="css/estilos.css" />
    </head>

    <body>
        <!-- ============================================================
     Gastos.aspx – Capa Visual (Web Forms)
     Equivale a Views/Dashboard/Gastos.cshtml en la capa MVC.
     Gestión de gastos compartidos del piso.
     ============================================================ -->

        <header class="header">
            <div class="header-inner">
                <a href="Index.aspx" class="logo">🏠 ConviApp</a>
                <nav>
                    <a href="Index.aspx" class="btn btn-outline">← Volver</a>
                </nav>
            </div>
        </header>

        <main style="max-width:1000px;margin:40px auto;padding:0 24px;">

            <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:24px;">
                <h1>💶 Gastos del mes</h1>
                <asp:Button ID="btnNuevoGasto" runat="server" Text="+ Añadir Gasto" CssClass="btn btn-primary"
                    OnClick="BtnNuevoGasto_Click" />
            </div>

            <!-- Resumen total -->
            <div class="flat-card" style="margin-bottom:24px;display:flex;gap:24px;align-items:center;">
                <div>
                    <div style="font-size:0.8rem;color:#6b7280;margin-bottom:4px;">Total del mes</div>
                    <div style="font-size:2rem;font-weight:700;">
                        <asp:Label ID="lblTotal" runat="server" Text="0.00 €" style="color:#1e3a8a;" />
                    </div>
                </div>
                <div>
                    <div style="font-size:0.8rem;color:#6b7280;margin-bottom:4px;">Por persona</div>
                    <div style="font-size:1.5rem;font-weight:600;">
                        <asp:Label ID="lblPorPersona" runat="server" Text="0.00 €" style="color:#10b981;" />
                    </div>
                </div>
            </div>

            <!-- Lista de gastos (GridView - modo desconectado) -->
            <asp:GridView ID="gvGastos" runat="server" AutoGenerateColumns="false" CssClass="table"
                EmptyDataText="No hay gastos registrados este mes." OnRowCommand="GvGastos_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Concepto">
                        <ItemTemplate>
                            <strong>
                                <%# Eval("Concepto") %>
                            </strong><br />
                            <span style="color:#6b7280;font-size:0.82rem;">
                                <%# Eval("Descripcion") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Importe">
                        <ItemTemplate>
                            <strong>
                                <%# string.Format("{0:0.00} €", Eval("Importe")) %>
                            </strong>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <%# (bool)Eval("Pagado")
                                ? "<span style='background:#d1fae5;color:#065f46;padding:3px 10px;border-radius:20px;font-size:0.8rem;'>✅ Pagado</span>"
                                : "<span style='background:#fee2e2;color:#991b1b;padding:3px 10px;border-radius:20px;font-size:0.8rem;'>⏳ Pendiente</span>"
                                %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acción">
                        <ItemTemplate>
                            <asp:LinkButton CommandName="Pagar" CommandArgument='<%# Eval("Id") %>' runat="server"
                                CssClass="btn btn-outline btn-sm" Visible='<%# !(bool)Eval("Pagado") %>'>Marcar pagado
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- Formulario nuevo gasto -->
            <asp:Panel ID="pnlFormGasto" runat="server" Visible="false" CssClass="flat-card" style="margin-top:32px;">
                <h2 style="margin-bottom:20px;">Añadir nuevo gasto</h2>
                <div style="display:grid;grid-template-columns:1fr 1fr;gap:16px;">
                    <div>
                        <label class="form-label">Concepto *</label>
                        <asp:TextBox ID="txtConcepto" runat="server" CssClass="form-input" placeholder="Factura luz" />
                    </div>
                    <div>
                        <label class="form-label">Importe (€) *</label>
                        <asp:TextBox ID="txtImporte" runat="server" CssClass="form-input" TextMode="Number"
                            placeholder="74.50" />
                    </div>
                    <div>
                        <label class="form-label">Descripción</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-input"
                            placeholder="Detalle del gasto..." />
                    </div>
                    <div>
                        <label class="form-label">Fecha</label>
                        <asp:TextBox ID="txtFecha" runat="server" CssClass="form-input" TextMode="Date" />
                    </div>
                </div>
                <div style="margin-top:16px;display:flex;gap:12px;">
                    <asp:Button ID="btnGuardarGasto" runat="server" Text="Guardar Gasto" CssClass="btn btn-primary"
                        OnClick="BtnGuardarGasto_Click" />
                    <asp:Button ID="btnCancelarGasto" runat="server" Text="Cancelar" CssClass="btn btn-outline"
                        OnClick="BtnCancelarGasto_Click" />
                </div>
            </asp:Panel>

        </main>

        <footer class="footer">
            <div>© 2025 ConviApp</div>
        </footer>

    </body>

    </html>