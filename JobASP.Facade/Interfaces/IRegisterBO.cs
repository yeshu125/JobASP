using JobASP.DataModels;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.Facade
{
    public interface IRegisterBO
    {
         int AddSeeker(LoginSeeker ObjSeeker,Seeker Objs);
         int UpdateSeeker(Seeker seeker);
         int AddEmployer(LoginEmployer ObjEmployer,Employer Objs);
         int UpdatePwd(Credantials objCred);
         int UpdateSeekerDetails(Seeker objS);
         string ResumeData(int ID);
    }
}
