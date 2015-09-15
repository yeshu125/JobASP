namespace JobASP.DataLayer.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.JobApplieds", "Skill", c => c.Int(nullable: false));
            AlterColumn("dbo.JobApplieds", "City", c => c.Int(nullable: false));
            AlterColumn("dbo.JobApplieds", "State", c => c.Int(nullable: false));
            AlterColumn("dbo.JobApplieds", "Country", c => c.Int(nullable: false));
            AlterColumn("dbo.Seekers", "Country", c => c.Int(nullable: false));
            AlterColumn("dbo.Seekers", "State", c => c.Int(nullable: false));
            AlterColumn("dbo.Seekers", "City", c => c.Int(nullable: false));
            AlterColumn("dbo.Seekers", "PrimarySkill", c => c.Int(nullable: false));
            AlterColumn("dbo.Vacancies", "Skill", c => c.Int(nullable: false));
            AlterColumn("dbo.Vacancies", "City", c => c.Int(nullable: false));
            AlterColumn("dbo.Vacancies", "State", c => c.Int(nullable: false));
            AlterColumn("dbo.Vacancies", "Country", c => c.Int(nullable: false));
            CreateIndex("dbo.Seekers", "PrimarySkill");
            AddForeignKey("dbo.Seekers", "PrimarySkill", "dbo.SkillSets", "SkillID", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Seekers", "PrimarySkill", "dbo.SkillSets");
            DropIndex("dbo.Seekers", new[] { "PrimarySkill" });
            AlterColumn("dbo.Vacancies", "Country", c => c.String(nullable: false, maxLength: 40));
            AlterColumn("dbo.Vacancies", "State", c => c.String(nullable: false, maxLength: 40));
            AlterColumn("dbo.Vacancies", "City", c => c.String(nullable: false, maxLength: 40));
            AlterColumn("dbo.Vacancies", "Skill", c => c.String(nullable: false));
            AlterColumn("dbo.Seekers", "PrimarySkill", c => c.String(maxLength: 20));
            AlterColumn("dbo.Seekers", "City", c => c.String(nullable: false, maxLength: 30));
            AlterColumn("dbo.Seekers", "State", c => c.String(nullable: false, maxLength: 30));
            AlterColumn("dbo.Seekers", "Country", c => c.String(nullable: false, maxLength: 30));
            AlterColumn("dbo.JobApplieds", "Country", c => c.String(nullable: false));
            AlterColumn("dbo.JobApplieds", "State", c => c.String(nullable: false));
            AlterColumn("dbo.JobApplieds", "City", c => c.String(nullable: false));
            AlterColumn("dbo.JobApplieds", "Skill", c => c.String(nullable: false));
        }
    }
}
