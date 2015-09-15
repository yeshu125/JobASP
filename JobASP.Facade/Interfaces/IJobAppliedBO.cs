using JobASP.DataModels;
using JobASP.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.Facade
{
    public interface IJobAppliedBO
    {
        int AddAppliedJob(JobApplied ObjJob);
        List<JobApplied> ListApplied(SearchDetails objDetails);
        List<Seeker> ListOfSeekersApplied(int ID);
        List<Seeker> ListofSeekersByJobID(int ID);
    }
}
