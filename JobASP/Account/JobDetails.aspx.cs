using JobASP.DataModels;
using JobASP.Facade;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial  class JobDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Valid"] != null)
            //{
            //}
            //else
            //{
            //    Response.Redirect("Home.aspx");
            //}
            if (!IsPostBack)
            {
                try
                {
                    bind();
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }
           
        }
        public void bind()
        {
             SearchDetails objS = new SearchDetails();
                objS.EmpID = Session["ID"]!=null? Convert.ToInt32(Session["ID"].ToString()):1;
                objS.JobID =Request.QueryString["JobID"]!=null?Convert.ToInt32(Request.QueryString["JobID"]):1;
                rptJobDetails.DataSource = new AddJobBO().ListrptVacancy(objS);
                rptJobDetails.DataBind();
        }

    }
}