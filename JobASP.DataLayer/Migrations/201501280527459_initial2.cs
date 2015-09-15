namespace JobASP.DataLayer.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial2 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Cities", "StateID", "dbo.States");
            DropForeignKey("dbo.States", "CountryID", "dbo.Countries");
            DropForeignKey("dbo.JobApplieds", "SeekerID", "dbo.Seekers");
            DropForeignKey("dbo.JobApplieds", "JobID", "dbo.Vacancies");
            DropForeignKey("dbo.Seekers", "PrimarySkill", "dbo.SkillSets");
            DropForeignKey("dbo.Vacancies", "City", "dbo.Cities");
            DropForeignKey("dbo.Vacancies", "Country", "dbo.Countries");
            DropForeignKey("dbo.Vacancies", "EmpId", "dbo.Employers");
            DropForeignKey("dbo.Vacancies", "Skill", "dbo.SkillSets");
            DropForeignKey("dbo.Vacancies", "State", "dbo.States");
            DropForeignKey("dbo.LoginEmployers", "EmployerID", "dbo.Employers");
            DropForeignKey("dbo.LoginSeekers", "SeekerID", "dbo.Seekers");
            CreateIndex("dbo.JobApplieds", "Skill");
            CreateIndex("dbo.JobApplieds", "City");
            CreateIndex("dbo.JobApplieds", "State");
            CreateIndex("dbo.JobApplieds", "Country");
            CreateIndex("dbo.Seekers", "Country");
            CreateIndex("dbo.Seekers", "State");
            CreateIndex("dbo.Seekers", "City");
            AddForeignKey("dbo.JobApplieds", "City", "dbo.Cities", "CityID");
            AddForeignKey("dbo.JobApplieds", "Country", "dbo.Countries", "CountryID");
            AddForeignKey("dbo.Seekers", "City", "dbo.Cities", "CityID");
            AddForeignKey("dbo.Seekers", "Country", "dbo.Countries", "CountryID");
            AddForeignKey("dbo.Seekers", "State", "dbo.States", "StateID");
            AddForeignKey("dbo.JobApplieds", "Skill", "dbo.SkillSets", "SkillID");
            AddForeignKey("dbo.JobApplieds", "State", "dbo.States", "StateID");
            AddForeignKey("dbo.Cities", "StateID", "dbo.States", "StateID");
            AddForeignKey("dbo.States", "CountryID", "dbo.Countries", "CountryID");
            AddForeignKey("dbo.JobApplieds", "SeekerID", "dbo.Seekers", "SeekerID");
            AddForeignKey("dbo.JobApplieds", "JobID", "dbo.Vacancies", "JobID");
            AddForeignKey("dbo.Seekers", "PrimarySkill", "dbo.SkillSets", "SkillID");
            AddForeignKey("dbo.Vacancies", "City", "dbo.Cities", "CityID");
            AddForeignKey("dbo.Vacancies", "Country", "dbo.Countries", "CountryID");
            AddForeignKey("dbo.Vacancies", "EmpId", "dbo.Employers", "EmpID");
            AddForeignKey("dbo.Vacancies", "Skill", "dbo.SkillSets", "SkillID");
            AddForeignKey("dbo.Vacancies", "State", "dbo.States", "StateID");
            AddForeignKey("dbo.LoginEmployers", "EmployerID", "dbo.Employers", "EmpID");
            AddForeignKey("dbo.LoginSeekers", "SeekerID", "dbo.Seekers", "SeekerID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.LoginSeekers", "SeekerID", "dbo.Seekers");
            DropForeignKey("dbo.LoginEmployers", "EmployerID", "dbo.Employers");
            DropForeignKey("dbo.Vacancies", "State", "dbo.States");
            DropForeignKey("dbo.Vacancies", "Skill", "dbo.SkillSets");
            DropForeignKey("dbo.Vacancies", "EmpId", "dbo.Employers");
            DropForeignKey("dbo.Vacancies", "Country", "dbo.Countries");
            DropForeignKey("dbo.Vacancies", "City", "dbo.Cities");
            DropForeignKey("dbo.Seekers", "PrimarySkill", "dbo.SkillSets");
            DropForeignKey("dbo.JobApplieds", "JobID", "dbo.Vacancies");
            DropForeignKey("dbo.JobApplieds", "SeekerID", "dbo.Seekers");
            DropForeignKey("dbo.States", "CountryID", "dbo.Countries");
            DropForeignKey("dbo.Cities", "StateID", "dbo.States");
            DropForeignKey("dbo.JobApplieds", "State", "dbo.States");
            DropForeignKey("dbo.JobApplieds", "Skill", "dbo.SkillSets");
            DropForeignKey("dbo.Seekers", "State", "dbo.States");
            DropForeignKey("dbo.Seekers", "Country", "dbo.Countries");
            DropForeignKey("dbo.Seekers", "City", "dbo.Cities");
            DropForeignKey("dbo.JobApplieds", "Country", "dbo.Countries");
            DropForeignKey("dbo.JobApplieds", "City", "dbo.Cities");
            DropIndex("dbo.Seekers", new[] { "City" });
            DropIndex("dbo.Seekers", new[] { "State" });
            DropIndex("dbo.Seekers", new[] { "Country" });
            DropIndex("dbo.JobApplieds", new[] { "Country" });
            DropIndex("dbo.JobApplieds", new[] { "State" });
            DropIndex("dbo.JobApplieds", new[] { "City" });
            DropIndex("dbo.JobApplieds", new[] { "Skill" });
            AddForeignKey("dbo.LoginSeekers", "SeekerID", "dbo.Seekers", "SeekerID", cascadeDelete: true);
            AddForeignKey("dbo.LoginEmployers", "EmployerID", "dbo.Employers", "EmpID", cascadeDelete: true);
            AddForeignKey("dbo.Vacancies", "State", "dbo.States", "StateID", cascadeDelete: false);
            AddForeignKey("dbo.Vacancies", "Skill", "dbo.SkillSets", "SkillID", cascadeDelete: false);
            AddForeignKey("dbo.Vacancies", "EmpId", "dbo.Employers", "EmpID", cascadeDelete: true);
            AddForeignKey("dbo.Vacancies", "Country", "dbo.Countries", "CountryID", cascadeDelete: false);
            AddForeignKey("dbo.Vacancies", "City", "dbo.Cities", "CityID", cascadeDelete: false);
            AddForeignKey("dbo.Seekers", "PrimarySkill", "dbo.SkillSets", "SkillID", cascadeDelete: false);
            AddForeignKey("dbo.JobApplieds", "JobID", "dbo.Vacancies", "JobID", cascadeDelete: true);
            AddForeignKey("dbo.JobApplieds", "SeekerID", "dbo.Seekers", "SeekerID", cascadeDelete: false);
            AddForeignKey("dbo.States", "CountryID", "dbo.Countries", "CountryID", cascadeDelete: false);
            AddForeignKey("dbo.Cities", "StateID", "dbo.States", "StateID", cascadeDelete: false);
        }
    }
}
