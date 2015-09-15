using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.DataModels
{
    public class CompanyProfile
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int CompanyID { set; get; }

        [StringLength(50)]
        public string CompanyName { set; get; }

        [StringLength(200)]
        public string AboutUs { set; get; }

        [StringLength(40)]
        public string Domain { set; get; }

        [StringLength(80)]
        public string Address { set; get; }
        public int NoofEmp { set; get; }

        [StringLength(80)]
        public string Branches { set; get; }

        [StringLength(40)]
        public string UrlLink { set; get; }

        [DataType(DataType.ImageUrl)]
        public string ImageUrl { set; get; }

        [Required]
        public int EmployerID { get; set; }
        [StringLength(40)]
        public string EmailID { set; get; }
        [MinLength(10),MaxLength(10)]
        public string PhNum { set; get; }
        [DataType(DataType.DateTime)]
        public DateTime InsertedDate { set; get; }

        [DataType(DataType.DateTime)]
        public DateTime UpdatedDate { set; get; }
    }
}
