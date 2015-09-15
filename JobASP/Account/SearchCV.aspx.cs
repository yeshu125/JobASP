using JobASP.Facade;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP.Account
{
    public partial class SearchCV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Valid"] == null)
            {
                Session["Redirect"] = "SearchCV.aspx";
                Response.Redirect("Login.aspx");
            }
            if (Session["Valid"].ToString() == "Employer")
            {
                Session["Redirect"] = null;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                bind();
            }
        }
      
        public void bind()
        {
            try
            {
                // BindState();
               // BindSkillSet();
                BindJobId();
            }
            catch (Exception)
            {

                lblGrid.Text = "Something went wrong";
            }

        }
        public void BindJobId()
        {
            try
            {
                int Val = Convert.ToInt32(Session["ID"].ToString());
                ddlSearchJobID.DataSource = new DDLDataBO().GetJobId(Val);
                ddlSearchJobID.DataTextField = "JobPosition";
                ddlSearchJobID.DataValueField = "JobID";
                ddlSearchJobID.DataBind();
                ddlSearchJobID.Items.Insert(0, "Select");
            }
            catch (Exception)
            {

                lblGrid.Text = "Something went wrong";
            }
        }
        //  public void BindSkillSet()
        //{
        //    try
        //    {
        //        ddlSkillSet.DataSource = new DDLDataBO().GetSkillSet();
        //        ddlSkillSet.DataTextField = "Skill";
        //        ddlSkillSet.DataValueField = "SkillID";
        //        ddlSkillSet.DataBind();
        //        ddlSkillSet.Items.Insert(0, "Select");
        //    }
        //    catch (Exception)
        //    {

        //        lblGrid.Text = "Something went wrong";
        //    }
        //}
        //public void BindState()
        //{
        //    try
        //    {
        //        int Val = Convert.ToInt32(1);
        //        ddlState.DataSource = new DDLDataBO().GetStates(Val);
        //        ddlState.DataTextField = "StateName";
        //        ddlState.DataValueField = "StateID";
        //        ddlState.DataBind();
        //        ddlState.Items.Insert(0, "Select");
        //    }
        //    catch (Exception)
        //    {

        //        lblGrid.Text = "Something went wrong";
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
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        lblGrid.Text = "Something went wrong";
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
        //protected void gvListSeeker_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    gvListSeeker.PageIndex = e.NewPageIndex;
        //    GridBind();
        //    #region Data
        //    //Search objS = new Search();
        //    //objS.Skill = ddlSkillSet.SelectedItem.Text;
        //    //if (ddlState.SelectedItem.Text != "Select")
        //    //{
        //    //    if (ddlCity.SelectedItem.Text != "Select")
        //    //    {
        //    //        objS.Place = ddlCity.SelectedItem.Text;
        //    //        gvListSeeker.DataSource = new AddJobBO().ListAllSeekersByCity(objS);
        //    //    }
        //    //    else
        //    //    {
        //    //        objS.Place = ddlState.SelectedItem.Text;
        //    //        gvListSeeker.DataSource = new AddJobBO().ListAllSeekersByState(objS);
        //    //    }
        //    //}
        //    //else
        //    //{
        //    //    gvListSeeker.DataSource = new AddJobBO().ListAllSeekersBySkill(objS);
        //    //}
        //    //gvListSeeker.DataBind();
        //    #endregion
        //}
        //public void GridBind()
        //{
        //    try
        //    {
        //        DropDownList ddlSkillSet = UCSearch.FindControl("ddlSkillSet") as DropDownList;
        //        DropDownList ddlState = UCSearch.FindControl("ddlState") as DropDownList;
        //        DropDownList ddlCity = UCSearch.FindControl("ddlCity") as DropDownList;
        //        GridView gvListSeeker = UCSearch.FindControl("gvListSeeker") as GridView;
        //        Search objS = new Search();
        //        objS.Skill = ddlSkillSet.SelectedItem.Text;
        //        if (ddlState.SelectedItem.Text != "Select")
        //        {
        //            if (ddlCity.SelectedItem.Text != "Select")
        //            {
        //                objS.Place = ddlCity.SelectedItem.Text;
        //                gvListSeeker.DataSource = new AddJobBO().ListAllSeekersByCity(objS);
        //            }
        //            else
        //            {
        //                objS.Place = ddlState.SelectedItem.Text;
        //                gvListSeeker.DataSource = new AddJobBO().ListAllSeekersByState(objS);
        //            }
        //        }
        //        else
        //        {
        //            gvListSeeker.DataSource = new AddJobBO().ListAllSeekersBySkill(objS);
        //        }
        //        gvListSeeker.DataBind();
        //        if (gvListSeeker.PageCount > 0)
        //        {
        //            lblGrid.Text = "";
        //        }
        //        else
        //        {
        //            lblGrid.Text = "No data Found for your Search";
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    GridBind();
        //}
        public void gvSeekerListBind()
        {
            try
            {
                if (ddlSearchJobID.SelectedItem.Text != "Select")
                {
                    int Val = Convert.ToInt32(ddlSearchJobID.SelectedItem.Value);
                    gvSeekerListByJobID.DataSource = new JobAppliedBO().ListofSeekersByJobID(Val);
                    gvSeekerListByJobID.DataBind();
                    if (gvSeekerListByJobID.PageCount>0)
                    {
                        gvSeekerListByJobID.Visible = true;
                        lblgvSeeker.Text = "";
                    }
                    else
                    {
                        gvSeekerListByJobID.Visible = false;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alertError();", true);
                        lblgvSeeker.Text = "No Seeker Found for " + ddlSearchJobID.SelectedItem.Text +" Position";
                    }
                }
                else
                {
                    gvSeekerListByJobID.DataSource = null;
                    gvSeekerListByJobID.DataBind();
                }
            }
            catch (Exception)
            {

                lblGrid.Text = "Something went wrong";
            }
        }
        protected void gvSeekerListByJobID_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSeekerListByJobID.PageIndex = e.NewPageIndex;
            gvSeekerListBind();
        }
        protected void ddlSearchJobID_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvSeekerListBind();
        }

    }
}