using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class EmpMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Valid"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {

            }
        }

        protected void LnkLog_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}