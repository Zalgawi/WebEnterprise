namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedd : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Posts", "likeORdislike", c => c.Boolean(nullable: false));
            DropColumn("dbo.Posts", "postLikes");
            DropColumn("dbo.Posts", "postDislikes");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Posts", "postDislikes", c => c.String());
            AddColumn("dbo.Posts", "postLikes", c => c.String());
            DropColumn("dbo.Posts", "likeORdislike");
        }
    }
}
