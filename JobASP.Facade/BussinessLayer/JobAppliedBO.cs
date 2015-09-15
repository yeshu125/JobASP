using JobASP.DataLayer;
using JobASP.DataModels;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.Facade
{
    public class JobAppliedBO : IJobAppliedBO
    {
        #region "Unitofwork Reference"
        IUnitOfWork _unitOfWork = null;
        public JobAppliedBO(IUnitOfWork _unitOfWork)
        {
            this._unitOfWork = _unitOfWork;
        }
        public JobAppliedBO()
        {
            _unitOfWork = new UnitOfWork();
        }

        #endregion
        public int AddAppliedJob(JobApplied objJob)
        {
            try
            {
                var JobDetails = _unitOfWork.Repository<Vacancy>().GetAll().Where(c => c.JobID == objJob.JobID).FirstOrDefault();
                objJob.City = JobDetails.City;
                objJob.State = JobDetails.State;
                objJob.Country = JobDetails.Country;
                objJob.AppliedDate = DateTime.Now;
                objJob.CompanyName = JobDetails.CompanyName;
                objJob.JobPosition = JobDetails.JobPosition;
                objJob.LastDate = JobDetails.LastDate;
                objJob.Skill =Convert.ToInt32(JobDetails.Skill);
                objJob.JobStatus = "Applied";
                _unitOfWork.Repository<JobApplied>().Insert(objJob);
                _unitOfWork.Save();
                return 1;
                #region Using
                //using (JobASPContext context=new JobASPContext())
                //{
                //    var JobDetails = context.Vacancies.Where(c => c.JobID == objJob.JobID).FirstOrDefault();
                //    objJob.City = JobDetails.City;
                //    objJob.State = JobDetails.State;
                //    objJob.AppliedDate = DateTime.Now;
                //    objJob.CompanyName = JobDetails.Company;
                //    objJob.JobPosition = JobDetails.JobPosition;
                //    objJob.LastDate = JobDetails.LastDate;
                //    objJob.JobStatus = "Applied";
                //    context.JobApplies.Add(objJob);
                //    context.SaveChanges();
                //    return 1;
                //}
                #endregion
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public List<JobApplied> ListApplied(SearchDetails objDetails) 
        {
            var objList = _unitOfWork.Repository<JobApplied>().GetAll();
            if (objDetails.ID != 0)
            {
                objList = objList.Where(c => c.SeekerID == objDetails.ID);
            }
            if (objDetails.Country!=0)
            {
                objList = objList.Where(c => c.Country == objDetails.Country);
            }
            if (objDetails.State!=0)
            {
                objList = objList.Where(c => c.State == objDetails.State);
            }
            if (objDetails.City!=0)
            {
                objList = objList.Where(c => c.City == objDetails.City);
            }
            return objList.ToList();
        }
        public List<Seeker> ListOfSeekersApplied(int EmpID)
        {
            var obj1 = _unitOfWork.Repository<Vacancy>().GetAll().Where(c => c.EmpId == EmpID).Select(c => c.JobID).ToList();
            var obj = _unitOfWork.Repository<JobApplied>().GetAll().Where(c => obj1.Contains(c.JobID)).Select(c => c.SeekerID).ToList();
            return _unitOfWork.Repository<Seeker>().GetAll().Where(x => obj.Contains(x.SeekerID)).ToList();
        }
        public List<Seeker> ListofSeekersByJobID(int JobID)
        {
            var obj = _unitOfWork.Repository<JobApplied>().GetAll().Where(c => c.JobID == JobID).Select(c => c.SeekerID).ToList();
            return _unitOfWork.Repository<Seeker>().GetAll().Where(x => obj.Contains(x.SeekerID)).ToList();
        }
    }
}
