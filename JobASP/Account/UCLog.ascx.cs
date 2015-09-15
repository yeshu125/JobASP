using JobASP.DataModels;
using JobASP.Facade;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class UCLog : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogSubmit_Click(object sender, EventArgs e)
        {

            ////ILoginBO objLog = new LoginBO();
            //////if (ddlLogType.SelectedValue == "Seeker")
            //////{
            ////    LoginSeeker objLogSeeker = new LoginSeeker();
            ////    objLogSeeker.EmailID = txtLogEmailID.Text;
            ////    objLogSeeker.Password = txtLogPassword.Text;
            ////    AuthLog objAuth = objLog.Authenticate(objLogSeeker);
            ////    if (objAuth.ID != 0)
            ////    {
            ////        FormsAuthentication.RedirectFromLoginPage("Job", false);
            ////        Session["Valid"] = objAuth.Type;
            ////        Session["ID"] = objAuth.ID;
            ////        if (objAuth.Type == "Seeker")
            ////        {
            ////            Response.Redirect("~/Account/ProfileSeeker.aspx");
            ////        }
            ////        else
            ////        {
            ////            Response.Redirect("~/Account/ProfileEmployer.aspx");
            ////        }
            ////    }
            ////    if (objAuth.ID == 0)
            ////    {
            ////        Response.Redirect("~/Account/Login.aspx");
            ////    }
            //}
            //else
            //{
            //    LoginEmployer objLogEmp = new LoginEmployer();
            //    objLogEmp.EmailID = txtLogEmailID.Text;
            //    objLogEmp.Password = txtLogPassword.Text;
            //    int i = objLog.AuthenticateEmployer(objLogEmp);
            //    if (i != 0)
            //    {
            //        FormsAuthentication.RedirectFromLoginPage(ddlLogType.SelectedItem.Text, false);
            //        Session["ID"] = i;
            //        Session["Valid"] = "Employer";
            //        Response.Redirect("~/Account/ProfileEmployer.aspx");
            //    }
            //    if (i == 0)
            //    {
            //        Response.Redirect("~/Account/Login.aspx");
            //    }
            //}

        }
    }
}