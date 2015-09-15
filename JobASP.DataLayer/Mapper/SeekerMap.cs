using JobASP.DataModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JobASP.DataLayer
{
    public class SeekerMap : EntityTypeConfiguration<Seeker>
    {
        public SeekerMap()
        {
            this.HasKey(t => t.SeekerID);
            this.ToTable("Seekers");
            this.Property(t => t.SeekerName).HasColumnName("SeekerName");
            this.Property(t => t.SeekerLName).HasColumnName("SeekerLName");
            this.Property(t => t.PostalCode).HasColumnName("PostalCode");
            this.Property(t => t.State).HasColumnName("State");
            this.Property(t => t.City).HasColumnName("City");
            this.Property(t => t.Phone).HasColumnName("Phone");
            this.Property(t => t.Gender).HasColumnName("Gender");
            this.Property(t => t.EmailID).HasColumnName("EmailID");
            this.Property(t => t.Designation).HasColumnName("Designation");
            this.Property(t => t.Country).HasColumnName("Country");
            this.Property(t => t.ContactTitle).HasColumnName("ContactTitle");
            this.Property(t => t.CompanyName).HasColumnName("CompanyName");
            this.Property(t => t.Address).HasColumnName("Address");
            this.Property(t => t.Resume).HasColumnName("Resume");
           
        }
    }
}
