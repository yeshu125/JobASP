using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace JobASP.DataModels
{
   public class Employer
    {
        [Key]
        [ScaffoldColumn(false)]
        public int EmpID { set; get; }
        [Required]
        [StringLength(35)]
        public string EmpName { set; get; }
        [Required]
        [StringLength(15)]
        public string EmpLName { set; get; }
        [Required]
        [DataType(DataType.Text)]
        public string Gender { set; get; }
        [Required]
        [StringLength(40)]
        public string CompanyName { set; get; }
        [StringLength(40)]
        public string ContactTitle { set; get; }
        [Required]
        [StringLength(30)]
        public string Designation { set; get; }
        [Required]
        [DataType(DataType.MultilineText)]
        public string Address { set; get; }
        [Required]
        public int City { set;get; }
        [Required]
        public int State { set; get; }
        [Required]
        public int Country { set; get; }
        [Required]
        [MaxLength(6),MinLength(6)]
        public string PostalCode { set; get; }
       
        [Required]
        [MaxLength(10),MinLength(10)]
        public string Phone { set; get; }
        [Required]
        [StringLength(40)]
        [Index("IndexCon", IsUnique = true)]
        [DataType(DataType.EmailAddress)]
        [RegularExpression("^[^@]+@[^@]+\\.[^@]+$")]
        public string EmailID { set; get; }

        [ForeignKey("Country")]
        public virtual Country Countries { set; get; }
        [ForeignKey("State")]
        public virtual State States { set; get; }
        [ForeignKey("City")]
        public virtual City Cities { set; get; }
    }
}
