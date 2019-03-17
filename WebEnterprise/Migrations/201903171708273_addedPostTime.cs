namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addedPostTime : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Posts", "postDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Posts", "postDate");
        }
    }
}
