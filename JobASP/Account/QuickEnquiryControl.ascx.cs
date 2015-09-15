using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP.Account
{
    public partial class QuickEnquiryControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                System.Net.Mail.SmtpClient SmtpServer = new System.Net.Mail.SmtpClient();
                SmtpServer.Credentials = new System.Net.NetworkCredential("kkothagundu", "prime");
                //SmtpServer.Port = Convert.ToInt32(25);
                SmtpServer.Host = "mail.2xprime.com";
                SmtpServer.EnableSsl = false;
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.To.Add("kkothagundu@primetgi.com");
                mail.From = new System.Net.Mail.MailAddress("kkothagundu@primetgi.com");
                mail.Subject = "Quick Enquiry Message";
                mail.Body = "Hello <br/> Name :"+txtName.Text+" <br/> EmailID :"+txtEmailID.Text+"<br/> Subject : "+txtSubject.Text+"<br/> Message :"+txtMessage.Text;
                mail.IsBodyHtml = true;
                mail.Priority = System.Net.Mail.MailPriority.High;
                SmtpServer.Send(mail);
                mail.To.Clear();
                Response.Redirect(Request.Url.AbsolutePath);
            }
            catch (Exception ex)
            {

                Response.Write(ex);
            }
        }
    }
}