using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.DataModels
{
    public class LoginSeeker
    {
        [Key]
        public int LogID { get; set; }
        [Required]
        [ForeignKey("Seeker")]
        public int SeekerID { get; set; }
        [Required]
        public string EmailID { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
       
        public virtual Seeker Seeker { get; set; }
    }
}
