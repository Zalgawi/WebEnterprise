namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class update : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.NewFiles", "bareFilename", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.NewFiles", "bareFilename");
        }
    }
}
