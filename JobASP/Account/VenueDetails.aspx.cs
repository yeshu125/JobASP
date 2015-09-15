using JobASP.DataModels;
using JobASP.Facade;
using System;


namespace JobASP
{
    public partial class VenueDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Valid"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["Valid"].ToString() == "Employer")
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                bind();
                //ajaxInterviewDate.StartDate = DateTime.Now.AddDays(4);
                //ajaxInterviewDate.EndDate = DateTime.Now.AddMonths(1);
            }
        }
        public void bind()
        {
            try
            {

                int Val = Session["ID"] != null ? Convert.ToInt32(Session["ID"].ToString()) : 0;
                ddlJobVenue.DataSource = new DDLDataBO().GetJobIdVenue(Val);
                ddlJobVenue.DataTextField = "JobPosition";
                ddlJobVenue.DataValueField = "JobID";
                ddlJobVenue.DataBind();
                ddlJobVenue.Items.Insert(0, "Select");
            }
            catch (Exception)
            {

                lblError.Text = "Something went wrong";
            }
        }


        //protected void ddlJobVenue_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddlJobVenue.SelectedItem.Text != "Select")
        //    {
        //        tblVenue.Visible = true;
        //    }
        //    else
        //    {
        //        tblVenue.Visible = false;
        //    }

        //}

        protected void btnVenueConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                Vacancy objVac = new Vacancy();
                objVac.JobID = Convert.ToInt32(ddlJobVenue.SelectedValue);
                objVac.VenueAddress = txtVenueAddress.Text;
                objVac.InterviewDate = Convert.ToDateTime(txtInterviewDate.Text);
                //objVac.InterviewTime = Convert.ToDateTime(txtInterviewTime.Text);
                int res = new AddJobBO().UpdateJobDetails(objVac);
                if (res == 1)
                {
                    txtVenueAddress.Text = null;
                    txtInterviewDate.Text = null;
                    bind();
                }
            }
            catch (Exception)
            {

                lblError.Text = "Something Went Wrong";
            }
        }
    }
}