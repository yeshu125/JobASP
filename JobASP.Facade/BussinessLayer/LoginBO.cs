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
    public class LoginBO : ILoginBO
    {
        #region "Unitofwork Reference"
        IUnitOfWork _unitOfWork = null;

        public LoginBO(IUnitOfWork _unitOfWork)
        {
            this._unitOfWork = _unitOfWork;
        }
        public LoginBO()
        {
            _unitOfWork = new UnitOfWork();
        }

        #endregion
        public AuthLog Authenticate(Credantials ObjLogin)
        {
            AuthLog objLog = new AuthLog();
                var obj= _unitOfWork.Repository<LoginSeeker>().GetAll().Where(c => c.EmailID == ObjLogin.EmailID).Where(c => c.Password == ObjLogin.Password).Select(c=>c.SeekerID).FirstOrDefault();
                if (obj == 0)
                {
                    obj = _unitOfWork.Repository<LoginEmployer>().GetAll().Where(c => c.EmailID == ObjLogin.EmailID).Where(c => c.Password == ObjLogin.Password).Select(c => c.EmployerID).FirstOrDefault();
                    if (obj != 0)
                    {
                        objLog.ID = obj;
                        objLog.Type = "Employer";
                    }
                }
                else
                {
                    objLog.ID = obj;
                    objLog.Type = "Seeker";
                }
                
               return objLog; 
               
        }
        public AuthLog AuthPwd(Credantials ObjCred)
        {
            AuthLog objLog = new AuthLog();
            var obj = _unitOfWork.Repository<LoginSeeker>().GetAll().Where(c => c.EmailID == ObjCred.EmailID).Select(c => c.Password).FirstOrDefault();
            if (obj == null)
            {
                obj = _unitOfWork.Repository<LoginEmployer>().GetAll().Where(c => c.EmailID == ObjCred.EmailID).Select(c => c.Password).FirstOrDefault();
                if (obj != null)
                {
                    objLog.Pwd = obj;
                    objLog.Type = "Employer";
                }
            }
            else
            {
                objLog.Pwd = obj;
                objLog.Type = "Seeker";
            }

            return objLog; 
        }
    }
}
