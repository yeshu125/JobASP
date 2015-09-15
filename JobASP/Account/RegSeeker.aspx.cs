using ASPSnippets.SmsAPI;
using JobASP.DataModels;
using JobASP.Facade;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class RegSeeker : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            rngValDOB.MinimumValue = DateTime.Now.AddYears(-74).ToShortDateString();
            rngValDOB.MaximumValue = DateTime.Now.AddYears(-14).ToShortDateString();
            if (!IsPostBack)
            {
                //AjaxCalDOB.EndDate = DateTime.Now.AddYears(-14);
                lblRegErr.Text = "";
                Bind();
            }
            if (Page.IsPostBack)
            {
              
            }
        }
      
        public void Bind()
        {
            try
            {
                BindSkillSet();
            }
            catch (Exception)
            {
                lblRegErr.Text = "Something went wrong"; 
            }
        }
        public void BindSkillSet()
        {
            try
            {
                ddlSkillSet.DataSource = new DDLDataBO().GetD<SkillSet>();
                ddlSkillSet.DataTextField = "Skill";
                ddlSkillSet.DataValueField = "SkillID";
                ddlSkillSet.DataBind();
                ddlSkillSet.Items.Insert(0, "Select");
            }
            catch (Exception)
            {
                lblRegErr.Text = "Something Went Wrong";
            }
        }
        [WebMethod]
        public static void CollectData(string[] obj)
        {
            new RegSeeker().getData(obj);
        }
        public void getData(string[] Objdata)
        {
            try
            {
                Seeker ObjSeeker = new Seeker();
                ObjSeeker.SeekerName = Objdata[0];
                ObjSeeker.SeekerLName = Objdata[1];
                ObjSeeker.Gender = Objdata[2];
                ObjSeeker.DOB = Convert.ToDateTime(Objdata[3]);
                ObjSeeker.Country =Convert.ToInt32( Objdata[4]);
                ObjSeeker.State = Convert.ToInt32(Objdata[5]);
                ObjSeeker.City = Convert.ToInt32(Objdata[6]);
                ObjSeeker.Industry = Objdata[7];
                ObjSeeker.PrimarySkill =Convert.ToInt32(Objdata[8]);
                ObjSeeker.SkillSet = Objdata[9];
                ObjSeeker.Experience = Convert.ToInt32(Objdata[10]);
                ObjSeeker.TenthPercent = Convert.ToInt32(Objdata[11]);
                ObjSeeker.InterPercent = Convert.ToInt32(Objdata[12]);
                ObjSeeker.GraduationType = Objdata[13];
                ObjSeeker.GraduationPercent = Convert.ToInt32(Objdata[14]);
                ObjSeeker.PGPercent = Convert.ToInt32(Objdata[15]);
                ObjSeeker.Phone = Objdata[16];
                #region Resume
                //byte[] imageBytes = new byte[fuSeekerResume.PostedFile.InputStream.Length + 1];
                //fuSeekerResume.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);
                //Obj.Resume = imageBytes;
                #endregion
                ObjSeeker.EmailID = Objdata[17];
                LoginSeeker objLogSeeker = new LoginSeeker();
                objLogSeeker.EmailID = Objdata[17];
                objLogSeeker.Password = Objdata[18];
                
                int val = new RegisterBO().AddSeeker(objLogSeeker, ObjSeeker);
                if (val == 1)
                {
                    SMS.APIType = SMSGateway.Site2SMS;
                    string message = "Hello..! you registered in successful";
                    SMS.MashapeKey = "7c4xATbTr7mshehqdw53rmcYbfOtp1WdEtbjsnOU2FJvTrjeQs";
                    SMS.Username = "9248053456";
                    SMS.Password = "password";
                    if (txtPhNum.Text != "")
                    {
                        string num = txtPhNum.Text.Trim();
                        SMS.SendSms(num, message);
                    }
                    ////////////
                    new CCDDLWebService().SendMail(Objdata[17], "Seeker");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblRegErr.Text = "Something went wrong";
                }
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                Objdata = null;
            }

        }

        protected void btnSeekerSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Seeker ObjSeeker = new Seeker();
                ObjSeeker.SeekerName = txtName.Text;
                ObjSeeker.SeekerLName = txtLName.Text;
                ObjSeeker.Gender =ddlGender.SelectedItem.Text ;
                ObjSeeker.DOB = Convert.ToDateTime(txtDOB.Text);
                ObjSeeker.Country = Convert.ToInt32(ddlCountry.SelectedValue);
                ObjSeeker.State = Convert.ToInt32(ddlState.SelectedValue);
                ObjSeeker.City = Convert.ToInt32(ddlCity.SelectedValue);
                ObjSeeker.Industry = txtIndustry.Text;
                ObjSeeker.PrimarySkill = Convert.ToInt32(ddlSkillSet.SelectedValue);
                ObjSeeker.SkillSet = txtSkillList.Text;
                ObjSeeker.Experience = Convert.ToInt32(txtTotalExperience.Text);
                ObjSeeker.TenthPercent = Convert.ToInt32(txt10thPercent.Text);
                ObjSeeker.InterPercent = Convert.ToInt32(txtInterPercent.Text);
                ObjSeeker.GraduationType = rdoLstSelect.SelectedItem.Text;
                ObjSeeker.GraduationPercent = Convert.ToInt32(txtGradPercent.Text);
                ObjSeeker.PGPercent = Convert.ToInt32(txtPGPercent.Text);
                ObjSeeker.Phone = txtPhNum.Text;
                ObjSeeker.EmailID = txtEmailID.Text;
                //if (fuSeekerResume.HasFile)
                //{
                //    string filename = Path.GetFileName(fuSeekerResume.PostedFile.FileName);
                //    string FName = Session["ID"].ToString() + filename;
                //    fuSeekerResume.SaveAs(Server.MapPath("~/PDF_Files/" + FName));
                //    ObjSeeker.Resume = "~/PDF_Files/" + FName;
                //    ObjSeeker.SeekerID = Convert.ToInt32(Session["ID"].ToString());

                //}
                LoginSeeker objLogSeeker = new LoginSeeker();
                objLogSeeker.EmailID = txtEmailID.Text;
                objLogSeeker.Password = txtPassword.Text;
                int val = new RegisterBO().AddSeeker(objLogSeeker, ObjSeeker);
                if (val == 1)
                {
                    SMS.APIType = SMSGateway.Site2SMS;
                    string message = "Hello..! your registration was successfully done.";
                    SMS.MashapeKey = "7c4xATbTr7mshehqdw53rmcYbfOtp1WdEtbjsnOU2FJvTrjeQs";
                    SMS.Username = "9248053456";
                    SMS.Password = "password";
                    if (txtPhNum.Text != "")
                    {
                        string num = txtPhNum.Text.Trim();
                        SMS.SendSms(num, message);
                    }
                    ////////////
                    new CCDDLWebService().SendMail(txtEmailID.Text, "Seeker");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblRegErr.Text = "Something went wrong";
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            
        }
    }
}