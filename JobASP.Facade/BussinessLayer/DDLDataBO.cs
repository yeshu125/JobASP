using JobASP.DataLayer;
using JobASP.DataModels;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core;
using System.Data.Entity.Validation;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.Facade
{
    public class DDLDataBO : IDDLDataBO
    {
        #region "Unitofwork Reference"
        IUnitOfWork _unitOfWork = null;
        public DDLDataBO(IUnitOfWork _unitOfWork)
        {
            this._unitOfWork = _unitOfWork;
        }
        public DDLDataBO()
        {
            _unitOfWork = new UnitOfWork();
        }

        #endregion
        //public List<Country> GetCountries()
        //{
        //    return _unitOfWork.Repository<Country>().GetAll().ToList();
        //}
        public List<State> GetStates(int ID)
        {
            return _unitOfWork.Repository<State>().GetAll().Where(c => c.CountryID == ID).ToList();
        }
        public List<City> GetCities(int ID)
        {
            return _unitOfWork.Repository<City>().GetAll().Where(c => c.StateID == ID).ToList();
        }
        //public List<SkillSet> GetSkillSet()
        //{
        //    return _unitOfWork.Repository<SkillSet>().GetAll().ToList();
        //}
        public object GetJobId(int EmpID)
        {
            var obj = (object)_unitOfWork.Repository<Vacancy>().GetAll().Where(c => c.EmpId == EmpID).Select(c => new { JobID = c.JobID, JobPosition = c.JobPosition }).ToList();

            //_unitOfWork.Repository<JobApplied>().GetAll().Where(c => c.Vacancy.EmpId== ID).ToList();
            return obj;
        }
        public object GetJobIdVenue(int EmpID)
        {
           return (object)_unitOfWork.Repository<Vacancy>().GetAll().Where(c => c.EmpId == EmpID).Where(c=>c.VenueAddress=="").Select(c => new { JobID = c.JobID, JobPosition = c.JobPosition }).ToList();
            
        }
        public object GetVenueDetails(int EmpID)
        {
            return (object)_unitOfWork.Repository<Vacancy>().GetAll().Where(c => c.EmpId == EmpID).Where(c => c.VenueAddress != "").Select(c => new { JobID = c.JobID, JobPosition = c.JobPosition }).ToList();

        }
        public Details GetDetails(int ID, string Case)
        {
            // var obj= _unitOfWork.Repository<T>().GetAll();
            Details obj = new Details();
            switch (Case)
            {
                case "Country":
                    obj.lstCountry = _unitOfWork.Repository<Country>().GetAll().ToList();
                    break;
                case "State":
                    obj.lstState = _unitOfWork.Repository<State>().GetAll().Where(c => c.CountryID == ID).ToList();
                    break;
                case "City":
                    obj.lstCity = _unitOfWork.Repository<City>().GetAll().Where(c => c.StateID == ID).ToList();
                    break;
                case "Skill":
                    obj.lstSkill = _unitOfWork.Repository<SkillSet>().GetAll().ToList();
                    break;
            }
            return obj;
        }
        public List<T> GetD<T>() where T : class
        {
            List<T> obj= _unitOfWork.Repository<T>().GetAll().ToList();

            //Expression<Func<T, bool>> predicate
            //if (predicate!=null)
            //{
                
            //}
            return obj;
        }
       
        public T GetDFirst<T>() where T : class
        {
            return _unitOfWork.Repository<T>().GetAll().FirstOrDefault();
            
        }
        public List<string> GetSkill()
        {
            return _unitOfWork.Repository<SkillSet>().GetAll().Select(c => c.Skill).ToList();
        }
        public List<string> GetCompanies()
        {
            return _unitOfWork.Repository<CompanyProfile>().GetAll().Select(c => c.CompanyName).ToList();
        }
        public List<CompanyProfile> getCompany(string CompanyName)
        {
            return _unitOfWork.Repository<CompanyProfile>().GetAll().Where(c => c.CompanyName == CompanyName).ToList();
        }
        public int UpdateCompany(CompanyProfile objCompany)
        {
            try
            {
                CompanyProfile Company = _unitOfWork.Repository<CompanyProfile>().FindById(objCompany.CompanyID);
                Company.NoofEmp = objCompany.NoofEmp;
                Company.PhNum = objCompany.PhNum;
                Company.UrlLink = objCompany.UrlLink;
                Company.UpdatedDate = DateTime.Now;
                Company.EmailID = objCompany.EmailID;
                Company.Domain = objCompany.Domain;
                Company.CompanyName = objCompany.CompanyName;
                Company.Address = objCompany.Address;
                Company.Branches = objCompany.Branches;
                _unitOfWork.Repository<CompanyProfile>().Update(Company);
                _unitOfWork.Save();
                return 1;
            }
            catch { return 0; }
            finally
            {
                objCompany = null;
            }
            
        }
        public List<CompanyProfile> getCompanies(int EmpID)
        {
            return _unitOfWork.Repository<CompanyProfile>().GetAll().Where(c => c.EmployerID == EmpID).ToList();
        }
        public IDictionary<string, List<string>> GetAutoCompleteData()
        {
            try
            {
                var objSkill = _unitOfWork.Repository<SkillSet>().GetAll().Select(a => a.Skill).ToList();
                var objCountry = _unitOfWork.Repository<Country>().GetAll().Select(b => b.CountryName).ToList();
                var objState = _unitOfWork.Repository<State>().GetAll().Select(c => c.StateName).ToList();
                var objCity = _unitOfWork.Repository<City>().GetAll().Select(c => c.CityName).ToList();
                var objJobPosition = _unitOfWork.Repository<Vacancy>().GetAll().Select(c => c.JobPosition).Distinct().ToList();
                var objCompany = _unitOfWork.Repository<CompanyProfile>().GetAll().Select(c => c.CompanyName).Distinct().ToList();
                var objQualification = _unitOfWork.Repository<Vacancy>().GetAll().Select(c => c.Qualification).Distinct().ToList();

                Dictionary<string, List<string>> objDic = new Dictionary<string, List<string>>();
                objDic.Add("Skill", objSkill);
                objDic.Add("Company",objCompany);
                objDic.Add("Country", objCountry);
                objDic.Add("State", objState);
                objDic.Add("City", objCity);
                objDic.Add("JobPosition",objJobPosition);
                objDic.Add("Qualification", objQualification);
                return objDic;
            }
            catch (Exception)
            {

                return null;
            }
        }

        //public T GetRes<T>(SearchDetails obj) where T : SearchDetails
        //{
        //    return _unitOfWork.Repository<T>().GetAll().Where(c => c.CompanyName == obj.Company).ToList();
        //}

        public virtual IEnumerable<T> GetDetails<T>(System.Linq.Expressions.Expression<Func<T, bool>> filter = null) where T : class
        {
            try
            {
                IQueryable<T> query = _unitOfWork.Repository<T>().GetAll().AsQueryable();
                if (filter != null)
                {
                    query = query.Where(filter);
                }
                return query.ToList();

            }
            catch (DbEntityValidationException ex)
            {
                //TODO: Exception Handling
                throw; //ex;
            }
            catch (EntityCommandExecutionException ex)
            {
                //TODO: Exception Handling
                throw; //ex;
            }
        }
    }
}
