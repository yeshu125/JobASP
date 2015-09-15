using JobASP.DataModels;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.Facade
{
    public interface ILoginBO
    {
        AuthLog Authenticate(Credantials ObjLogin);
        AuthLog AuthPwd(Credantials ObjCred);
    }
}
