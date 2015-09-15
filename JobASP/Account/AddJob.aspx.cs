using JobASP.Facade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobASP.DataModels;

namespace JobASP
{
    public partial class AddJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Valid"] != null)
            {
                if (Session["Valid"].ToString() == "Employer")
                {
                    Session["Invalid"] = null;
                    Session["Redirect"] = null;
                }
                else
                {
                    Session["Invalid"] = "Not Employer";
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Session["Redirect"] = "AddJob.aspx";
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                try
                {
                    ajaxCalLastDate.StartDate = DateTime.Now.Date;
                    ajaxCalLastDate.EndDate = DateTime.Now.AddMonths(2);
                    BindSkillSet();
                   // BindState();
                }
                catch (Exception)
                {
                   lblAddError.Text = "Something went wrong";
                }
               
            }
        }
     
        //public void BindState()
        //{
        //    try
        //    {
        //            ddlState.DataSource = new DDLDataBO().GetStates(1);
        //            ddlState.DataTextField = "StateName";
        //            ddlState.DataValueField = "StateID";
        //            ddlState.DataBind();
        //            ddlState.Items.Insert(0, "Select");
                
        //    }
        //    catch (Exception)
        //    {

        //        lblAddError.Text = "Something went wrong";
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
        //        if (ddlState.SelectedItem.Text != "Select")
        //        {
        //            int Val = Convert.ToInt32(ddlState.SelectedValue);
        //            ddlCity.DataSource = new DDLDataBO().GetCities(Val);
        //            ddlCity.DataTextField = "CityName";
        //            ddlCity.DataValueField = "CityID";
        //            ddlCity.DataBind();
        //            ddlCity.Items.Insert(0, "Select");
        //        }
        //        else
        //        {
        //            ddlCity.Items.Clear();
        //            ddlCity.Items.Insert(0, "Select");
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        lblAddError.Text = "Something went wrong";
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
        //protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    BindCity();
        //}
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                Vacancy objVacancy = new Vacancy();
                objVacancy.JobPosition = txtJobPosition.Text;
                objVacancy.PostedDate = DateTime.Now;
                objVacancy.LastDate =Convert.ToDateTime(txtCalender.Text);
                objVacancy.Country =Convert.ToInt32(ddlCountry.SelectedItem.Value);
                objVacancy.State =Convert.ToInt32(ddlState.SelectedItem.Value);
                objVacancy.City =Convert.ToInt32(ddlCity.SelectedItem.Value);
                objVacancy.Skill =Convert.ToInt32(ddlSkillSet.SelectedItem.Value);
                objVacancy.EmpId = Convert.ToInt32(Session["ID"].ToString());
                objVacancy.VenueAddress = "Testing";
                objVacancy.InterviewDate = DateTime.Now;
                int i = new AddJobBO().AddJob(objVacancy);
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
    }
}