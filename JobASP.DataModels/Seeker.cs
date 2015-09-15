using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;


namespace JobASP.DataModels
{
    public class Seeker
    {

        [Key]
        [Column(Order = 1)]
        [ScaffoldColumn(false)]
        public int SeekerID { get; set; }
        [Required]
        [StringLength(35)]
        public string SeekerName { get; set; }
        [Required]
        [StringLength(15)]
        public string SeekerLName { get; set; }
        [Required]
        [DataType(DataType.Text)]
        public string Gender { set; get; }
        [Required]
        [DataType(DataType.DateTime)]
        public DateTime DOB { set; get; }
        [Required]
        public int Country { get; set; }
        [Required]
        public int State { get; set; }
        [Required]
        public int City { get; set; }

        [StringLength(40)]
        public string Industry { set; get; }

        public int PrimarySkill { set; get; }
        [StringLength(50)]
        public string SkillSet { set; get; }

        public int Experience { set; get; }
        public int TenthPercent {set; get;}
        public int InterPercent { set; get; }
        public int GraduationPercent { set; get; }
        public int PGPercent { set; get; }
        public string GraduationType { set; get; }
        [Required]
        [MaxLength(10), MinLength(10)]
        public string Phone { get; set; }
        [Required]
        [StringLength(40)]
        [Column(Order = 2)]
        [Index("IndexCon", IsUnique = true)]
        [DataType(DataType.EmailAddress)]
        [RegularExpression("^[^@]+@[^@]+\\.[^@]+$")]
        public string EmailID { set; get; }

        public string Resume { set; get; }
        [ForeignKey("PrimarySkill")]
        public virtual SkillSet Skills { set; get; }

        [ForeignKey("Country")]
        public virtual Country Countries { set; get; }
        [ForeignKey("State")]
        public virtual State States { set; get; }
        [ForeignKey("City")]
        public virtual City Cities { set; get; }
    }





    public class SkillSet {
        [Key]
        public int SkillID { set; get; }
        [StringLength(30)]
        public string Skill { set; get; }
    }
}
