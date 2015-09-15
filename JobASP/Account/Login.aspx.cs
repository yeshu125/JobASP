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
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            lblErrorMsg.Text = "";
        }

        protected void btnLogSubmit_Click(object sender, EventArgs e)
        {
            try
            {
               
                ILoginBO objLog = new LoginBO();
                Credantials objCred = new Credantials();
                objCred.EmailID = txtLogEmailID.Text;
                objCred.Password = txtLogPassword.Text;
                AuthLog objAuth = objLog.Authenticate(objCred);
                if (Session["Invalid"] != null)
                {
                    lblErrorMsg.Text = Session["Invalid"].ToString();
                    Session["Invalid"] = null;
                    objAuth.ID = 0;
                    
                }
                if (objAuth.ID != 0)
                {
                    FormsAuthentication.RedirectFromLoginPage("Job", false);
                    Session["Valid"] = objAuth.Type;
                    Session["ID"] = objAuth.ID;
                    
                    if (objAuth.Type == "Seeker")
                    {
                        
                          Response.Redirect("ProfileSeeker.aspx",false);
                       
                    }
                    else
                    {
                         Response.Redirect("ProfileEmployer.aspx",false);
                      
                    }
                   
                }
                if (objAuth.ID == 0)
                {
                    lblErrorMsg.Text = "Invalid EmailID/Password";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = "Something Went Wrong in Login Page"+ ex;
            }

        }

        protected void btnForgetOk_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmailID.Text;
                ILoginBO objLog = new LoginBO();
                Credantials objCred = new Credantials();
                objCred.EmailID = txtLogEmailID.Text;
                objCred.Password = txtLogPassword.Text;
                AuthLog objAuth = objLog.AuthPwd(objCred);
                if (objAuth!=null)
                {
                    new CCDDLWebService().SendPwdMail(email, objAuth.Type, objAuth.Pwd);
                }
                
            }
            catch (Exception)
            {
                
                
            }
        }
    }
}