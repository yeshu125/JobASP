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
    public class RegisterBO : IRegisterBO
    {
        #region "Unitofwork Reference"
        IUnitOfWork _unitOfWork = null;

        public RegisterBO(IUnitOfWork _unitOfWork)
        {
            this._unitOfWork = _unitOfWork;
        }
        public RegisterBO()
        {
            _unitOfWork = new UnitOfWork();
        }

        #endregion
        public int AddSeeker(LoginSeeker ObjSeeker, Seeker Objs)
        {
            try
            {
                _unitOfWork.Repository<Seeker>().Insert(Objs);
                // _unitOfWork.Save();
                ObjSeeker.SeekerID = _unitOfWork.Repository<Seeker>().GetAll().Where(c => c.EmailID == Objs.EmailID).Select(c => c.SeekerID).FirstOrDefault();
                _unitOfWork.Repository<LoginSeeker>().Insert(ObjSeeker);
                _unitOfWork.Save();
                return 1;
            }
            catch (Exception)
            {

                return 0;
            }

            //using (JobASPContext context = new JobASPContext())
            //{
            //    try
            //    {
            //        context.Seekers.Add(Objs);
            //        context.SaveChanges();
            //        ObjSeeker.SeekerID = context.Seekers.Where(c => c.EmailID == Objs.EmailID).Select(c => c.SeekerID).FirstOrDefault();
            //        context.LoginSeeker.Add(ObjSeeker);
            //        context.SaveChanges();
            //        return 1;
            //    }
            //    catch (Exception)
            //    {
            //        return 0;
            //    }
            //}
        }
        public int AddEmployer(LoginEmployer ObjEmp, Employer ObjE)
        {
            try
            {
                _unitOfWork.Repository<Employer>().Insert(ObjE);
                //_unitOfWork.Save();
                ObjEmp.EmployerID = _unitOfWork.Repository<Employer>().GetAll().Where(c => c.EmailID == ObjE.EmailID).Select(c => c.EmpID).FirstOrDefault();
                _unitOfWork.Repository<LoginEmployer>().Insert(ObjEmp);
                _unitOfWork.Save();
                return 1;
            }
            catch (Exception)
            {

                return 0;
            }

            //using (JobASPContext context = new JobASPContext())
            //{
            //    try
            //    {
            //        context.Employees.Add(ObjE);
            //        context.SaveChanges();
            //        ObjEmp.EmployerID = context.Employees.Where(c => c.EmailID == ObjEmp.EmailID).Select(c => c.EmpID).FirstOrDefault();
            //        context.LoginEmployer.Add(ObjEmp);
            //        context.SaveChanges();
            //        return 1;
            //    }
            //    catch (Exception)
            //    {

            //        return 0;
            //    }

            //}

        }
        public int UpdateSeeker(Seeker seeker)
        {
            try
            {
                var data = _unitOfWork.Repository<Seeker>().FindById(seeker.SeekerID);
                data.Resume = seeker.Resume;
                _unitOfWork.Repository<Seeker>().Update(data);
                _unitOfWork.Save();
                return 1;
                //using (JobASPContext context = new JobASPContext())
                //{
                //    var obj = context.Seekers.Where(c => c.SeekerID == seeker.SeekerID).SingleOrDefault();
                //    obj.Resume = seeker.Resume;
                //    context.SaveChanges();
                //    return 1;
                //}   
            }
            catch { return 0; }
        }
        public int UpdateEmployer(Employer objEmployer)
        {
            try
            {
                var data = _unitOfWork.Repository<Employer>().FindById(objEmployer.EmpID);
                data.EmpName = objEmployer.EmpName;
                data.EmpLName = objEmployer.EmpLName;
                data.CompanyName = objEmployer.CompanyName;
                data.Address = objEmployer.Address;
                data.Country = objEmployer.Country;
                data.State = objEmployer.State;
                data.City = objEmployer.City;
                data.Designation = objEmployer.Designation;
                data.PostalCode = objEmployer.PostalCode;
                data.Phone = objEmployer.Phone;
                _unitOfWork.Repository<Employer>().Update(data);
                _unitOfWork.Save();
                return 1;
            }
            catch
            {
                return 0;
            }
            finally
            {
                objEmployer = null;
            }
        }
        public int UpdatePwd(Credantials objCred)
        {
            try
            {
                var objSeeker = _unitOfWork.Repository<LoginSeeker>().GetAll().Where(c => c.SeekerID == objCred.ID).Where(c => c.Password == objCred.Password).FirstOrDefault();
                if (objSeeker == null)
                {
                    var objEmp = _unitOfWork.Repository<LoginEmployer>().GetAll().Where(c => c.EmployerID == objCred.ID).Where(c => c.Password == objCred.Password).FirstOrDefault();
                    if (objEmp != null)
                    {
                        objEmp.Password = objCred.NewPassword;
                        _unitOfWork.Repository<LoginEmployer>().Update(objEmp);
                        return 1;
                    }
                    return 2;
                }
                else
                {
                    objSeeker.Password = objCred.NewPassword;
                    _unitOfWork.Repository<LoginSeeker>().Update(objSeeker);
                    return 1;
                }
            }
            catch
            {
                return 0;
            }
            finally
            {
                objCred = null;
            }
        }
        public int UpdateSeekerDetails(Seeker objS)
        {
            try
            {
                var data = _unitOfWork.Repository<Seeker>().FindById(objS.SeekerID);
                data.SeekerName = objS.SeekerName;
                data.SeekerLName = objS.SeekerLName;
                data.DOB = objS.DOB;
                data.Country = objS.Country;
                data.State = objS.State;
                data.City = objS.City;
                data.Industry = objS.Industry;
                data.PrimarySkill = objS.PrimarySkill;
                data.SkillSet = objS.SkillSet;
                data.Experience = objS.Experience;
                data.TenthPercent = objS.TenthPercent;
                data.InterPercent = objS.InterPercent;
                data.GraduationPercent = objS.GraduationPercent;
                data.PGPercent = objS.PGPercent;
                data.Phone = objS.Phone;
                _unitOfWork.Repository<Seeker>().Update(data);
                _unitOfWork.Save();
                return 1;
            }
            catch { return 0; }
        }
        public string ResumeData(int ID)
        {
            var obj = _unitOfWork.Repository<Seeker>().GetAll().Where(c => c.SeekerID == ID).Select(x => x.Resume).SingleOrDefault();
            return (obj);
        }
    }
}
