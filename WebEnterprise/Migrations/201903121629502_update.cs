namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class update : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Posts", "postLikes", c => c.String());
            AddColumn("dbo.Posts", "postDislikes", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Posts", "postDislikes");
            DropColumn("dbo.Posts", "postLikes");
        }
    }
}
