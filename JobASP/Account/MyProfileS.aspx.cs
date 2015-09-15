using JobASP.DataModels;
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
    public partial class MyProfileS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Bind();
            }
            if (Page.IsPostBack)
            {

            }
        }
        public void Bind()
        {
            try
            {
                int id = Convert.ToInt32(Session["ID"].ToString());
                rptViewDetails.DataSource = new DDLDataBO().GetDetails<Seeker>(c => c.SeekerID == id);
                rptViewDetails.DataBind();
                if (rptViewDetails.Items.Count > 0)
                {
                    rptViewDetails.Visible = true;
                    rptProfileS.Visible = false;
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
            }
        }
        public void BindSkillSet()
        {
            try
            {
                foreach (RepeaterItem item in rptProfileS.Items)
                {
                    DropDownList ddlSkillSet = item.FindControl("ddlSkillSet") as DropDownList;
                    ddlSkillSet.DataSource = new DDLDataBO().GetD<SkillSet>();
                    ddlSkillSet.DataTextField = "Skill";
                    ddlSkillSet.DataValueField = "SkillID";
                    ddlSkillSet.DataBind();
                    ddlSkillSet.Items.Insert(0, "Select");
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(Session["ID"].ToString());
                rptProfileS.DataSource = new DDLDataBO().GetDetails<Seeker>(c => c.SeekerID == id);
                rptProfileS.DataBind();
                if (rptProfileS.Items.Count > 0)
                {
                    rptProfileS.Visible = true;
                    rptViewDetails.Visible = false;
                    BindSkillSet();
                    foreach (RepeaterItem item in rptProfileS.Items)
                    {
                        RangeValidator rngValDOB = item.FindControl("rngValDOB") as RangeValidator;
                        rngValDOB.MinimumValue = DateTime.Now.AddYears(-74).ToShortDateString();
                        rngValDOB.MaximumValue = DateTime.Now.AddYears(-14).ToShortDateString();
                    }
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
            }
        }

        protected void btnFinish_Click(object sender, EventArgs e)
        {
            try
            {
                RepeaterItem item = rptProfileS.Items[0];
                Seeker objS = new Seeker();
                objS.SeekerID = Convert.ToInt32(Session["ID"].ToString());
                objS.SeekerName = (item.FindControl("txtName") as TextBox).Text;
                objS.SeekerLName = (item.FindControl("txtLName") as TextBox).Text;
                objS.DOB = Convert.ToDateTime((item.FindControl("txtDOB") as TextBox).Text);
                objS.Country = Convert.ToInt32((item.FindControl("ddlCountry") as DropDownList).SelectedValue);
                objS.State = Convert.ToInt32((item.FindControl("ddlState") as DropDownList).SelectedValue);
                objS.City = Convert.ToInt32((item.FindControl("ddlCity") as DropDownList).SelectedValue);
                objS.Industry = (item.FindControl("txtIndustry") as TextBox).Text;
                objS.PrimarySkill = Convert.ToInt32((item.FindControl("ddlSkillSet") as DropDownList).SelectedValue);
                objS.SkillSet = (item.FindControl("txtSkillList") as TextBox).Text;
                objS.Experience = Convert.ToInt32((item.FindControl("txtTotalExperience") as TextBox).Text);
                objS.TenthPercent = Convert.ToInt32((item.FindControl("txt10thPercent") as TextBox).Text);
                objS.InterPercent = Convert.ToInt32((item.FindControl("txtInterPercent") as TextBox).Text);
                objS.GraduationPercent = Convert.ToInt32((item.FindControl("txtGradPercent") as TextBox).Text);
                objS.PGPercent = Convert.ToInt32((item.FindControl("txtPGPercent") as TextBox).Text);
                objS.Phone = (item.FindControl("txtPhone") as TextBox).Text;
                //objEmp.EmailID = (item.FindControl("txtEmailID") as TextBox).Text;
                int i = new RegisterBO().UpdateSeekerDetails(objS);
                if (i == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertSuccess", "funcAlert();", true);
                    Bind();
                }
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
            }
        }

        protected void btnrptCancel_Click(object sender, EventArgs e)
        {
            Bind();
            Response.Redirect("ProfileSeeker.aspx");
        }

        protected void btnSeekerChngPwd_Click(object sender, EventArgs e)
        {
            try
            {
                int i = new RegisterBO().UpdatePwd(new Credantials() { ID = Convert.ToInt32(Session["ID"].ToString()), Password = txtChngCurrPwd.Text, NewPassword = txtChngNewPwd.Text });
                if (i == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertSuccess", "funcAlert();", true);
                }
                if (i == 2)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertDanger();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
                }
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
            }
        }
    }
}