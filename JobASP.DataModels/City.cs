using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.DataModels
{
   public class City
    {
        public int CityID { get; set; }
        public string CityName { get; set; }
        public int StateID { get; set; }
       [ForeignKey("StateID")]
        public virtual State State { set; get; }
    }
}
