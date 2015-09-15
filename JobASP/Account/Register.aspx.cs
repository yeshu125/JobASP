using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Membership.OpenAuth;
using JobASP.DataModels;
using JobASP.Facade;
using System.Web.UI.HtmlControls;
using ASPSnippets.SmsAPI;

namespace JobASP
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
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

                lblRegError.Text = "Something went wrong";
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
            }
            catch (Exception)
            {

                lblRegError.Text = "Something went wrong";
            }
        }
      

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                    Employer Obj = new Employer();
                    Obj.EmpName = txtName.Text;
                    Obj.EmpLName = txtLName.Text;
                    Obj.Gender = ddlGender.SelectedItem.Text;
                    Obj.Designation = txtDesignation.Text;
                    if (!String.IsNullOrWhiteSpace(txtCompany.Text))
                    {
                        Obj.CompanyName = txtCompany.Text;
                    }
                    else
                    {
                        Obj.CompanyName = String.Empty;
                    }
                    if (!String.IsNullOrWhiteSpace(txtContactTitle.Text))
                    {
                        Obj.ContactTitle = txtContactTitle.Text;
                    }
                    else
                    {
                        Obj.ContactTitle = String.Empty;
                    }
                    if (!String.IsNullOrWhiteSpace(txtAddress.Text))
                    {
                        Obj.Address = txtAddress.Text;
                    }
                    else
                    {
                        Obj.Address = String.Empty;
                    }
                    Obj.Country =Convert.ToInt32(ddlCountry.SelectedItem.Value);
                    Obj.State =Convert.ToInt32(ddlState.SelectedItem.Value);
                    Obj.City = Convert.ToInt32(ddlCity.SelectedItem.Value);
                    Obj.PostalCode = txtPostalCode.Text;
                    Obj.Phone = txtPhNum.Text;
                    Obj.EmailID = txtEmailID.Text;
                    LoginEmployer objLogEmp = new LoginEmployer();
                    objLogEmp.EmailID = txtEmailID.Text;
                    objLogEmp.Password = txtPassword.Text;
                    int val = new RegisterBO().AddEmployer(objLogEmp, Obj);
                    if (val == 1)
                    {
                        //sms sending
                        SMS.APIType = SMSGateway.Site2SMS;
                        string message = "Hello..! you registered in successful" ;
                        SMS.MashapeKey = "7c4xATbTr7mshehqdw53rmcYbfOtp1WdEtbjsnOU2FJvTrjeQs";
                        SMS.Username = "9248053456";
                        SMS.Password = "password";
                       if (txtPhNum.Text != "")
                       {
                           string num = txtPhNum.Text.Trim();
                            SMS.SendSms(num, message);
                       }
                        ////////////


                        new CCDDLWebService().SendMail(txtEmailID.Text, "Employer");
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        lblRegError.Text = "Something went wrong";
                    }
               
            }
            catch (Exception)
            {
                lblRegError.Text = "Something went wrong";
            }



        }


    }
}