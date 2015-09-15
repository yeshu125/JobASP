using JobASP.DataModels;
using System;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Reflection;


namespace JobASP.DataLayer
{
    public class JobASPContext : DbContext,IDbContext
    {
        public JobASPContext()
            : base("JobASPContext")
        {
           
        }
        public new IDbSet<T> Set<T>() where T : class
        {
            return base.Set<T>();
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            var typesToRegister = Assembly.GetExecutingAssembly().GetTypes()
          .Where(type => !String.IsNullOrEmpty(type.Namespace))
          .Where(type => type.BaseType != null && type.BaseType.IsGenericType
               && type.BaseType.GetGenericTypeDefinition() == typeof(EntityTypeConfiguration<>));
            foreach (var type in typesToRegister)
            {
                dynamic configurationInstance = Activator.CreateInstance(type);
                modelBuilder.Configurations.Add(configurationInstance);
            }
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();   
            base.OnModelCreating(modelBuilder);
        }
       
        public DbSet<Admin> Admins { get; set; }
        public DbSet<Seeker> Seekers { get; set; }
        public DbSet<JobApplied> JobApplies { get; set; }
        public DbSet<Vacancy> Vacancies { get; set; }
        public DbSet<Employer> Employees { get; set; }
        public DbSet<Country> Countries { get; set;}
        public DbSet<State> States { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<LoginSeeker> LoginSeeker { get; set; }
        public DbSet<LoginEmployer> LoginEmployer { get; set; }
        public DbSet<SkillSet> SkillSet { set; get; }
        public DbSet<CompanyProfile> Companies { set; get; }
    }
}
