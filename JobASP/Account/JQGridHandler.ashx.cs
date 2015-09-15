using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Script.Serialization;
using System.Collections.Specialized;
using JobASP.DataModels;
using JobASP.ViewModels;
using JobASP.Facade;
using MongoDB.Driver.Builders;
using MongoDB.Driver;

namespace JobASP
{
    /// <summary>
    /// Summary description for JQGridHandler
    /// </summary>
    public class JQGridHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            System.Collections.Specialized.NameValueCollection forms = context.Request.Form;
            string strOperation = forms.Get("oper");
          SearchDetails objS = new SearchDetails();
            objS.EmpID =ProfileEmployer.Id;
            var collectionEmployee = new AddJobBO().ListVacancy(objS);
            var collectionCompanies = new DDLDataBO().getCompanies(ProfileEmployer.Id);
            string strResponse = string.Empty;
            var filter = context.Request.QueryString["id"];
            if (strOperation == null)
            {
               
                if (filter == "1")
                {
                    //oper = null which means its first load.
                    var jsonSerializer = new JavaScriptSerializer();
                    context.Response.Write(jsonSerializer.Serialize(collectionEmployee.AsQueryable<Vacancy>().ToList<Vacancy>()));
                }
                else
                {
                    var jsonSerializer = new JavaScriptSerializer();
                    context.Response.Write(jsonSerializer.Serialize(collectionCompanies.AsQueryable<CompanyProfile>().ToList<CompanyProfile>()));
                }
            }
            else if (strOperation == "del")
            {
                 if (filter == "1")
                 {
                     // var query = Query.EQ("JobID", forms.Get("JobId").ToString());
                     int jobid = Convert.ToInt32(forms.Get("JobId"));
                     new AddJobBO().RemoveJob(jobid);
                     //collectionEmployee.Remove(query);
                 }
                     strResponse = "Employee record successfully removed";
                     context.Response.Write(strResponse);
              
            }
            else
            {
                string strOut = string.Empty;
                if (filter == "1")
                {
                    AddEdit(forms, collectionEmployee, out strOut);
                }
                else
                {
                    AddEditCompany(forms, collectionCompanies, out strOut);
                }
                context.Response.Write(strOut);
            }
                       
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        private void AddEditCompany(NameValueCollection forms, List<CompanyProfile> collectioncompanies, out string strResponse)
        {
            CompanyProfile objCompany = new CompanyProfile();
            objCompany.CompanyID = Convert.ToInt32(forms.Get("CompanyId").ToString());
            objCompany.CompanyName = forms.Get("CompanyName");
            objCompany.Domain = forms.Get("Domain");
            objCompany.Address = forms.Get("Address");
            objCompany.Branches = forms.Get("Branches");
            objCompany.UrlLink = forms.Get("UrlLink");
            objCompany.EmailID = forms.Get("EmailID");
            objCompany.PhNum = forms.Get("PhNum");
            objCompany.NoofEmp = Convert.ToInt32(forms.Get("NoofEmp").ToString());

            int res = new DDLDataBO().UpdateCompany(objCompany);
            if (res == 1)
            {
                strResponse = "Employee record successfully updated";
            }
            else
            {
                strResponse = "Something went wrong";
            }
 
        }
        private void AddEdit(NameValueCollection forms, List<Vacancy> collectionEmployee, out string strResponse)
        {
            string strOperation = forms.Get("oper");
            string strEmpId = string.Empty;
            if (strOperation == "edit")
            {
                strEmpId = forms.Get("JobId").ToString();

            }
            else if (strOperation == "add")
            {
                strResponse = "Adding functionality not yet implemented";
               // var result = collectionEmployee.AsQueryable<Vacancy>().Select(c => c.JobID).Max();
               // strEmpId = (Convert.ToInt32(result) + 1).ToString();
            }
            Vacancy objVac=new Vacancy();
            objVac.JobID =Convert.ToInt32(strEmpId);
            objVac.JobPosition= forms.Get("JobPosition").ToString();
            objVac.CompanyName = forms.Get("CompanyName").ToString();
            objVac.LastDate=Convert.ToDateTime(forms.Get("LastDate").ToString());
            objVac.Skill =Convert.ToInt32(forms.Get("Skill").ToString());
            objVac.City =Convert.ToInt32(forms.Get("City").ToString());
            objVac.Qualification = forms.Get("Qualification").ToString().Trim();
            objVac.Experience = forms.Get("Experience").ToString();
            objVac.Salary = forms.Get("Salary").ToString();
          int res= new AddJobBO().JQGridDetailsUpdate(objVac);
          if (res == 1)
          {
              strResponse = "Employee record successfully updated";
          }
          else
          {
              strResponse = "Something went wrong";
          }
        }
    }
}