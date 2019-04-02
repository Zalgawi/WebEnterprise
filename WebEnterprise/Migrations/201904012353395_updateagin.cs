namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updateagin : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.NewFiles", "bareFilename");
        }
        
        public override void Down()
        {
            AddColumn("dbo.NewFiles", "bareFilename", c => c.String());
        }
    }
}
