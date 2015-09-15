using JobASP.Facade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class ResumeViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //  Context.Response.ContentType = "application/pdf";
          //  Context.Response.BinaryWrite(new RegisterBO().ResumeData(Convert.ToInt32(Request.QueryString[0].ToString())));
          iframePDF.Src=new RegisterBO().ResumeData(Convert.ToInt32(Request.QueryString[0].ToString()));

        }
    }
}