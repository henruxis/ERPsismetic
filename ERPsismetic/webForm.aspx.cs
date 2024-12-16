using ERPsismetic.Class.Response;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ERPsismetic.Data;

namespace ERPsismetic
{
    public partial class webForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

        #region <<funcion grid>>

        protected void rdgrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Obtener el valor de la columna 'Estado' (ajustar el índice de la columna según tu DataGrid)
                bool estado = Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "Estado"));

                // Buscar los botones dentro del ItemTemplate
                Button btnActivar = (Button)e.Item.FindControl("btnActivar");
                Button btnDesactivar = (Button)e.Item.FindControl("btnDesactivar");

                // Mostrar el botón correspondiente según el valor de 'Estado'
                if (estado)
                {
                    btnActivar.Visible = true;  // Si es True, mostrar el botón "Activar"
                    btnDesactivar.Visible = false;
                }
                else
                {
                    btnActivar.Visible = false;
                    btnDesactivar.Visible = true;  // Si es False, mostrar el botón "Desactivar"
                }
            }
        }

        #endregion



        #region <<funciones internas>>


        private void CargarUsuarios()
        {
           
            try
            {
                GeneralResponse rsp = new GeneralResponse();
                DataBaseManager db = new DataBaseManager();

                rsp = db.ConsultarUsuarios("sp_consultaUsuarios", null);

                if (Convert.ToBoolean(rsp.Success))
                {
                    DataTable dtUsuarios = (DataTable)rsp.Data;
                    rdgrid.DataSource = dtUsuarios;
                    rdgrid.DataBind();
                }

                

            }
            catch (Exception ex)
            {

            }
        }

        #endregion
    }
}