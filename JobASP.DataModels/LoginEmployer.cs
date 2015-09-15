using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.DataModels
{
   public class LoginEmployer
    {
        [Key]
        public int LogID { get; set; }
        [Required]
        public int EmployerID { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        public string EmailID { set; get; }
        [ForeignKey("EmployerID")]
        public virtual Employer Employer { get; set; }
    }
}
