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

        function openPopup(id, nombre, apellido, estado,perfil,cargo) {
            let valorNumerico = estado ? 1 : 0;
            document.getElementById('popupID').value = id;
            document.getElementById('popupNombre').value = nombre;
            document.getElementById('popupApellido').value = apellido;

            document.getElementById("cmb_perfilEdit").value = perfil;
            document.getElementById("cmb_estadoEdit").value = valorNumerico;
            document.getElementById('popupModal').style.display = 'block';
        }

        function closePopup() {
            // Cierra el popup y oculta el fondo oscuro
            document.getElementById('popupModal').style.display = 'none';
            //document.getElementById('popupOverlay').style.display = 'none';
        }

        function nuevoPopup() {
            document.getElementById('popupModalNew').style.display = 'block';
        }

        function closePopupNuevo() {
            document.getElementById('popupModalNew').style.display = 'none';
        }

        function actualizaRegistro() {
            var _id = document.getElementById('popupID').innerText;
            var _estado = document.getElementById("cmb_estadoEdit").value;
            //document.getElementById('popupID').innerText = id;
            //document.getElementById('popupNombre').innerText = nombre;
            //document.getElementById('popupApellido').innerText = apellido;

        }


    </script>

</head>
<body>
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scripManager1" runat="server"></asp:ScriptManager>
         <div class="pt-5 container">
                 <div class="row">
                      <h5 class="text-center">Registro de usuarios</h5>
                  </div>
                 <div class="pt-5 row">
                     <div class="col-md-2">
                            <button type="button" class="btn btn-secondary" onclick="nuevoPopup();">Nuevo</button>
                    </div>
                </div>
                 <div class="pt-2 row">
                     <div class="col-md-12">
                        <asp:DataGrid id="rdgrid" runat="server" Width="100%" Height="300px" CssClass="table table-responsive table-striped" AutoGenerateColumns="false" OnItemDataBound="rdgrid_ItemDataBound">
                            <Columns>
                                <asp:TemplateColumn HeaderText="" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <button id="btnVerDetalle" class="btn btn-info" onclick="openPopup('<%# Eval("ID") %>', '<%# Eval("Nombre") %>', '<%# Eval("Apellido") %>', '<%# Eval("Estado") %>', '<%# Eval("Id_perfil") %>', '<%# Eval("Id_cargo") %>'); return false;">Editar</button>
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
                                <asp:BoundColumn HeaderText="Perfil" DataField="Id_perfil" HeaderStyle-HorizontalAlign="Center" Visible="false">
                                </asp:BoundColumn>
                                <asp:BoundColumn HeaderText="Cargo" DataField="Id_cargo" HeaderStyle-HorizontalAlign="Center" Visible="false">
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


            
        <div id="popupModal" runat="server" style="width:500px; height:650px; display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; box-shadow: 0 0 10px rgba(0,0,0,0.5); z-index: 1000;">
            <asp:UpdatePanel ClientIDMode="Static" ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="card">
         <div class="card-header">
             <h5>Editar Registro</h5>
         </div>
         <div class="card-body">
             <div class="row">
                 <div class="col-md-12">
                     <p><strong>ID:</strong><asp:TextBox ID="popupID" runat="server" CssClass="form-control" Enabled="false" BorderStyle="None"></asp:TextBox></p>
                    <p><strong>Nombre:</strong><asp:TextBox ID="popupNombre" runat="server" CssClass="form-control" Enabled="false" BorderStyle="None"></asp:TextBox></p>
                    <p><strong>Apellido:</strong> <asp:TextBox ID="popupApellido" runat="server" CssClass="form-control" Enabled="false" BorderStyle="None"></asp:TextBox></p>
                    <p><strong>Perfil:</strong><asp:DropDownList ID="cmb_perfilEdit" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" runat="server"  DataTextField="Descripcion" DataValueField="Codigo" OnSelectedIndexChanged="cmb_perfilEdit_SelectedIndexChanged"></asp:DropDownList> </p>
                     <p><strong>Cargo:</strong><asp:DropDownList ID="cmb_cargoEdit" CssClass="form-control" AutoPostBack="false" runat="server" DataTextField="Descripcion" DataValueField="Codigo"></asp:DropDownList> </p>
                     <p><strong>Estado:</strong><asp:DropDownList ID="cmb_estadoEdit" CssClass="form-control" AutoPostBack="false" runat="server" DataTextField="Descripcion" DataValueField="Codigo"></asp:DropDownList> </p>
                 </div>
             </div>
         </div>
         <div class="card-footer">
             <div class="row">
                 <div class="col-md-12">
                     <button class="btn btn-success" onclick="actualizaRegistro()">Actualizar</button>
                     <button class="btn btn-secondary" onclick="closePopup()">Cerrar</button>
                 </div>
             </div>
         </div>

     </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>


     <div id="popupModalNew" runat="server" style="width:500px; height:850px; display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; box-shadow: 0 0 10px rgba(0,0,0,0.5); z-index: 1000;">
       <asp:UpdatePanel ClientIDMode="Static" ID="UpdatePanel2" runat="server">
       <ContentTemplate>
           <div class="card">
    <div class="card-header">
        <h5>Nuevo Registro</h5>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <p><strong>Nombre:</strong><asp:TextBox ID="txt_Nombre" runat="server" CssClass="form-control"></asp:TextBox> </p>
                <p><strong>Apellido:</strong><asp:TextBox ID="txt_apellido" runat="server" CssClass="form-control"></asp:TextBox></p>
                <p><strong>Edad:</strong><asp:TextBox ID="txt_edad" runat="server" CssClass="form-control"></asp:TextBox></p>
                <p><strong>Fecha nacimiento:</strong><asp:TextBox ID="txt_fecNac" runat="server" CssClass="form-control"></asp:TextBox></p>
                <p><strong>Direccion:</strong><asp:TextBox ID="txt_direccion" runat="server" CssClass="form-control"></asp:TextBox></p>
                <p><strong>Perfil:</strong><asp:DropDownList ID="cmb_perfil" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" runat="server"  DataTextField="Descripcion" DataValueField="Codigo" OnSelectedIndexChanged="cmb_perfil_SelectedIndexChanged"></asp:DropDownList> </p>
                <p><strong>Cargo:</strong><asp:DropDownList ID="cmb_Cargo" CssClass="form-control" AutoPostBack="false" runat="server" DataTextField="Descripcion" DataValueField="Codigo"></asp:DropDownList> </p>
                <p><strong>Estado:</strong><asp:DropDownList ID="cmb_Estado" CssClass="form-control" AutoPostBack="false" runat="server" DataTextField="Descripcion" DataValueField="Codigo"></asp:DropDownList> </p>
            </div>
        </div>
    </div>
    <div class="card-footer">
        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-success" onclick="actualizaRegistro()">Registrar</button>
                <button class="btn btn-secondary" onclick="closePopupNuevo()">Cerrar</button>
            </div>
        </div>
    </div>

</div>
       </ContentTemplate>
   </asp:UpdatePanel>
   </div>

    </form>

    

    

       
    <%--<div id="popupOverlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 999;"></div>--%>
    
</body>
</html>
