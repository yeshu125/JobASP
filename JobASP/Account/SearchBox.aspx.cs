using JobASP.Facade;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class SearchBox : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["JobASPContext"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //DataSet ds = getData();
                    //List<string> EmailList = new List<string>();
                    //foreach (DataRow DR in ds.Tables[0].Rows)
                    //{
                    //    EmailList.Add(DR["skill"].ToString());
                    //}
                    //ddlAll1.DataSource = EmailList;
                    //ddlAll1.DataBind();
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }
        }
        public DataSet getData()
        {
            try
            {
                DataSet ds = new DataSet();
                conn.Open();
                SqlCommand cmd = new SqlCommand("usp_GetAutoDataView", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                conn.Close();
                return ds;
            }
            catch (Exception)
            {
                
                throw;
            }
          
        }
        [WebMethod]
        public static IDictionary<string,List<string>> getAutoCompleteData()
        {
            try
            {
                             //DataSet ds = new SearchBox().getData();
                //conn.Open();
                //SqlCommand cmd = new SqlCommand("usp_GetAutoData", conn);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.ExecuteNonQuery();
                //SqlDataAdapter adp = new SqlDataAdapter(cmd);
                //adp.Fill(ds);
                //conn.Close();
                //List<Dictionary<string, string>> lstDicData = new List<Dictionary<string, string>>();
                                //Dictionary<string,string> DicData=new Dictionary<string,string>();
                                //List<string> lstData = new List<string>();
               
                                //foreach (DataRow DR in ds.Tables[0].Rows)
                                //{
                    
                                //    lstData.Add(DR["Data"].ToString());
                                //        DicData.Add(DR["Data"].ToString(), DR["Category"].ToString());
                                //}
              //return new JavaScriptSerializer().Serialize(DicData);
                return new DDLDataBO().GetAutoCompleteData();
                //string[] dataArray = lstData.ToArray<string>();
                //return lstData.ToArray();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
        }
    }
}