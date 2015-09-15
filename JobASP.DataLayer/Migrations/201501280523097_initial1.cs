namespace JobASP.DataLayer.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial1 : DbMigration
    {
        public override void Up()
        {
            CreateIndex("dbo.Vacancies", "Skill");
            CreateIndex("dbo.Vacancies", "City");
            CreateIndex("dbo.Vacancies", "State");
            CreateIndex("dbo.Vacancies", "Country");
            AddForeignKey("dbo.Vacancies", "City", "dbo.Cities", "CityID", cascadeDelete: false);
            AddForeignKey("dbo.Vacancies", "Country", "dbo.Countries", "CountryID", cascadeDelete: false);
            AddForeignKey("dbo.Vacancies", "Skill", "dbo.SkillSets", "SkillID", cascadeDelete: false);
            AddForeignKey("dbo.Vacancies", "State", "dbo.States", "StateID", cascadeDelete: false);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Vacancies", "State", "dbo.States");
            DropForeignKey("dbo.Vacancies", "Skill", "dbo.SkillSets");
            DropForeignKey("dbo.Vacancies", "Country", "dbo.Countries");
            DropForeignKey("dbo.Vacancies", "City", "dbo.Cities");
            DropIndex("dbo.Vacancies", new[] { "Country" });
            DropIndex("dbo.Vacancies", new[] { "State" });
            DropIndex("dbo.Vacancies", new[] { "City" });
            DropIndex("dbo.Vacancies", new[] { "Skill" });
        }
    }
}
