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
    public partial class JobDetailsMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            objS.JobID = Request.QueryString["JobID"] != null ? Convert.ToInt32(Request.QueryString["JobID"]) : 1;
            rptJobDetails.DataSource = new AddJobBO().ListrptVacancy(objS);
            rptJobDetails.DataBind();
        }
    }
}