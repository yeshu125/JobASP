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
    public partial class FindJob : System.Web.UI.Page
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
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
                }
               
            }
        }
        public void BindDDL()
        {
            try
            {
                ddlSkillSetSel.DataSource = new DDLDataBO().GetD<SkillSet>();
                ddlSkillSetSel.DataTextField = "Skill";
                ddlSkillSetSel.DataValueField = "SkillID";
                ddlSkillSetSel.DataBind();

                ddlCountrySel.DataSource = new DDLDataBO().GetD<Country>();
                ddlCountrySel.DataTextField = "CountryName";
                ddlCountrySel.DataValueField = "CountryID";
                ddlCountrySel.DataBind();

                ddlStateSel.DataSource = new DDLDataBO().GetD<State>();
                ddlStateSel.DataTextField = "StateName";
                ddlStateSel.DataValueField = "StateID";
                ddlStateSel.DataBind();

                ddlCitySel.DataSource = new DDLDataBO().GetD<City>();
                ddlCitySel.DataTextField = "CityName";
                ddlCitySel.DataValueField = "CityID";
                ddlCitySel.DataBind();
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
            }
        }
        public void bind()
        {
            BindDDL();
        }
        public void gvJobApplyBind()
        {
            try
            {
                SearchDetails objSearch = new SearchDetails();
                objSearch.lstSkill = ddlSkillSetSel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstCountry = ddlCountrySel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstState = ddlStateSel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstCity = ddlCitySel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                gvJobApply.DataSource = new AddJobBO().ListVacancy(objSearch);
                gvJobApply.DataBind();
                if (gvJobApply.PageCount > 0)
                {
                }
                else
                {
                    lblNoJob.Text = "No Records Found for your Search Query";
                }
            }
            catch (Exception)
            {

                lblErr.Text = "Something Went Wrong";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvJobApplyBind();
            #region Code
            //Search objS = new Search();

            ////if (ddlSkillSet.SelectedItem.Text != "Select")
            ////{
            //    objS.Skill = ddlSkillSet.SelectedItem.Text;
            //    if (ddlState.SelectedItem.Text != "Select")
            //    {
            //        if (ddlCity.SelectedItem.Text != "Select")
            //        {
            //            objS.Place = ddlCity.SelectedItem.Text;
            //            gvFIndJobs.DataSource = new AddJobBO().ListOfJobsbyCitySkill(objS);
            //        }
            //        else
            //        {
            //            objS.Place = ddlState.SelectedItem.Text;
            //            gvFIndJobs.DataSource = new AddJobBO().ListOfJobsbyStateSkill(objS);
            //        }
            //    }
            //    else
            //    {
            //        gvFIndJobs.DataSource = new AddJobBO().ListAllJobsSkill(objS);
            //    }
            //    gvFIndJobs.DataBind();
            //if (gvFIndJobs.PageCount > 0)
            //{
            //}
            //else
            //{
            //    lblGrid.Text = "No Records Found for your Search";
            //}
            ////}
            ////else
            ////{
            ////    if (ddlState.SelectedItem.Text != "Select")
            ////    {
            ////        if (ddlCity.SelectedItem.Text != "Select")
            ////        {
            ////            objS.Place = ddlCity.SelectedItem.Text;
            ////            gvFIndJobs.DataSource = new AddJobBO().ListOfJobsbyCity(objS);
            ////        }
            ////        else
            ////        {
            ////            objS.Place = ddlState.SelectedItem.Text;
            ////            gvFIndJobs.DataSource = new AddJobBO().ListOfJobsbyState(objS);
            ////        }
            ////    }
            ////    else
            ////    {
            ////        gvFIndJobs.DataSource = new AddJobBO().ListAllJobs(objS);
            ////    }
            ////    if (gvFIndJobs.PageCount > 0)
            ////    {
            ////        gvFIndJobs.DataBind();
            ////    }
            ////    else
            ////    {
            ////        lblGrid.Text = "No Records Found for your Search";
            ////    }
            ////}
            #endregion

        }

        //protected void gvFindJobs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    //gvFindJobs.PageIndex = e.NewPageIndex;
        //    //SearchDetails objSearch = new SearchDetails();
        //    //objSearch.Skill = ddlSkillSet.SelectedItem.Text;
        //    //objSearch.Country = ddlCountry.SelectedItem.Text;
        //    //objSearch.State = ddlState.SelectedItem.Text;
        //    //objSearch.City = ddlCity.SelectedItem.Text;
        //    //gvFindJobs.DataSource = new AddJobBO().ListVacancy(objSearch);
        //    //gvFindJobs.DataBind();

        //}
        protected void gvJobApply_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ApplyJob")
                {
                    if (Session["Valid"] != null)
                    {
                        JobApplied objApplied = new JobApplied();
                        objApplied.AppliedDate = DateTime.Now;
                        int index = Convert.ToInt32(e.CommandArgument);
                        GridViewRow row = gvJobApply.Rows[index];
                        objApplied.JobID = Convert.ToInt32(row.Cells[0].Text);
                        objApplied.SeekerID = Convert.ToInt32(Session["ID"].ToString());
                        int i = new JobAppliedBO().AddAppliedJob(objApplied);
                        if (i == 1)
                        {
                            bind();
                        }
                        else
                        {
                        }
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }

                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
            }
        }
        protected void gvJobApply_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvJobApply.PageIndex = e.NewPageIndex;
            gvJobApplyBind();
        }
    }
}