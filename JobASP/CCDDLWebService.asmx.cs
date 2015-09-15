using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AjaxControlToolkit;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace JobASP
{
    /// <summary>
    /// Summary description for CCDDLWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class CCDDLWebService : System.Web.Services.WebService
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["JobASPContext"].ConnectionString);

        [WebMethod]
        public CascadingDropDownNameValue[] BindCountry(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd = new SqlCommand("usp_DDLList", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@val", 1);
            cmd.Parameters.AddWithValue("@ID", 0);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> CountryDetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string CountryID = DR["CountryID"].ToString();
                string CountryName = DR["CountryName"].ToString();
                CountryDetails.Add(new CascadingDropDownNameValue(CountryName, CountryID));
            }
            return CountryDetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindState(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            int CountryID;
            StringDictionary CountryDetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            CountryID = Convert.ToInt32(CountryDetails["country"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("usp_DDLList", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@val", 2);
            cmd.Parameters.AddWithValue("@ID", CountryID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> StateDetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string stateID = DR["StateID"].ToString();
                string statename = DR["StateName"].ToString();
                StateDetails.Add(new CascadingDropDownNameValue(statename, stateID));
            }
            return StateDetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindCity(string knownCategoryValues, string category)
        {
            try
            {
                DataSet ds = new DataSet();
                int stateID;
                StringDictionary statedetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
                stateID = Convert.ToInt32(statedetails["state"]);
                conn.Open();
                SqlCommand cmd = new SqlCommand("usp_DDLList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@val", 3);
                cmd.Parameters.AddWithValue("@ID", stateID);
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                conn.Close();
                List<CascadingDropDownNameValue> CityDetails = new List<CascadingDropDownNameValue>();
                foreach (DataRow DR in ds.Tables[0].Rows)
                {
                    string CityID = DR["CityID"].ToString();
                    string City = DR["CityName"].ToString();
                    CityDetails.Add(new CascadingDropDownNameValue(City, CityID));
                }
                return CityDetails.ToArray();
            }
            finally
            {
                conn.Close();
            }

        }
        [WebMethod]
        public string[] getAutoCompleteData()
        {
            try
            {
                DataSet ds = new DataSet();
                conn.Open();
                SqlCommand cmd = new SqlCommand("usp_GetAutoData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                conn.Close();
                List<string> EmailList = new List<string>();
                foreach (DataRow DR in ds.Tables[0].Rows)
                {
                    EmailList.Add(DR["emailid"].ToString());
                }
                string[] dataArray = EmailList.ToArray<string>();
                return dataArray;
            }
            catch (Exception)
            {
                throw;
            }
        }
        [WebMethod]
        public DataSet getmailID(int code)
        {
            try
            {
                DataSet ds = new DataSet();
                conn.Open();
                SqlCommand cmd = new SqlCommand("usp_GetMail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@code", code);
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                conn.Close();
                //List<string> EmailList = new List<string>();
                //foreach (DataRow DR in ds.Tables[0].Rows)
                //{
                //    EmailList.Add(DR["emailid"].ToString());
                //}
                return ds;

            }
            finally
            {
                conn.Close();
            }

        }
        [WebMethod]
        public DataSet getEMpMailID()
        {
            try
            {
                DataSet ds = new DataSet();
                conn.Open();
                SqlCommand cmd = new SqlCommand("usp_GetMail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@code", 2);
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                conn.Close();
                return ds;
            }
            finally
            {
                conn.Close();
            }
        }
        [WebMethod]
        public void SendMail(string EmailID,string Type)
        {
            try
            {
                System.Net.Mail.SmtpClient SmtpServer = new System.Net.Mail.SmtpClient();
                SmtpServer.Credentials = new System.Net.NetworkCredential("kkothagundu", "prime");
                //SmtpServer.Port = Convert.ToInt32(25);
                SmtpServer.Host = "mail.2xprime.com";
                SmtpServer.EnableSsl = false;
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.From = new System.Net.Mail.MailAddress("kkothagundu@primetgi.com");
                mail.To.Add(EmailID);
                mail.Subject = "Registration Details";
                mail.Body = "Hello "+Type+". <br> You are Registration was Successfully done.Thanks for Registering with us. <br> Thank you <br> <b>Job Portal </b>";
                mail.IsBodyHtml = true;
                mail.Priority = System.Net.Mail.MailPriority.High;
                SmtpServer.Send(mail);
                mail.To.Clear();
            }
            catch (Exception)
            {

                throw;
            }
        }
        [WebMethod]
        public void SendPwdMail(string EmailID,string Type, string Pwd)
        {
            try
            {
                System.Net.Mail.SmtpClient SmtpServer = new System.Net.Mail.SmtpClient();
                SmtpServer.Credentials = new System.Net.NetworkCredential("kkothagundu", "prime");
                //SmtpServer.Port = Convert.ToInt32(25);
                SmtpServer.Host = "mail.2xprime.com";
                SmtpServer.EnableSsl = false;
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.From = new System.Net.Mail.MailAddress("kkothagundu@primetgi.com");
                mail.To.Add(EmailID);
                mail.Subject = "Registration Details";
                mail.Body = "Hello " + Type + ". <br> You are Login Details as follows:<br>EmailId :" + EmailID + "<br>Password :" + Pwd + "   <br> Thank you <br> <b>Job Portal </b>";
                mail.IsBodyHtml = true;
                mail.Priority = System.Net.Mail.MailPriority.High;
                SmtpServer.Send(mail);
                mail.To.Clear();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
