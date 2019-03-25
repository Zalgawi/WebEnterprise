namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedlikesordislikes : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Posts", "postLikes", c => c.Int(nullable: false));
            AddColumn("dbo.Posts", "postDislikes", c => c.Int(nullable: false));
            DropColumn("dbo.Posts", "likeORdislike");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Posts", "likeORdislike", c => c.Boolean(nullable: false));
            DropColumn("dbo.Posts", "postDislikes");
            DropColumn("dbo.Posts", "postLikes");
        }
    }
}
