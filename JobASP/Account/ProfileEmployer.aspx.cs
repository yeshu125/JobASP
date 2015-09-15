using JobASP.DataLayer;
using JobASP.DataModels;
using JobASP.Facade;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.ServiceProcess;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Runtime.Remoting.Contexts;
namespace JobASP
{
    public partial class ProfileEmployer : System.Web.UI.Page
    {
        public static int Id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Valid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["Valid"].ToString() == "Employer")
            {
                Id = Convert.ToInt32(Session["ID"].ToString());
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                ajaxCalLastDate.StartDate = DateTime.Now.Date;
                ajaxCalLastDate.EndDate = DateTime.Now.AddMonths(2);
                bind();
                BindSkillSet();
                bindJobVenue();
                //StopStartRunService();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                Vacancy objVacancy = new Vacancy();
                objVacancy.JobPosition = txtJobPosition.Text;
                objVacancy.PostedDate = DateTime.Now;
                objVacancy.LastDate = Convert.ToDateTime(txtCalender.Text);
                objVacancy.Country = Convert.ToInt32(ddlCountry.SelectedItem.Value);
                objVacancy.State = Convert.ToInt32(ddlState.SelectedItem.Value);
                objVacancy.City = Convert.ToInt32(ddlCity.SelectedItem.Value);
                objVacancy.Skill = Convert.ToInt32(ddlSkillSet.SelectedItem.Value);
                objVacancy.EmpId = Convert.ToInt32(Session["ID"].ToString());
                objVacancy.Qualification = txtJobQualification.Text;
                objVacancy.VenueAddress = "";
                objVacancy.OtherSkills = txtOtherSkills.Text;
                objVacancy.CompanyName = txtCompanyName.Text;
                objVacancy.Experience = ddlExperienceSel.Items[ddlExperienceSel.SelectedIndex].Value;
                objVacancy.Salary = ddlSalarySel.Items[ddlSalarySel.SelectedIndex].Value;
                objVacancy.CompanyUrl = txtJobCompanyUrl.Text;
                objVacancy.JobDescription = txtAreaJobDescription.InnerText;
                objVacancy.InterviewDate = DateTime.Now;
                int i = new AddJobBO().InsertNew<Vacancy>(objVacancy);
                if (i == 1)
                {
                    Response.Redirect("ProfileEmployer.aspx");
                }
                if (i == 0)
                {
                    lblAddError.Text = "Something Went Wrong";
                }
                else
                {
                    lblAddError.Text = "";
                }
            }
            catch (Exception)
            {
                lblAddError.Text = "Something Went Wrong";
            }
        }

        [WebMethod]
        public static List<string> getSkillSet()
        {
            try
            {
                return new DDLDataBO().GetSkill();
            }
            catch (Exception)
            {

                throw null;
            }
        }
        public void BindSkillSet()
        {
            try
            {
                ddlSkillSet.DataSource = new DDLDataBO().GetD<SkillSet>();
                ddlSkillSet.DataTextField = "Skill";
                ddlSkillSet.DataValueField = "SkillID";
                ddlSkillSet.DataBind();
                ddlSkillSet.Items.Insert(0, "Select");
            }
            catch (Exception)
            {
                lblAddError.Text = "Something went wrong";
            }
        }
        public void bindJobVenue()
        {
            try
            {

                int Val = Session["ID"] != null ? Convert.ToInt32(Session["ID"].ToString()) : 0;
                ddlJobVenue.DataSource = new DDLDataBO().GetJobIdVenue(Val);
                ddlJobVenue.DataTextField = "JobPosition";
                ddlJobVenue.DataValueField = "JobID";
                ddlJobVenue.DataBind();
                ddlJobVenue.Items.Insert(0, "Select");

                ddlShowVenue.DataSource = new DDLDataBO().GetVenueDetails(Val);
                ddlShowVenue.DataTextField = "JobPosition";
                ddlShowVenue.DataValueField = "JobID";
                ddlShowVenue.DataBind();
                ddlShowVenue.Items.Insert(0, "Select");
            }
            catch (Exception)
            {

                lblError.Text = "Something went wrong";
            }
        }
        public void bind()
        {
            try
            {
                SearchDetails objS = new SearchDetails();
                objS.EmpID = Convert.ToInt32(Session["ID"].ToString());
                //   gvJobList.DataSource = new AddJobBO().ListVacancy(objS);
                //   gvJobList.DataBind();
                gvSeekersList.DataSource = new JobAppliedBO().ListOfSeekersApplied(objS.EmpID);
                gvSeekersList.DataBind();
                if (gvSeekersList.PageCount > 0)
                {
                    lblProError.Text = "";
                }
                #region Using
                //using (JobASPContext context = new JobASPContext())
                //{
                //    int Empid = Convert.ToInt32(Session["ID"].ToString());
                //    gvJobList.DataSource = context.Vacancies.Where(c => c.EmpId == Empid).ToList();
                //    gvJobList.DataBind();
                //}
                #endregion
            }
            catch (Exception)
            {
                lblProError.Text = "Something Went Wrong";
            }
        }

        //[WebMethod]
        //public static string GetSelectedItems(string sidx, string sord, int page, int rows)
        //{

        //    SearchDetails objS = new SearchDetails();
        //    objS.EmpID = Id;
        //    var allVacencies = new AddJobBO().ListVacancy(objS);
        //    Vacancy SI = new Vacancy();
        //    var newlist = allVacencies.Select(a => new Vacancy
        //    {
        //        JobID = a.JobID,
        //        JobPosition = a.JobPosition,
        //        LastDate = a.LastDate,
        //        Experience = a.Experience,
        //        Qualification = a.Qualification,
        //        Skill = a.Skill,
        //        CompanyName = a.CompanyName,
        //        City = a.City
        //    });

        //    int pageIndex = Convert.ToInt32(page) - 1;
        //    int pageSize = rows;
        //    int totalRecords = allVacencies.Count();
        //    var totalPages = (int)Math.Ceiling((float)totalRecords / (float)rows);
        //    if (sord.ToUpper() == "DESC")
        //    {
        //        newlist = newlist.OrderByDescending(s => s.JobID);
        //        newlist = newlist.Skip(pageIndex * pageSize).Take(pageSize);
        //    }
        //    else
        //    {
        //        newlist = newlist.OrderBy(s => s.JobPosition);
        //        newlist = newlist.Skip(pageIndex * pageSize).Take(pageSize);
        //    }
        //    var jsonData = new
        //    {
        //        total = totalPages,
        //        page,
        //        records = totalRecords,
        //        rows = newlist
        //    };
        //    var jsonSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        //    //  Context.Response.Write(jsonSerializer.Serialize(allVacencies.AsQueryable<Vacancy>().ToList<Vacancy>()));
        //    return JsonConvert.SerializeObject(jsonData);
        //}

        protected void btnVenueConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                Vacancy objVac = new Vacancy();
                objVac.JobID = hdnVenueJobId!=null?Convert.ToInt32(hdnVenueJobId.Value):0;
                objVac.VenueAddress = txtVenueAddress.Text;
                objVac.InterviewDate = Convert.ToDateTime(txtInterviewDate.Text);
                //objVac.InterviewTime = Convert.ToDateTime(txtInterviewTime.Text);
                //int res = new AddJobBO().UpdateJobDetails(objVac);
                //if (res == 1)
                {
                    txtVenueAddress.Text = null;
                    txtInterviewDate.Text = null;
                    bindJobVenue();
                }
            }
            catch (Exception)
            {

                lblError.Text = "Something Went Wrong";
            }
        }


        //public static void StopStartRunService()
        //{
        //    ServiceController svcController = new ServiceController("MailService");
        //    if (svcController != null)
        //    {
        //        try
        //        {
        //            string MachineName = System.Environment.MachineName;
        //            svcController.MachineName = MachineName; //this is my computer name "dt-corp-pms-04";
        //            svcController.ServiceName = "MailService"; //This is my Service name"Service1";
        //            if (svcController.Status != ServiceControllerStatus.Running)
        //            {
        //                svcController.Start();
        //            }
        //            svcController.WaitForStatus(ServiceControllerStatus.Stopped, TimeSpan.FromSeconds(60));
        //            svcController.Stop();
        //        }
        //        catch (Exception ex)
        //        {
        //        }
        //    }

        //}
        protected void gvSeekersList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "View")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = gvSeekersList.Rows[index];
                    int ID = Convert.ToInt32(row.Cells[0].Text);
                    //iframePDF.Src = new RegisterBO().ResumeData(ID);
                    string url = "ResumeViewer.aspx?ID=" + ID;
                    string s = "window.open('" + url + "', 'popup_window', 'width=800,height=500,left=100,top=100,resizable=yes,toolbar=yes');";
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "script", s, true);
                    //string str = System.Text.Encoding.UTF8.GetString((new RegisterBO().ResumeData(ID)));
                    //ResumeFrame.InnerHtml = str;
                    //MdlPopUpResume.Show();
                }
            }
            catch (Exception)
            {
                lblProError.Text = "Something Went Wrong";
            }

        }
        protected void AddCompany_Click(object sender, EventArgs e)
        {
            try
            {
                CompanyProfile objCompany = new CompanyProfile();
                if (fuCompanyImageUrl.HasFile)
                {
                    byte[] imageBytes = new byte[fuCompanyImageUrl.PostedFile.InputStream.Length + 1];
                    string filename = Path.GetFileName(fuCompanyImageUrl.PostedFile.FileName);
                    string FName = txtName.Text + "_" + filename;
                    fuCompanyImageUrl.SaveAs(Server.MapPath("~/Company_Images/" + FName));
                    objCompany.ImageUrl = "~/Company_Images/" + FName;
                }
                objCompany.CompanyName = txtName.Text;
                objCompany.Domain = txtCompanyDomain.Text;
                objCompany.Address = txtCompanyAddress.Text;
                objCompany.AboutUs = txtAboutCompany.Text;
                objCompany.Branches = txtBranches.Text;
                objCompany.UrlLink = txtCompanyUrl.Text;
                objCompany.NoofEmp = Convert.ToInt32(txtNoofEmp.Text);
                objCompany.PhNum = txtCompanyPhNum.Text;
                objCompany.EmailID = txtCompanyEmailID.Text;
                objCompany.EmployerID = Convert.ToInt32(Session["ID"].ToString());
                objCompany.InsertedDate = DateTime.Now;
                objCompany.UpdatedDate = DateTime.Now;
                int i = new AddJobBO().InsertNew<CompanyProfile>(objCompany);
                if (i == 1)
                {
                    Response.Redirect("ProfileEmployer.aspx");
                }
                if (i == 0)
                {
                    lblAddError.Text = "Something Went Wrong";
                }
                else
                {
                    lblAddError.Text = "";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        //protected void gvJobList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    gvJobList.PageIndex = e.NewPageIndex;
        //    SearchDetails objS = new SearchDetails();
        //    objS.EmpID = Convert.ToInt32(Session["ID"].ToString());
        //    gvJobList.DataSource = new AddJobBO().ListVacancy(objS);
        //    gvJobList.DataBind();
        //}

        //protected void gvSeekersList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    try
        //    {
        //        gvSeekersList.PageIndex = e.NewPageIndex;
        //        gvJobList.PageIndex = e.NewPageIndex;
        //        Search objS = new Search();
        //        objS.ID = Convert.ToInt32(Session["ID"].ToString());
        //        gvSeekersList.DataSource = new JobAppliedBO().ListOfSeekersApplied(objS.ID);
        //        gvSeekersList.DataBind();
        //    }
        //    catch (Exception)
        //    {
        //        lblError.Text = "Something Went Wrong";   
        //    }

        //}



        //protected void gvJobList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    try
        //    {
        //        //   GridViewRow row = gvJobList.Rows[e.RowIndex];
        //        //string id = row.Cells[0].Text;
        //        Vacancy objVac = new Vacancy();
        //        //  objVac.JobID = Convert.ToInt32(id);
        //        // //int res=new AddJobBO().RemoveJob(objVac);
        //        bind();

        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }

        //}

        //protected void gvJobList_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    // gvJobList.EditIndex = e.NewEditIndex;
        //    bind();
        //}

        //protected void gvJobList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int index = gvJobList.EditIndex;
        //    GridViewRow row = gvJobList.Rows[index];
        //    Vacancy objVac = new Vacancy();
        //    objVac.JobID = Convert.ToInt32(row.Cells[0].Text);
        //    objVac.JobPosition = (row.FindControl("txtJobPosition") as TextBox).Text;
        //    objVac.CompanyName = (row.FindControl("txtJobPosition") as TextBox).Text;
        //    objVac.Skill = (row.FindControl("ddlJobSkill") as DropDownList).SelectedItem.Text;
        //    objVac.PostedDate=Convert.ToDateTime(row.Cells[4].Text);
        //    objVac.LastDate =Convert.ToDateTime((row.FindControl("txtLastDate") as TextBox).Text);
        //    objVac.Country = (row.FindControl("ddlCountry") as DropDownList).SelectedItem.Text;
        //    objVac.State = (row.FindControl("ddlState") as DropDownList).SelectedItem.Text;
        //    objVac.City = (row.FindControl("ddlCity") as DropDownList).SelectedItem.Text;
        //    int res = new AddJobBO().UpdateDetails<Vacancy>(objVac);


        //}

        //protected void gvJobList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    gvJobList.EditIndex = -1;
        //    bind();
        //}

        //    protected void gvJobList_RowDataBound(object sender, GridViewRowEventArgs e)
        //    {
        //        try
        //        {
        //            //if (e.Row.RowState == DataControlRowState.Edit)
        //            //{

        //            //    var textBox = e.Row.FindControl("txtLastDate") as TextBox;
        //            //    ClientScript.RegisterStartupScript(this.GetType(), "datepick", "$(function () { $('#" + textBox.ClientID + "').datepick({ changeMonth: true,changeYear: true,autoSize: true,minDate: 3 });  })", true);
        //            //}
        //            if (e.Row.RowType == DataControlRowType.DataRow &&
        //(e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
        //            {
        //                DropDownList dl = (DropDownList)e.Row.FindControl("ddlJobSkill");
        //                dl.DataSource = new DDLDataBO().GetD<SkillSet>();
        //                dl.DataTextField = "Skill";
        //                dl.DataValueField = "SkillID";
        //                dl.DataBind();
        //                dl.Items.Insert(0, "Select");
        //            }
        //        }
        //        catch (Exception)
        //        {

        //            lblProError.Text = "Something Went Wrong";
        //        }
        //    }


    }
}