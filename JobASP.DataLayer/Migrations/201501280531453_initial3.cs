namespace JobASP.DataLayer.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial3 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Employers", "City", c => c.Int(nullable: false));
            AlterColumn("dbo.Employers", "State", c => c.Int(nullable: false));
            AlterColumn("dbo.Employers", "Country", c => c.Int(nullable: false));
            CreateIndex("dbo.Employers", "City");
            CreateIndex("dbo.Employers", "State");
            CreateIndex("dbo.Employers", "Country");
            AddForeignKey("dbo.Employers", "City", "dbo.Cities", "CityID");
            AddForeignKey("dbo.Employers", "Country", "dbo.Countries", "CountryID");
            AddForeignKey("dbo.Employers", "State", "dbo.States", "StateID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Employers", "State", "dbo.States");
            DropForeignKey("dbo.Employers", "Country", "dbo.Countries");
            DropForeignKey("dbo.Employers", "City", "dbo.Cities");
            DropIndex("dbo.Employers", new[] { "Country" });
            DropIndex("dbo.Employers", new[] { "State" });
            DropIndex("dbo.Employers", new[] { "City" });
            AlterColumn("dbo.Employers", "Country", c => c.String(nullable: false, maxLength: 15));
            AlterColumn("dbo.Employers", "State", c => c.String(nullable: false, maxLength: 30));
            AlterColumn("dbo.Employers", "City", c => c.String(nullable: false, maxLength: 30));
        }
    }
}
