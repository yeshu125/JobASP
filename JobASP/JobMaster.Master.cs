using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class JobMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Valid"] != null)
                {
                    //UC1.Visible = false;
                   // LnkLog.Visible = true;
                }
                else
                {
                   // LnkLog.Visible = false;
                    //UC1.Visible = true;
                }
            }

        }

        //protected void LnkLog_Click(object sender, EventArgs e)
        //{
        //    Session.Abandon();
        //    FormsAuthentication.SignOut();
        //    Session.Clear();
        //    Response.Redirect("Default.aspx");
        //}
    }
}