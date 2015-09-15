using JobASP.DataModels;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.ViewModels
{
    public class Search
    {
        public int ID { set; get; }
        public string Place { set; get; }
        public string Skill { get; set; }
    }
    public class AuthLog
    {
        public int ID { set; get; }
        public string Type { set; get; }
        public string Pwd { set; get; }
    }
    public class Credantials
    {
        public int ID { set; get; }
        public string EmailID { set; get; }
        public string Password { set; get; }
        public string NewPassword { set; get; }
    }
    public class Details
    {
        public List<Country> lstCountry { set; get; }
        public List<State> lstState { set; get; }
        public List<City> lstCity { set; get; }
        public List<SkillSet> lstSkill { set; get; }
        //public List<T> lst { set; get; }
    }
    public class SearchDetails
    {
        public int ID { set; get; }
        public int JobID { set; get; }
        public int EmpID { set; get; }
        public int Skill { get; set; }
        public int Country { set; get; }
        public int State { set; get; }
        public int City { set; get; }
        public string Company { set; get; }
        public List<int> lstCountry { set; get; }
        public List<int> lstState { set; get; }
        public List<int> lstCity { set; get; }
        public List<int> lstSkill { set; get; }

    }
    public class QuerableList : IEnumerable
    {
        List<QuerableList> obj;
        public string ImageUrl { set; get; }
        public string JobPosition { get; set; }
        public string City { get; set; }
        public string CompanyName { get; set; }
        public QuerableList()
        {
            obj= new List<QuerableList>();
        }
        public void Add(QuerableList item)
        {
            obj.Add(item);
        }
        public IEnumerator GetEnumerator()
        {
            yield return obj;
        }
    }
   
}
