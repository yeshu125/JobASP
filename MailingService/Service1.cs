using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.ServiceProcess;
using System.Timers;

namespace MailingService
{
    public partial class Service1 : ServiceBase
    {
        Timer createOrderTimer;
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            createOrderTimer = new System.Timers.Timer();
            createOrderTimer.Elapsed += new System.Timers.ElapsedEventHandler(GetMail);
            createOrderTimer.Interval = 1440000;//Set One day interval
            createOrderTimer.Enabled = true;
            createOrderTimer.AutoReset = true;
            createOrderTimer.Start();
        }
        public void GetMail(object sender, System.Timers.ElapsedEventArgs args)
        {
            SqlConnection conn = new SqlConnection("Data Source=TERMINAL01\\SQLEXPRESS;Initial Catalog=JobSearchASP ;Integrated Security=SSPI");
            try
            {
                DataSet ds = new DataSet();
                conn.Open();
                SqlCommand cmd = new SqlCommand("usp_GetMail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                conn.Close();
                System.Net.Mail.SmtpClient SmtpServer = new System.Net.Mail.SmtpClient();
            SmtpServer.Credentials = new System.Net.NetworkCredential("kkothagundu", "prime");
            //SmtpServer.Port = Convert.ToInt32(25);
            SmtpServer.Host = "mail.2xprime.com";
            SmtpServer.EnableSsl = false;
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.From = new System.Net.Mail.MailAddress("kkothagundu@primetgi.com");
                foreach (DataRow DR in ds.Tables[0].Rows)
                {
                    mail.To.Add(DR["emailid"].ToString());
                     mail.Subject = "Prime Webinar Registration";
            mail.Body = "hello from asp.net testing centre";
            mail.IsBodyHtml = false;
            mail.Priority = System.Net.Mail.MailPriority.High;
            SmtpServer.Send(mail);
                }
           
            }
            finally
            {
                conn.Close();
            }
            
            //mail.To.Add("narayanasettiv@primetgi.com");
            //mail.To.Add("kkothagundu@primetgi.com");
            //mail.To.Add("dpeddinti@primetgi.com");
           
        }
        protected override void OnStop()
        {
        }
    }
}
