using JobASP.Facade;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP.Account
{
    public partial class CompanyProfileS : System.Web.UI.Page
    {
        string ComName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Page.Request.QueryString["ComName"]))
                {
                    ComName = Page.Request.QueryString["ComName"];
                    RepeaterActive.DataSource = new DDLDataBO().getCompany(ComName);
                    RepeaterActive.DataBind();
                    if (RepeaterActive.Items.Count > 0)
                    {
                        lblRepeaterActive.Visible = false;
                        lblRepeaterActive.Text = "";
                        RepeaterActive.Visible = true;
                    }
                    else
                    {
                        lblRepeaterActive.Visible = true;
                        lblRepeaterActive.Text = "No Data Found";
                        RepeaterActive.Visible = false;
                    }
                    rptCompanyJobList.DataSource = new AddJobBO().ListVacancy(new SearchDetails { Company = ComName });
                    rptCompanyJobList.DataBind();
                    if (rptCompanyJobList.Items.Count > 0)
                    {
                        lblrptCompanyJobList.Visible = false;
                        lblrptCompanyJobList.Text = "";
                        rptCompanyJobList.Visible = true;
                    }
                    else
                    {
                        lblrptCompanyJobList.Visible = true;
                        lblrptCompanyJobList.Text = "No Data Found";
                        rptCompanyJobList.Visible = false;
                    }
                }
            }
        }

        protected void btnCompanySearch_Click(object sender, EventArgs e)
        {
            bind();
        }
        [WebMethod]
        public static string[] GetAutoData()
        {
            try
            {
                return new CompanyProfileS().GetDataAuto().ToArray();
            }
            catch (Exception)
            {
                
                throw;
            }
           
        }
        protected List<string> GetDataAuto()
        {
            return new DDLDataBO().GetCompanies();
        }
        public void bind()
        {
            RepeaterActive.DataSource = new DDLDataBO().getCompany(txtSearch.Text);
            RepeaterActive.DataBind();
           

        }
        protected void LVCompany_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            //(LVCompany.FindControl("DataPager") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            //this.bind();
        }
    }
}