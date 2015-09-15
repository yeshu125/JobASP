using JobASP.DataModels;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.Facade
{
    public interface IAddJobBO
    {
        int InsertNew<T>(T obj) where T : class;
        int AddJob(Vacancy Obj);
        int AddCompany(CompanyProfile objCompany);
        int UpdateDetails<T>(T obj) where T : class;
        int UpdateJobDetails(Vacancy Obj);
        #region Old
        //List<Vacancy> ListOfJobsbyStateSkill(Search objS);
        //List<Vacancy> ListOfJobsbyCitySkill(Search objS);
        //List<Vacancy> ListAllJobsSkill(Search objS);
        //List<Vacancy> ListAllJobsByEmpID(Search objS);
        // List<Vacancy> ListAllValidJobs();
        //List<Seeker> ListAllSeekersByCity(Search objS);
        //List<Seeker> ListAllSeekersByState(Search objS);
        //List<Seeker> ListAllSeekersBySkill(Search objS);
        // List<Seeker> ListSeekersByJobID(Search objS);
        #endregion
        List<Vacancy> ListrptVacancy(SearchDetails Obj);
        List<Vacancy> ListVacancy(SearchDetails Obj);
        List<QuerableList> ListRptJobData();
        List<Vacancy> ListAutoVacancy(List<string> objlst, List<string> objLocation, string Experience, string salary);
        List<Seeker> ListData(SearchDetails Obj);
        int RemoveJob(int objVac);
        int JQGridDetailsUpdate(Vacancy obj);
    }
}
