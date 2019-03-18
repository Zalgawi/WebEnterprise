namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addedPost : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Posts", "exampleone", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Posts", "exampleone");
        }
    }
}
