using JobASP.DataLayer;
using JobASP.DataModels;
using JobASP.Facade;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class ProfileSeeker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Valid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["Valid"].ToString() == "Seeker")
            {
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                Bind();
            }
        }
        public void Bind()
        {
            try
            {
                // BindCountry();
                AppliedBind();
                BindSkillSet();
            }
            catch (Exception)
            {

                lblProSeeker.Text = "Something went wrong";
            }

        }
        public void BindSkillSet()
        {
            try
            {
                ddlSkillSetSel.DataSource = new DDLDataBO().GetD<SkillSet>();
                ddlSkillSetSel.DataTextField = "Skill";
                ddlSkillSetSel.DataValueField = "SkillID";
                ddlSkillSetSel.DataBind();
                // ddlSkillSetSel.Items.Insert(0, "Select");
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

                lblProSeeker.Text = "Something went wrong";
            }
        }
        public void AppliedBind()
        {
            try
            {
                SearchDetails objDetails = new SearchDetails();
                objDetails.ID = Convert.ToInt32(Session["ID"].ToString());
                gvAppliedJobs.DataSource = new JobAppliedBO().ListApplied(objDetails);
                gvAppliedJobs.DataBind();
            }
            catch (Exception)
            {

                lblProSeeker.Text = "Something Went Wrong";
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuSeekerResume.HasFile)
            {
                //byte[] imageBytes = new byte[fuSeekerResume.PostedFile.InputStream.Length + 1];
                // fuSeekerResume.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);
                Seeker objSeeker = new Seeker();
                string filename = Path.GetFileName(fuSeekerResume.PostedFile.FileName);
                string FName = Session["ID"].ToString() + filename;
                fuSeekerResume.SaveAs(Server.MapPath("~/PDF_Files/" + FName));
                objSeeker.Resume = "~/PDF_Files/" + FName;
                objSeeker.SeekerID = Convert.ToInt32(Session["ID"].ToString());
                int i = new RegisterBO().UpdateSeeker(objSeeker);
                if (i == 1)
                {
                    lblErr.Text = "Update Successful";
                }
                else { lblErr.Text = "updation failed"; }

            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            string url = "ResumeViewer.aspx?ID=" + Session["ID"].ToString();
            string s = "window.open('" + url + "', 'popup_window', 'width=800,height=500,left=100,top=100,resizable=yes,toolbar=yes');";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "script", s, true);
        }
        //public void BindCountry()
        //{
        //    ddlProSCountry.DataSource = new DDLDataBO().GetCountries();
        //    ddlProSCountry.DataTextField = "CountryName";
        //    ddlProSCountry.DataValueField = "CountryID";
        //    ddlProSCountry.DataBind();
        //    ddlProSCountry.Items.Insert(0, "Select");
        //    #region Using
        //    //using (DataLayer.JobASPContext context = new DataLayer.JobASPContext())
        //    //{
        //    //    ddlCountry.DataSource = context.Countries.ToList();
        //    //    ddlCountry.DataTextField = "CountryName";
        //    //    ddlCountry.DataValueField = "CountryID";
        //    //    ddlCountry.DataBind();
        //    //    ddlCountry.Items.Insert(0,"Select");
        //    //}
        //    #endregion
        //}
        //public void BindState()
        //{
        //    try
        //    {
        //        if (ddlProSCountry.SelectedItem.Text != "Select")
        //        {
        //            int Val = Convert.ToInt32(ddlProSCountry.SelectedValue);
        //            ddlProSState.DataSource = new DDLDataBO().GetStates(Val);
        //            ddlProSState.DataTextField = "StateName";
        //            ddlProSState.DataValueField = "StateID";
        //            ddlProSState.DataBind();
        //            ddlProSState.Items.Insert(0, "Select");
        //        }
        //        else
        //        {
        //            ddlProSState.Items.Clear();
        //            ddlProSCity.Items.Clear();
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        lblProSeeker.Text = "Something went wrong";
        //    }
        //    #region Using
        //    //using (DataLayer.JobASPContext context = new DataLayer.JobASPContext())
        //    //{
        //    //    if (ddlCountry.SelectedItem.Text != "Select")
        //    //    {
        //    //        int Val = Convert.ToInt32(ddlCountry.SelectedValue);
        //    //        ddlState.DataSource = context.States.Where(c => c.CountryID == Val).ToList();
        //    //        ddlState.DataTextField = "StateName";
        //    //        ddlState.DataValueField = "StateID";
        //    //        ddlState.DataBind();
        //    //        ddlState.Items.Insert(0, "Select");
        //    //    }
        //    //    else
        //    //    {
        //    //        ddlState.Items.Clear();
        //    //        ddlCity.Items.Clear();
        //    //    }
        //    //}
        //    #endregion
        //}
        //public void BindCity()
        //{
        //    try
        //    {
        //        if (ddlProSState.SelectedItem.Text != "Select")
        //        {
        //            int Val = Convert.ToInt32(ddlProSState.SelectedValue);
        //            ddlProSCity.DataSource = new DDLDataBO().GetCities(Val);
        //            ddlProSCity.DataTextField = "CityName";
        //            ddlProSCity.DataValueField = "CityID";
        //            ddlProSCity.DataBind();
        //            ddlProSCity.Items.Insert(0, "Select");
        //        }
        //        else
        //        {
        //            ddlProSCity.Items.Clear();
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        lblProSeeker.Text = "Something went wrong";
        //    }
        //    #region Using
        //    //using (DataLayer.JobASPContext context = new DataLayer.JobASPContext())
        //    //{
        //    //    if (ddlState.SelectedItem.Text!="Select")
        //    //    {
        //    //        int Val = Convert.ToInt32(ddlState.SelectedValue);
        //    //        ddlCity.DataSource = context.Cities.Where(c => c.StateID == Val).ToList();
        //    //        ddlCity.DataTextField = "CityName";
        //    //        ddlCity.DataValueField = "CityID";
        //    //        ddlCity.DataBind();
        //    //        ddlCity.Items.Insert(0, "Select");
        //    //    }
        //    //    else
        //    //    {
        //    //        ddlCity.Items.Clear();
        //    //    }
        //    //}
        //    #endregion
        //}
        public void bind()
        {
            try
            {
                int ID = Convert.ToInt32(Session["ID"].ToString());
                SearchDetails objSearch = new SearchDetails();
                objSearch.ID = ID;
                objSearch.lstSkill = ddlSkillSetSel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstCountry = ddlCountrySel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstState = ddlStateSel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstCity = ddlCitySel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                gvJobApply.DataSource = new AddJobBO().ListVacancy(objSearch);
                #region Code
                //Search objs = new Search();
                //objs.ID = ID;
                //objs.Skill = ddlProSSkill.SelectedItem.Text;
                //if (ddlState.SelectedItem.Text != "Select")
                //{
                //    if (ddlCity.SelectedItem.Text != "Select")
                //    {
                //        objs.Place = ddlCity.SelectedItem.Text;
                //        gvJobApply.DataSource = new AddJobBO().ListOfJobsbyCitySkill(objs);
                //    }
                //    else
                //    {
                //        objs.Place = ddlState.SelectedItem.Text;
                //        gvJobApply.DataSource = new AddJobBO().ListOfJobsbyStateSkill(objs);
                //    }
                //}
                //else
                //{
                //    gvJobApply.DataSource = new AddJobBO().ListAllJobsSkill(objs);
                //}
                #endregion
                gvJobApply.DataBind();
                if (gvJobApply.PageCount > 0)
                {
                    lblNoJob.Text = "Jobs For your Search";
                    btngvApply.Visible = true;
                }
                else
                {
                    lblNoJob.Text = "No jobs Found for your Search";
                    btngvApply.Visible = false;
                }
                #region Using
                //using (JobASPContext context = new JobASPContext())
                //{
                //int SeekerID = Convert.ToInt32(Session["ID"].ToString());
                //List<Vacancy> ObjList = context.Vacancies.ToList();
                //var objList2 = context.JobApplies.Where(c => c.SeekerID == SeekerID).ToList();
                //gvJobApply.DataSource = context.Vacancies.ToList();
                //gvJobApply.DataBind();
                //gvAppliedJobs.DataSource = context.JobApplies.Where(c => c.SeekerID == SeekerID).ToList();
                //gvAppliedJobs.DataBind();
                #region Prac
                // gvJobApply.DataSource = context.Vacancies.Join(objList2, b => b.JobID, c => c.JobID, (b, c) => b.JobID != c.JobID).Skip(3);
                // gvJobApply.DataSource = context.Vacancies.Join(context.JobApplies.Where(c => c.SeekerID == SeekerID), b => b.JobID, c => c.JobID, (b, c) => b).ToList();
                //gvJobApply.DataSource=from j in context.Vacancies 
                //                      join  aj in aj.JobID !=j.JobID
                //                      on where aj.SeekerID ==  SeekerID;
                //var exceptionList = context.JobApplies.Where(c=>c.SeekerID == SeekerID)
                //                                 .Select(e=>e);
                //var query = context.Vacancies
                //                      .Select(e => e)
                //                      .Where(e => !exceptionList.Contains(e.JobID));
                //var query = from w in context.Vacancies
                //              join c in context.JobApplies
                //              on w.JobID  equals  c.JobID
                //              where 
                //              select w;
                //gvJobApply.DataSource = query1.ToList();
                #endregion
                //}
                #endregion

            }
            catch (Exception)
            {
                lblProSeeker.Text = "Something Went Wrong";
            }
        }
        protected void gvJobApply_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "ApplyJob")
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
                        lblProSeeker.Text = "Job applied Successfully";
                        bind();
                    }
                    else
                    {
                        lblProSeeker.Text = "you have already applied this job";
                    }

                }
            }
            catch (Exception)
            {
                lblProSeeker.Text = "Something Went Wrong";
            }
        }
        protected void btnProSSearch_Click(object sender, EventArgs e)
        {
            try
            {
                bind();
            }
            catch (Exception)
            {
                lblProSeeker.Text = "Something Went Wrong";
            }

        }
        //protected void ddlProSCountry_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        BindState();
        //    }
        //    catch (Exception)
        //    {
        //        lblProSeeker.Text = "Something Went Wrong";
        //    }

        //}
        //protected void ddlProSState_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        BindCity();
        //    }
        //    catch (Exception)
        //    {
        //        lblProSeeker.Text = "Something Went Wrong";
        //    }

        //}
        protected void gvAppliedJobs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvAppliedJobs.PageIndex = e.NewPageIndex;
                AppliedBind();
            }
            catch (Exception)
            {

                lblProSeeker.Text = "Something Went Wrong";
            }
        }
        protected void gvJobApply_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvJobApply.PageIndex = e.NewPageIndex;
                bind();
            }
            catch (Exception)
            {
                lblProSeeker.Text = "Something Went Wrong";
            }

        }

        protected void btngvApply_Click(object sender, EventArgs e)
        {
            int res = 0;
            foreach (GridViewRow row in gvJobApply.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkgvjobApply") as CheckBox);
                    if (chkRow.Checked)
                    {
                        JobApplied objApplied = new JobApplied();
                        objApplied.AppliedDate = DateTime.Now;
                        objApplied.JobID = Convert.ToInt32(row.Cells[1].Text);
                        objApplied.SeekerID = Convert.ToInt32(Session["ID"].ToString());
                        int i = new JobAppliedBO().AddAppliedJob(objApplied);
                        if (i == 1)
                        {
                            res++;
                        }

                    }
                }
            }
            if (res > 0)
            {
                if (res > 1)
                {
                    lblProSeeker.Text = "Job applied Successfully";
                }
                else
                {
                    if (res > 2)
                    {
                        lblProSeeker.Text = "Job's applied Successfully";
                    }
                }
            }
            bind();
            AppliedBind();
        }
    }
}