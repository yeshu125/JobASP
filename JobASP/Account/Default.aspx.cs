using JobASP.Facade;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bind();
            }
            catch (Exception)
            {

                lblGrid.Text = "Something Went Wrong";
            }
        }
        public void bind()
        {
            gvLatestJobs.DataSource = new AddJobBO().ListVacancy(new SearchDetails());
            gvLatestJobs.DataBind();
            if (gvLatestJobs.Rows.Count > 0)
            {
            }
            else
            {
                lblGrid.Text = "No Jobs Found";
            }
           
        }

        protected void gvLatestJobs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvLatestJobs.PageIndex = e.NewPageIndex;
                bind();
            }
            catch (Exception)
            {
                
                 lblGrid.Text = "Something Went Wrong";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            List<string> objlst = txttags.Value.Trim().Split(',').Distinct().ToList();
            objlst.RemoveAll(p => string.IsNullOrWhiteSpace(p));
            List<string> objLocation = txtLocation.Value.Trim().Split(',').Distinct().ToList();
            objLocation.RemoveAll(p => string.IsNullOrWhiteSpace(p));
            string Experience = selExperience.Items[selExperience.SelectedIndex].Text != "Experience" ? selExperience.Items[selExperience.SelectedIndex].Text : ""; ;
            string Salary = SelSalary.Items[SelSalary.SelectedIndex].Text != "Salary" ? SelSalary.Items[SelSalary.SelectedIndex].Text : "0"; ;
            gvAutoSearch.DataSource = new AddJobBO().ListAutoVacancy(objlst, objLocation, Experience, Salary);
            gvAutoSearch.DataBind();
            if (gvAutoSearch.PageCount>0)
            {
                gvAutoSearch.Visible = true;
                lblSearch.Text = "Jobs found for " + txttags.Value + " " + txtLocation.Value;
               
            }
            else
            {
                gvAutoSearch.Visible = false;
                lblSearch.Text = "No Jobs found for " + txttags.Value + " " + txtLocation.Value;
            }
        }

        [WebMethod]
        public static IDictionary<string, List<string>> getAutoCompleteData()
        {
            try
            {
                return new DDLDataBO().GetAutoCompleteData();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void gvAutoSearch_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CheckListbtn")
            {
                if (Session["Valid"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void gvLatestJobs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Apply")
            {
                if (Session["Valid"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}