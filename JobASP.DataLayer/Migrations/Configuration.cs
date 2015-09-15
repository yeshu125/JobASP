namespace JobASP.DataLayer.Migrations
{
    using JobASP.DataModels;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<JobASP.DataLayer.JobASPContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(JobASP.DataLayer.JobASPContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            context.Countries.AddOrUpdate(
                c => c.CountryName,
                new Country { CountryName="India",CountryID=1 }
                );
            context.States.AddOrUpdate(
                c => c.StateName,
                new State { StateName = "AndhraPradesh", CountryID = 1 },
                new State { StateName = "Telangana", CountryID = 1 },
                new State { StateName = "TamilNadu", CountryID = 1 },
                new State { StateName = "Karnataka", CountryID = 1 }
                );
            context.Cities.AddOrUpdate(
                c => c.CityName,
                new City { CityName = "Vijayawada", StateID = 1 },
                new City { CityName = "Visakhapatnam", StateID = 1 },
                new City { CityName = "Tirupathi", StateID = 1 },
                new City { CityName = "Hyderabad", StateID = 2 },
                new City { CityName = "Chennai", StateID = 3 },
                new City { CityName = "Bangulur", StateID = 4 }
                );
            context.SkillSet.AddOrUpdate(
                c => c.Skill,
                new SkillSet { Skill = "Java" },
                new SkillSet { Skill = ".Net" },
                new SkillSet { Skill = "JavaScript" },
                new SkillSet { Skill="SQL"}
                );
        }
    }
}
