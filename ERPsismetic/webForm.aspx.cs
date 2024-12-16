using ERPsismetic.Class.Response;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ERPsismetic.Data;
using System.Collections;

namespace ERPsismetic
{
    public partial class webForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios(0);
                CargaCombos();
            }
        }

        #region <<funcion grid>>

        protected void rdgrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                bool estado = Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "Estado"));

                Button btnActivar = (Button)e.Item.FindControl("btnActivar");
                Button btnDesactivar = (Button)e.Item.FindControl("btnDesactivar");
                if (estado)
                {
                    btnActivar.Visible = true;
                    btnDesactivar.Visible = false;
                }
                else
                {
                    btnActivar.Visible = false;
                    btnDesactivar.Visible = true;
                }
            }
        }

        #endregion



        #region <<funciones internas>>


        private void CargarUsuarios(int ID)
        {
           
            try
            {
                GeneralResponse rsp = new GeneralResponse();
                DataBaseManager db = new DataBaseManager();

                Hashtable param = new Hashtable();
                param["ID"] = ID;
                

                rsp = db.ConsultarUsuarios("sp_consultaUsuarios", param);

                if (Convert.ToBoolean(rsp.Success))
                {
                    DataTable dtUsuarios = (DataTable)rsp.Data;
                    rdgrid.DataSource = dtUsuarios;
                    rdgrid.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error cargar usuarios:" + ex.Message);
            }
        }


        private void CargaCombos()
        {
            try
            {
                GeneralResponse rsp = new GeneralResponse();
                DataBaseManager db = new DataBaseManager();

                Hashtable param = new Hashtable();
                param["tipo"] = "Perfiles";
                

                rsp = db.ConsultarCombos("sp_consultaControles", param);

                if (Convert.ToBoolean(rsp.Success))
                {
                    DataTable dtResultado = (DataTable)rsp.Data;
                    cmb_perfilEdit.DataSource = dtResultado;
                    cmb_perfilEdit.DataBind();

                    cmb_perfil.DataSource = dtResultado;
                    cmb_perfil.DataBind();
                }


                param = new Hashtable();
                param["tipo"] = "Estados";

                rsp = db.ConsultarCombos("sp_consultaControles", param);

                if (Convert.ToBoolean(rsp.Success))
                {
                    DataTable dtResultado = (DataTable)rsp.Data;
                    cmb_estadoEdit.DataSource = dtResultado;
                    cmb_estadoEdit.DataBind();

                    cmb_Estado.DataSource = dtResultado;
                    cmb_Estado.DataBind();

                }
                



            }
            catch (Exception ex)
            {
                throw new Exception("Error cargar controles:" + ex.Message);
            }

        }


        private void CargaCargosByID(int idPerfil)
        {
            try
            {
                GeneralResponse rsp = new GeneralResponse();
                DataBaseManager db = new DataBaseManager();

                Hashtable param = new Hashtable();
                param["tipo"] = "CargoByIDPerfil";
                param["@idPerfil"] = idPerfil;

                rsp = db.ConsultarCombos("sp_consultaControles", param);

                if (Convert.ToBoolean(rsp.Success))
                {
                    DataTable dtCargos = (DataTable)rsp.Data;
                    cmb_Cargo.DataSource = dtCargos;
                    cmb_Cargo.DataBind();

                    cmb_cargoEdit.DataSource = dtCargos;
                    cmb_cargoEdit.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error cargar Cargos:" + ex.Message);
            }

        }



        #endregion

        protected void cmb_perfilEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_perfilEdit.SelectedValue != String.Empty)
                {

                    String _valor = cmb_perfilEdit.SelectedValue;

                    CargaCargosByID(Convert.ToInt32(_valor));
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error cargar Cargos:" + ex.Message);
            }
        }

        protected void cmb_perfil_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (cmb_perfil.SelectedValue != String.Empty)
                {

                    String _valor = cmb_perfil.SelectedValue;

                    CargaCargosByID(Convert.ToInt32(_valor));
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error cargar Cargos:" + ex.Message);
            }
        }
    }
}