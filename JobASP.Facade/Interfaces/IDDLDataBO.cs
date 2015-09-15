using JobASP.DataModels;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.Facade
{
    public interface IDDLDataBO
    {
        
         List<State> GetStates(int ID);
         List<City> GetCities(int ID);
         object GetJobId(int EmpID);
         object GetJobIdVenue(int EmpID);
         object GetVenueDetails(int EmpID);
         Details GetDetails(int ID, string Case);
         List<T> GetD<T>() where T : class;
         T GetDFirst<T>() where T : class;
         List<string> GetSkill();
         List<string> GetCompanies();
         List<CompanyProfile> getCompany(string CompanyName);
         int UpdateCompany(CompanyProfile objCompany);
         List<CompanyProfile> getCompanies(int EmpID);
         IDictionary<string, List<string>> GetAutoCompleteData();
    }
}
