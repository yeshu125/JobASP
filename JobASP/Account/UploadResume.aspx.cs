using JobASP.DataModels;
using JobASP.Facade;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP.Account
{
    public partial class UploadResume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Valid"] !=null )
            {
                if (Session["Valid"].ToString() == "Seeker")
                {
                    Session["Redirect"] = null;
                    Session["Invalid"] = null;
                }
                else
                {
                    Session["Invalid"] = "Not Seeker";
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Session["Redirect"] = "UploadResume.aspx";
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuSeekerResume.HasFile)
            {
                byte[] imageBytes = new byte[fuSeekerResume.PostedFile.InputStream.Length + 1];
               // fuSeekerResume.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);
                Seeker objSeeker = new Seeker(); 
                string filename = Path.GetFileName(fuSeekerResume.PostedFile.FileName);
                string FName = Session["ID"].ToString()+filename;
                fuSeekerResume.SaveAs(Server.MapPath("~/PDF_Files/" + FName));
                objSeeker.Resume = "~/PDF_Files/" + FName;  
                objSeeker.SeekerID = Convert.ToInt32(Session["ID"].ToString());
                int i = new RegisterBO().UpdateSeeker(objSeeker);
                if (i == 1)
                {
                    lblErr.Text = "Update Successful";
                }
                else { lblErr.Text = "updation failed"; }

            }
            else
            {
                lblErr.Text = "Please Choose a File";
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            string url = "ResumeViewer.aspx?ID=" + Session["ID"].ToString();
            string s = "window.open('" + url + "', 'popup_window', 'width=800,height=500,left=100,top=100,resizable=yes,toolbar=yes');";
            ScriptManager.RegisterStartupScript(Page, this.GetType(), "script", s, true);
        }
    }
}