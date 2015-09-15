using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace JobASP.DataModels
{
  public class Admin
    {
        [Key]
        [ScaffoldColumn(true)]
        public int AdminID { set; get; }
        [Required]
        [StringLength(40)]
        public string AdminName { set; get; }
        [Required]
        [StringLength(40)]
        public string AdminLoc { set; get; }
    }
}
