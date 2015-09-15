using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.DataModels
{
    [Table("Vacancies")]
    public class Vacancy
    {
        [Key]
        [ScaffoldColumn(false)]
        public int JobID { set; get; }
        [ScaffoldColumn(false)]
        [Required]
        public int EmpId { set; get; }
        [Required]
        [StringLength(40)]
        public string JobPosition { set; get; }
        [Required]
        [StringLength(40)]
        public string CompanyName { set; get; }
        [ScaffoldColumn(false)]
        [DataType(DataType.DateTime)]
        public DateTime PostedDate { set; get; }
        [Required]
        [DataType(DataType.DateTime)]
        public DateTime LastDate { set; get; }
        [Required]
        public int Skill { get; set; }
        [StringLength(60)]
        public string OtherSkills { set; get; }
        [StringLength(200)]
        [DataType(DataType.MultilineText)]
        public string JobDescription { set; get; }
        [StringLength(40)]
        public string Qualification { set; get; }
        [Required]
       
        public int City { set; get; }
        [Required]
  
        public int State { set; get; }
        [Required]
      
        public int Country { set; get; }
        public string Experience { get; set; }
        public string Salary { get; set; }
        public string CompanyUrl { get;set; }
        [DataType(DataType.MultilineText)]
        public string VenueAddress { set; get; }
        [DataType(DataType.DateTime)]
        public DateTime InterviewDate { set; get; }
        public bool JobStatus { set; get; }
        public string JobValidity { set; get; }
        [ForeignKey("EmpId")]
        public virtual Employer Employer { set; get; }
        [ForeignKey("Skill")]
        public virtual SkillSet Skills { set; get; }
        [ForeignKey("Country")]
        public virtual Country Countries { set; get; }
        [ForeignKey("State")]
        public virtual State States { set; get; }
        [ForeignKey("City")]
        public virtual City Cities { set; get; }
    }
}
