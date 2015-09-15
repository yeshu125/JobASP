using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.DataModels
{
  public  class State
    {
        [Key]
        public int StateID { set; get; }
        public string StateName { set; get; }
        public int CountryID { set; get; }
      [ForeignKey("CountryID")]
        public virtual Country Country { set; get; }
    }
}
