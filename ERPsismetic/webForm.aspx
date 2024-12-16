<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="webForm.aspx.cs" Inherits="ERPsismetic.webForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/bootstrap-4.6.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="bootstrap/bootstrap-4.6.2-dist/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
        .table-responsive {
        border-radius: 10px; /* Bordes redondeados */
        overflow: hidden; /* Para ocultar cualquier contenido que sobresalga */
        border: 2px solid #ddd; /* Borde alrededor del DataGrid */
        }

        .table-responsive .table {
        border-collapse: separate; /* Evita que las celdas colapsen */
        border-spacing: 0; /* Elimina el espacio entre las celdas */
        }

        .table-responsive .table th, 
        .table-responsive .table td {
        border: 1px solid #ddd; /* Borde para las celdas */
        }

        .table-responsive .table thead th {
        background-color: #f8f9fa; /* Fondo de encabezado */
        font-weight: bold;
        }

        .table-responsive .table tbody tr:nth-child(even) {
        background-color: #f2f2f2; /* Color de fondo para filas pares */
        }

        .table-responsive .table tbody tr:hover {
        background-color: #e9ecef; /* Color de fondo al pasar el ratón */
        }
    </style>


    <script type="text/javascript">

        function openPopup(id,nombre,apellido) {
            document.getElementById('popupID').innerText = id;
            document.getElementById('popupNombre').innerText = nombre;
            document.getElementById('popupApellido').innerText = apellido;

            document.getElementById('popupModal').style.display = 'block';
        }

        function closePopup() {
            // Cierra el popup y oculta el fondo oscuro
            document.getElementById('popupModal').style.display = 'none';
            document.getElementById('popupOverlay').style.display = 'none';
        }



    </script>

</head>
<body>
    <form id="form1" runat="server">
         <div class="pt-5 container">
                 <div class="row">
                      <h5 class="text-center">Registro de usuarios</h5>
                  </div>
                 <div class="pt-5 row">
                     <div class="col-md-2">
                            <button type="button" class="btn btn-secondary">Nuevo</button>
                    </div>
                </div>
                 <div class="pt-2 row">
                     <div class="col-md-12">
                        <asp:DataGrid id="rdgrid" runat="server" Width="100%" Height="300px" CssClass="table table-responsive table-striped" AutoGenerateColumns="false" OnItemDataBound="rdgrid_ItemDataBound">
                            <Columns>
                                <asp:TemplateColumn HeaderText="" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%--<button id="btnVerDetalle" class="btn btn-info" onclick="openPopup('<%# Eval("ID") %>'); return false;" />--%>
                                        <button id="btnVerDetalle" class="btn btn-info" onclick="openPopup('<%# Eval("ID") %>', '<%# Eval("Nombre") %>', '<%# Eval("Apellido") %>'); return false;">Editar</button>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn HeaderText="ID" DataField="ID" Visible="false" HeaderStyle-HorizontalAlign="Center">
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Nombre" DataField="Nombre" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="200px" HorizontalAlign="Center" Font-Bold="true"/>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Apellido" DataField="Apellido" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="200px" HorizontalAlign="Center" Font-Bold="true"/>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Edad" DataField="Edad" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="20px" HorizontalAlign="Center" Font-Bold="true"/>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Fecha Nacimiento" DataField="FechaNacimiento" DataFormatString="{0:yyyy-MM-dd}"  HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="100px" HorizontalAlign="Center" Font-Bold="true"/>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Direccion" DataField="Direccion" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="150px" HorizontalAlign="Center" Font-Bold="true"/>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Perfil" DataField="pefil" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="150px" HorizontalAlign="Center" Font-Bold="true"/>
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Cargo" DataField="Cargo" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="150px" HorizontalAlign="Center" Font-Bold="true"/>
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="Estado" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderStyle Width="20px" HorizontalAlign="Center" Font-Bold="true"/>
                                    <ItemTemplate>
                                        <asp:Button ID="btnActivar" runat="server" Text="Activo" CommandName="Activar" CssClass="btn btn-success" Enabled="false" Visible="false" />
                                        <asp:Button ID="btnDesactivar" runat="server" Text="Anulado" CommandName="Desactivar"  CssClass="btn btn-primary" Enabled="false" Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
                    </div>
                 </div>
         </div>
    </form>


    
     <div id="popupModal" style="width:500px; height:650px; display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; box-shadow: 0 0 10px rgba(0,0,0,0.5); z-index: 1000;">
        
         <div class="card">
             <div class="card-header">
                 <h5>Editar Registro</h5>
             </div>
             <div class="card-body">
                 <div class="row">
                     <div class="col-md-12">
                         <p><strong>ID:</strong> <span id="popupID"></span></p>
                        <p><strong>Nombre:</strong> <span id="popupNombre"></span></p>
                        <p><strong>Apellido:</strong> <span id="popupApellido"></span></p>
                     </div>
                 </div>
             </div>
             <div class="card-footer">
                 <div class="row">
                     <div class="col-md-12">
                         <button class="btn btn-success" onclick="closePopup()">Actualizar</button>
                         <button class="btn btn-secondary" onclick="closePopup()">Cerrar</button>
                     </div>
                 </div>

             </div>

         </div>

    </div>
    <%--<div id="popupOverlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 999;"></div>--%>

    
    
</body>
</html>
