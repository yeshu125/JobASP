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
    public partial class MyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        protected void bind()
        {
            try
            {
                bindProfile();
            }
            catch (Exception)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertDanger", "funcAlertWrong();", true);
            }
        }
        protected void bindProfile()
        {
            int EmpId = Convert.ToInt32(Session["ID"].ToString());
            rptViewProfile.DataSource = new DDLDataBO().GetD<Employer>().Where(c => c.EmpID == EmpId);
            rptViewProfile.DataBind();
            if (rptViewProfile.Items.Count > 0)
            {
                rptProfileEdit.Visible = false;
                rptViewProfile.Visible = true;
            }
        }
        protected void bindeditProfile()
        {
            int EmpId = Convert.ToInt32(Session["ID"].ToString());
            rptProfileEdit.DataSource = new DDLDataBO().GetD<Employer>().Where(c => c.EmpID == EmpId);
            rptProfileEdit.DataBind();
            if (rptViewProfile.Items.Count > 0)
            {
                rptProfileEdit.Visible = true;
                rptViewProfile.Visible = false;
            }
        }

        protected void rptProfileEdit_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                RepeaterItem item = rptProfileEdit.Items[0];

                Employer objEmp = new Employer();
                objEmp.EmpID = Convert.ToInt32(Session["ID"].ToString());
                objEmp.EmpName = (item.FindControl("txtName") as TextBox).Text;
                objEmp.EmpLName = (item.FindControl("txtLName") as TextBox).Text;
                objEmp.CompanyName = (item.FindControl("txtCompanyName") as TextBox).Text;
                objEmp.Address = (item.FindControl("txtAddress") as TextBox).Text;
                objEmp.Country = Convert.ToInt32((item.FindControl("ddlCountry") as DropDownList).SelectedValue);
                objEmp.State = Convert.ToInt32((item.FindControl("ddlState") as DropDownList).SelectedValue);
                objEmp.City = Convert.ToInt32((item.FindControl("ddlCity") as DropDownList).SelectedValue);
                objEmp.Designation = (item.FindControl("txtDesignation") as TextBox).Text;
                objEmp.PostalCode = (item.FindControl("txtPostalCode") as TextBox).Text;
                objEmp.Phone = (item.FindControl("txtPhone") as TextBox).Text;
                //objEmp.EmailID = (item.FindControl("txtEmailID") as TextBox).Text;
                int i = new RegisterBO().UpdateEmployer(objEmp);
                if (i == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertSuccess", "funcAlert();", true);
                    bindProfile();
                }
            }
            if (e.CommandName == "Cancel")
            {
                bindProfile();
            }
        }

        protected void rptViewProfile_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                bindeditProfile();
            }
        }

        protected void btnEmpPwdOk_Click(object sender, EventArgs e)
        {
            try
            {
                int i = new RegisterBO().UpdatePwd(new Credantials() { ID = Convert.ToInt32(Session["ID"].ToString()), Password = txtChngCurrPwd.Text, NewPassword = txtChngNewPwd.Text });
                if (i==1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "AlertSuccess", "funcAlert();", true);
                }
                if (i==2)
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