using ERPsismetic.Class.Response;
using ERPsismetic.Class;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace ERPsismetic.Data
{
    public class DataBaseManager
    {

        private readonly string _connectionString;
        //private IConfiguration _configuration;


        public GeneralResponse ConsultarUsuarios(string sp, Hashtable parametros)
        {
            GeneralResponse respuesta = new GeneralResponse();
            DataTable dt;

            string cadenaConexion = ConfigurationManager.ConnectionStrings["DBCCadena"].ConnectionString;

            Conexion oconexion = new Conexion(cadenaConexion);
            try
            {
                DataSet ds = oconexion.EjecutarProcedimiento(sp, parametros);
                if (ds != null)
                {
                    dt = ds.Tables[0];
                    if (dt.Rows.Count == 0)
                    {
                        respuesta.Data = null;
                        respuesta.Message = "NO EXISTE REGISTROS PARA MOSTRAR";
                        respuesta.Success = 0;
                    }

                    if (dt.Rows.Count > 0)
                    {
                        respuesta.Data = dt;
                        respuesta.Message = "CONSULTA DE REGISTROS EXITOSA";
                        respuesta.Success = 1;
                    }


                }
                else
                {
                    respuesta.Message = oconexion.Mensaje_Error;
                    respuesta.Success = -1;
                }
            }
            catch (Exception ex)
            {
                respuesta.Message = ex.Message;

            }
            oconexion.Cerrarconexion();
            return respuesta;
        }


        public GeneralResponse ConsultarCombos(string sp, Hashtable parametros)
        {
            GeneralResponse respuesta = new GeneralResponse();
            DataTable dt;

            string cadenaConexion = ConfigurationManager.ConnectionStrings["DBCCadena"].ConnectionString;

            Conexion oconexion = new Conexion(cadenaConexion);
            try
            {
                DataSet ds = oconexion.EjecutarProcedimiento(sp, parametros);
                if (ds != null)
                {
                    dt = ds.Tables[0];
                    if (dt.Rows.Count == 0)
                    {
                        respuesta.Data = null;
                        respuesta.Message = "NO EXISTE REGISTROS PARA MOSTRAR";
                        respuesta.Success = 0;
                    }

                    if (dt.Rows.Count > 0)
                    {
                        respuesta.Data = dt;
                        respuesta.Message = "CONSULTA DE REGISTROS EXITOSA";
                        respuesta.Success = 1;
                    }


                }
                else
                {
                    respuesta.Message = oconexion.Mensaje_Error;
                    respuesta.Success = -1;
                }
            }
            catch (Exception ex)
            {
                respuesta.Message = ex.Message;

            }
            oconexion.Cerrarconexion();
            return respuesta;
        }

    }
}