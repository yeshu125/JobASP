using JobASP.DataLayer;
using JobASP.DataModels;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.Facade
{
    public class AddJobBO : IAddJobBO
    {
        #region "Unitofwork Reference"
        IUnitOfWork _unitOfWork = null;

        public AddJobBO(IUnitOfWork _unitOfWork)
        {
            this._unitOfWork = _unitOfWork;
        }
        public AddJobBO()
        {
            _unitOfWork = new UnitOfWork();
        }

        #endregion
        public int InsertNew<T>(T obj) where T : class
        {
            try
            {
                _unitOfWork.Repository<T>().Insert(obj);
                _unitOfWork.Save();
                return 1;
            }
            catch
            {
                return 0;
            }
            finally
            {
                obj = null;
            }
        }
        public int AddJob(Vacancy obj)
        {
            try
            {
                //obj.CompanyName = _unitOfWork.Repository<Employer>().GetAll().Where(c => c.EmpID == obj.EmpId).Select(c => c.CompanyName).FirstOrDefault();
                _unitOfWork.Repository<Vacancy>().Insert(obj);
                _unitOfWork.Save();
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
            finally
            {
                obj = null;
            }
            #region Using
            //using (JobASPContext context = new JobASPContext())
            //{
            //    try
            //    {
            //        Obj.Company = context.Employees.Where(c => c.EmpID == Obj.EmpId).Select(c => c.CompanyName).FirstOrDefault();
            //        context.Vacancies.Add(Obj);
            //        context.SaveChanges();
            //        return 1;
            //    }
            //    catch (Exception)
            //    {
            //        return 0;
            //    }

            //}
            #endregion
        }
        public int AddCompany(CompanyProfile objCompany)
        {
            try
            {
                _unitOfWork.Repository<CompanyProfile>().Insert(objCompany);
                _unitOfWork.Save();
                return 1;
            }
            catch (Exception)
            {

                return 0;
            }
            finally
            {
                objCompany = null;
            }
        }
        public int UpdateDetails<T>(T obj) where T : class
        {
            try
            {
                _unitOfWork.Repository<T>().Update(obj);
                _unitOfWork.Save();
                return 1;
            }
            catch (Exception)
            {

                return 0;
            }

        }
        public int UpdateJobDetails(Vacancy obj)
        {
            try
            {
                Vacancy objVac = _unitOfWork.Repository<Vacancy>().FindById(obj.JobID);
                objVac.VenueAddress = obj.VenueAddress;
                objVac.InterviewDate = obj.InterviewDate;
                //objVac.InterviewTime = obj.InterviewTime;
                _unitOfWork.Repository<Vacancy>().Update(objVac);
                _unitOfWork.Save();
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
            finally
            {
                obj = null;
            }
        }
        #region Other
        //public List<Vacancy> ListOfJobsbyState(Search objS)
        //{
        //    //string str = "Exec usp_GetUnAppliedJobs @ID,@State";
        //    //var e = new[] { new SqlParameter("ID", ID), new SqlParameter("State", State) };
        //    // var obj = _unitOfWork.Repository<Vacancy>().ExecuteProcedureForList(str, ID, State);
        //    var obj = _unitOfWork.Repository<JobApplied>().GetAll().Where(c => c.SeekerID == objS.ID).Select(x => x.JobID).ToList();
        //    var obj1 = _unitOfWork.Repository<Vacancy>().GetAll().Where(c => c.State == objS.Place).ToList();
        //    var test = obj1.Where(x => !obj.Contains(x.JobID)).Where(x => x.LastDate > DateTime.Now);
        //    return test.ToList();
        //    // _unitOfWork.Repository<JobApplied>().GetAll().Where(c => c.State == State).ToList();
        //}
        //public List<Vacancy> ListOfJobsbyCity(Search objS)
        //{
        //    var obj = _unitOfWork.Repository<JobApplied>().GetAll().Where(c => c.SeekerID == objS.ID).Select(x => x.JobID).ToList();
        //    var obj1 = _unitOfWork.Repository<Vacancy>().GetAll().Where(c => c.City == objS.Place).ToList();
        //    var test = obj1.Where(x => !obj.Contains(x.JobID)).Where(x => x.LastDate > DateTime.Now);
        //    return test.ToList();
        //}
        //public List<Vacancy> ListAllJobs(Search objS)
        //{
        //    var obj = _unitOfWork.Repository<JobApplied>().GetAll().Where(c => c.SeekerID == objS.ID).Select(x => x.JobID).ToList();
        //    var obj1 = _unitOfWork.Repository<Vacancy>().GetAll().ToList();
        //    var test = obj1.Where(x => !obj.Contains(x.JobID)).Where(x => x.LastDate > DateTime.Now);
        //    return test.ToList();
        //}
        #endregion
        public List<Vacancy> ListrptVacancy(SearchDetails Obj)
        {
            try
            {
                var obj = _unitOfWork.Repository<Vacancy>().GetAll();
                if (Obj.ID != 0)
                {
                    var obj1 = _unitOfWork.Repository<JobApplied>().GetAll().Where(c => c.SeekerID == Obj.ID).Select(x => x.JobID).ToList();
                    obj = obj.Where(x => !obj1.Contains(x.JobID));
                }
                if (Obj.JobID != 0)
                {
                    obj = obj.Where(x => x.JobID == Obj.JobID);
                }

                return obj.Where(x => x.LastDate > DateTime.Now).ToList();
            }
            finally
            {
                Obj = null;
            }
        }
        public List<Vacancy> ListVacancy(SearchDetails Obj)
        {
            try
            {
                var obj = _unitOfWork.Repository<Vacancy>().GetAll();
                if (Obj.JobID != 0)
                {
                    obj = obj.Where(x => x.JobID == Obj.JobID);
                }

                if (Obj.Skill != 0)
                {
                    obj = obj.Where(x => x.Skill == Obj.Skill);
                }
                if (Obj.Country!=0)
                {
                    obj = obj.Where(x => x.Country == Obj.Country);
                }
                if (Obj.State!=0)
                {
                    obj = obj.Where(x => x.State == Obj.State);
                }
                if (Obj.City!=0)
                {
                    obj = obj.Where(x => x.City == Obj.City);
                }
                if (!String.IsNullOrWhiteSpace(Obj.Company))
                {
                    obj = obj.Where(x => x.CompanyName == Obj.Company);
                }
                if (Obj.lstSkill != null && Obj.lstSkill.Count > 0)
                {
                    obj = obj.Where(c => Obj.lstSkill.Contains(c.Skill));
                }
                if (Obj.lstCountry != null && Obj.lstCountry.Count > 0)
                {
                    obj = obj.Where(c => Obj.lstCountry.Contains(c.Country));
                }
                if (Obj.lstState != null && Obj.lstState.Count > 0)
                {
                    obj = obj.Where(c => Obj.lstState.Contains(c.State));
                }
                if (Obj.lstCity != null && Obj.lstCity.Count > 0)
                {
                    obj = obj.Where(x => Obj.lstCity.Contains(x.City));
                }
                if (Obj.ID != 0)
                {
                    var obj1 = _unitOfWork.Repository<JobApplied>().GetAll().Where(c => c.SeekerID == Obj.ID).Select(x => x.JobID).ToList();
                    obj = obj.Where(x => !obj1.Contains(x.JobID));
                }
                if (Obj.EmpID != 0)
                {
                    return obj.Where(c => c.EmpId == Obj.EmpID).ToList();
                }
                return obj.Where(x => x.LastDate > DateTime.Now).ToList();
            }
            catch
            {
                return null;
            }
            finally
            {
                Obj = null;
            }
        }
        public List<QuerableList> ListRptJobData()
        {
            try
            {

                var objUrl = _unitOfWork.Repository<CompanyProfile>().GetAll().Select(c => new QuerableList() { ImageUrl = c.ImageUrl, CompanyName = c.CompanyName }).ToList();
                var obj = _unitOfWork.Repository<Vacancy>().GetAll().Select(c => new QuerableList() { JobPosition = c.JobPosition, City =_unitOfWork.Repository<City>().FindById(c.City).CityName, CompanyName = c.CompanyName }).ToList();
                return objUrl.Join(obj, a => a.CompanyName, b => b.CompanyName, (a, b) => new QuerableList { ImageUrl = a.ImageUrl, CompanyName = b.CompanyName, JobPosition = b.JobPosition, City = b.City }).Distinct().ToList();
            }
            catch
            {
                return null;
            }
        }
        public List<Vacancy> ListAutoVacancy(List<string> objlst, List<string> objLocation, string Experience, string salary)
        {
            try
            {
                var obj = _unitOfWork.Repository<Vacancy>().GetAll().ToList();

                //if (!String.IsNullOrWhiteSpace(objlst.Country))
                //{
                //    obj = obj.Where(x => x.Country == objlst.Country);
                //}
                //if (!String.IsNullOrWhiteSpace(objlst.State))
                //{
                //    obj = obj.Where(x => x.State == objlst.State);
                //}
                //if (!String.IsNullOrWhiteSpace(ObjSearch.City))
                //{
                //    obj = obj.Where(x => x.City == ObjSearch.City);
                //}
                objlst = objlst.ConvertAll(c => c.Trim().ToLower().Replace(" ", "")).ToList();
                if (objlst != null && objlst.Count > 0)
                {
                    //obj = obj.Where(c => c.Skill.Contains(ob));
                    var ob1 = _unitOfWork.Repository<SkillSet>().GetAll().Where(c => objlst.Contains(c.Skill.ToLower())).Select(c => c.SkillID).ToList();
                    var objSkill = obj.Where(c => ob1.Contains(c.Skill));
                    obj = obj.Where(c => objlst.Contains(c.CompanyName.ToLower()) ||
                                         objlst.Contains(c.JobPosition.ToLower()) ||
                                         objlst.Contains(c.Qualification.ToLower())).ToList();

                    //var objCompany=obj.Where(y=>objlst.Contains(y.CompanyName));

                    // var objJob=obj.Where(x=>objlst.Contains(x.JobPosition));

                    //var objQualification = obj.Where(x=>objlst.Contains(x.Qualification));

                    //obj = objCompany.Union(objJob).Union(objQualification);
                    obj = obj.Union(objSkill).ToList();
                }
                objLocation = objLocation.ConvertAll(c => c.Trim().ToLower());
                if (objLocation != null && objLocation.Count > 0)
                {
                    //obj= obj.Where(c => objLocation.Contains(c.Country.ToLower())||
                    //                    objLocation.Contains(c.State.ToLower())||
                    //                    objLocation.Contains(c.City.ToLower())).ToList();
                    var ob1 = _unitOfWork.Repository<Country>().GetAll().Where(c => objlst.Contains(c.CountryName.ToLower())).Select(c => c.CountryID).ToList();
                    var objCountry = obj.Where(c => ob1.Contains(c.State));
                    var ob2 = _unitOfWork.Repository<State>().GetAll().Where(c => objlst.Contains(c.StateName.ToLower())).Select(c => c.StateID).ToList();
                    var objState = obj.Where(c => ob2.Contains(c.State));
                    var ob3 = _unitOfWork.Repository<City>().GetAll().Where(c => objlst.Contains(c.CityName.ToLower())).Select(c => c.CityID).ToList();
                    var objCity = obj.Where(x => ob3.Contains(x.City));

                    obj = objCountry.Union(objState).Union(objCity).ToList();
                }
                if (!string.IsNullOrWhiteSpace(Experience))
                {
                    obj = obj.Where(x => x.Experience.ToLower() == Experience.ToLower()).ToList();
                }
                if (!string.IsNullOrWhiteSpace(salary) && salary != "0")
                {
                    obj = obj.Where(x => x.Salary.ToLower() == salary.ToLower()).ToList();
                }

                return obj.Distinct().ToList();
            }
            catch
            {
                return null;
            }
            finally
            {
                objlst = null;
            }
        }
        public List<Seeker> ListData(SearchDetails ObjSearch)
        {
            try
            {
                var obj = _unitOfWork.Repository<Seeker>().GetAll();
                if (ObjSearch.Skill != 0)
                {
                    obj = obj.Where(x => x.PrimarySkill == ObjSearch.Skill);
                }

                if (ObjSearch.Country!=0)
                {
                    obj = obj.Where(x => x.Country == ObjSearch.Country);
                }
                if (ObjSearch.State!=0)
                {
                    obj = obj.Where(x => x.State == ObjSearch.State);
                }
                if (ObjSearch.City!=0)
                {
                    obj = obj.Where(x => x.City == ObjSearch.City);
                }
                if (ObjSearch.lstSkill != null && ObjSearch.lstSkill.Count > 0)
                {
                    obj = obj.Where(c => ObjSearch.lstSkill.Contains(c.PrimarySkill));
                }
                if (ObjSearch.lstCountry != null && ObjSearch.lstCountry.Count > 0)
                {
                    obj = obj.Where(c => ObjSearch.lstCountry.Contains(c.Country));
                }
                if (ObjSearch.lstState != null && ObjSearch.lstState.Count > 0)
                {
                    obj = obj.Where(c => ObjSearch.lstState.Contains(c.State));
                }
                if (ObjSearch.lstCity != null && ObjSearch.lstCity.Count > 0)
                {
                    obj = obj.Where(x => ObjSearch.lstCity.Contains(x.City));
                }
                if (ObjSearch.JobID != 0)
                {
                    var obj1 = _unitOfWork.Repository<JobApplied>().GetAll().Where(x => x.JobID == ObjSearch.JobID).Select(c => c.SeekerID).ToList();
                    obj = obj.Where(x => obj1.Contains(x.SeekerID)).ToList();
                }
                return obj.ToList();
            }
            finally
            {
                ObjSearch = null;
            }

        }
        public int RemoveJob(int objVac)
        {
            try
            {
                Vacancy obj = _unitOfWork.Repository<Vacancy>().FindById(objVac);
                obj.JobValidity = "Closed";
                _unitOfWork.Repository<Vacancy>().Update(obj);
                _unitOfWork.Save();
                return 1;
            }
            catch (Exception)
            {

                return 0;
            }
        }

        //public int RemoveJob(Vacancy objVac)
        //{
        //    try
        //    {
        //        _unitOfWork.Repository<Vacancy>().Delete(objVac);
        //        _unitOfWork.Save();
        //        return 1;
        //    }
        //    catch (Exception)
        //    {

        //        return 0;
        //    }
        //}

        public int JQGridDetailsUpdate(Vacancy obj)
        {
            try
            {
                Vacancy objVac = _unitOfWork.Repository<Vacancy>().FindById(obj.JobID);
                objVac.JobPosition = obj.JobPosition;
                objVac.Skill = obj.Skill;
                objVac.City = obj.City;
                objVac.CompanyName = obj.CompanyName;
                objVac.Experience = obj.Experience;
                objVac.Qualification = obj.Qualification;
                objVac.LastDate = obj.LastDate;
                objVac.Experience = obj.Experience;
                objVac.Salary = obj.Salary;
                _unitOfWork.Repository<Vacancy>().Update(objVac);
                _unitOfWork.Save();
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
            finally
            {
                obj = null;
            }
        }

    }
}
