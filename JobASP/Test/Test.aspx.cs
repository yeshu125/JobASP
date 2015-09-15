using JobASP.DataModels;
using JobASP.Facade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    gvTest.DataSource = new DDLDataBO().GetD<SkillSet>();
        //    gvTest.DataBind();
        //    TestDDL.DataSource = new DDLDataBO().GetD<Country>();
        //    TestDDL.DataTextField = "CountryName";
        //    TestDDL.DataValueField = "CountryId";
        //    TestDDL.DataBind();
            //FormView1.DataSource = new DDLDataBO().GetD<SkillSet>();
            //FormView1.DataBind();
            //DataList1.DataSource = new DDLDataBO().GetD<SkillSet>();
            //DataList1.DataBind();
            //DetailsView1.DataSource = new DDLDataBO().GetD<SkillSet>();
            //DetailsView1.DataBind();
            ////ListView1.DataSource = new DDLDataBO().GetD<SkillSet>();
            ////ListView1.DataBind();
            //CheckBoxList1.DataSource = new DDLDataBO().GetD<SkillSet>();
            //CheckBoxList1.DataTextField = "Skill";
            //CheckBoxList1.DataBind();
            //ListBox1.DataSource = new DDLDataBO().GetD<SkillSet>();
            //ListBox1.DataBind();




            //rngValDOB.MinimumValue = DateTime.Now.AddYears(-74).ToShortDateString();
            //rngValDOB.MaximumValue = DateTime.Now.AddYears(-14).ToShortDateString();
            //if (!IsPostBack)
            {
                Bind();
            }
            //lblRegErr.Text = "";
        }
        public void Bind()
        {
            try
            {
                BindSkillSet();
            }
            catch (Exception)
            {
              
            }
        }
        public void BindSkillSet()
        {
            try
            {
                //ddlSkillSet.DataSource = new DDLDataBO().GetD<SkillSet>();
                //ddlSkillSet.DataTextField = "Skill";
                //ddlSkillSet.DataValueField = "SkillID";
                //ddlSkillSet.DataBind();
                //ddlSkillSet.Items.Insert(0, "Select");
            }
            catch (Exception)
            {


            }
        }

        [WebMethod]
        public static void CollectData(string[] obj)
        {
            new Test().getData(obj);
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
                ObjSeeker.State =Convert.ToInt32( Objdata[5]);
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
                    new CCDDLWebService().SendMail(Objdata[17], "Seeker");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    //lblRegErr.Text = "Something went wrong";
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
        //protected void btnProceedtopay_Click(object sender, EventArgs e)
        //{

        //}
        //protected void gvTest_RowCreated(object sender, GridViewRowEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Row.RowState == DataControlRowState.Edit)
        //        {
        //            var textBox = e.Row.FindControl("txtCal") as TextBox;
        //            ClientScript.RegisterStartupScript(this.GetType(), "datepick", "$(function () { $('#gvTest_" + textBox.ClientID + "').datepicker({ changeMonth: true,changeYear: true,autoSize: true,minDate: 3 });  })", true);
        //        }
               
        //    }
        //    catch (Exception)
        //    {

                
        //    }

        //}

        //protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        //{
        //    DetailsView1.PageIndex = e.NewPageIndex;
        //    DetailsView1.DataSource = new DDLDataBO().GetD<SkillSet>();
        //    DetailsView1.DataBind();
        //}

        //protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        //{
        //    FormView1.PageIndex = e.NewPageIndex;
        //    //FormView1.DataSource = new DDLDataBO().GetD<SkillSet>();
        //    //FormView1.DataBind();
        //}
    }
}