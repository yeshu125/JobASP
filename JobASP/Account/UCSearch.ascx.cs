using JobASP.DataModels;
using JobASP.Facade;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobASP
{
    public partial class UCSearch : System.Web.UI.UserControl
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
                BindDDL();
            }
            catch (Exception)
            {

                lblGrid.Text = "No data Found for your Search";
            }
        }
        public void BindDDL()
        {
            try
            {
                ddlSkillSetSel.DataSource = new DDLDataBO().GetD<SkillSet>();
                ddlSkillSetSel.DataTextField = "Skill";
                ddlSkillSetSel.DataValueField = "SkillID";
                ddlSkillSetSel.DataBind();

                ddlCountrySel.DataSource = new DDLDataBO().GetD<Country>();
                ddlCountrySel.DataTextField = "CountryName";
                ddlCountrySel.DataValueField = "CountryID";
                ddlCountrySel.DataBind();

                ddlStateSel.DataSource = new DDLDataBO().GetD<State>();
                ddlStateSel.DataTextField = "StateName";
                ddlStateSel.DataValueField = "StateID";
                ddlStateSel.DataBind();

                ddlCitySel.DataSource = new DDLDataBO().GetD<City>();
                ddlCitySel.DataTextField = "CityName";
                ddlCitySel.DataValueField = "CityID";
                ddlCitySel.DataBind();
            }
            catch (Exception)
            {

                lblGrid.Text = "Something went wrong";
            }
        }
        public void GridBind()
        {
            try
            {
                SearchDetails objSearch = new SearchDetails();
               // string[] arg = ddlSkillSet.SelectedItem.Text.Split(new string[] { }, StringSplitOptions.RemoveEmptyEntries).ToArray();
                objSearch.lstSkill = ddlSkillSetSel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstCountry = ddlCountrySel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstState = ddlStateSel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                objSearch.lstCity = ddlCitySel.Items.Cast<ListItem>().Where(l => l.Selected).Select(l => l.Value).ToList().Select(int.Parse).ToList();
                gvListSeeker.DataSource = new AddJobBO().ListData(objSearch);
                #region Search
                //    Search objS = new Search();
            //    objS.Skill = ddlSkillSet.SelectedItem.Text;
            //    if (ddlState.SelectedItem.Text != "Select")
            //    {
            //        if (ddlCity.SelectedItem.Text != "Select")
            //        {
            //            objS.Place = ddlCity.SelectedItem.Text;
            //            gvListSeeker.DataSource = new AddJobBO().ListAllSeekersByCity(objS);
            //        }
            //        else
            //        {
            //            objS.Place = ddlState.SelectedItem.Text;
            //            gvListSeeker.DataSource = new AddJobBO().ListAllSeekersByState(objS);
            //        }
            //    }
            //    else
            //    {
            //        gvListSeeker.DataSource = new AddJobBO().ListAllSeekersBySkill(objS);
                //    }
                #endregion
                gvListSeeker.DataBind();
                if (gvListSeeker.PageCount > 0)
                {
                    lblGrid.Text = "";
                }
                else
                {
                    lblGrid.Text = "No data Found for your Search";
                }
            }
            catch (Exception)
            {
                lblGrid.Text = "No data Found for your Search";
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                GridBind();
            }
            catch (Exception)
            {
                lblGrid.Text = "No data Found for your Search";
            }
        }

        protected void gvListSeeker_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvListSeeker.PageIndex = e.NewPageIndex;
                GridBind();
            }
            catch (Exception)
            {
                lblGrid.Text = "No data Found for your Search";
            }
        }
    }
}