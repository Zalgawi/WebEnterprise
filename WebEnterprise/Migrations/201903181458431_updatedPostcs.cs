namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedPostcs : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Posts", "exampleone");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Posts", "exampleone", c => c.Int(nullable: false));
        }
    }
}
