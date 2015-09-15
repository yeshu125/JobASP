using JobASP.DataModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.DataModels
{
    public class JobApplied
    {
        [Key]
        public int JobAppliedID { get; set; }
        [Required]
       
        public int SeekerID { get; set; }
        [Required]
        [ForeignKey("Vacancy")]
        public int JobID { set; get; }
        [Required]
        public String JobPosition { set; get; }
        public String CompanyName { set; get; }
        [Required]
        [DataType(DataType.DateTime)]
        public DateTime AppliedDate { set; get; }
        [DataType(DataType.DateTime)]
        public DateTime LastDate { set; get; }
        [MaxLength(10)]
        public string JobStatus { set; get; }
        [Required]
        public int Skill { set; get; }
        [Required]
        public int City { get; set; }
        [Required]
        public int State { get; set; }
        [Required]
        public int Country { set; get; }
        [ForeignKey("SeekerID")]
        public virtual Seeker Seeker { get; set; }
        
        public virtual Vacancy Vacancy { get; set; }

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
