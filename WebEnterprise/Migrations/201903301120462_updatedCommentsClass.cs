namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedCommentsClass : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Comments", "Id", "dbo.AspNetUsers");
            DropForeignKey("dbo.Comments", "postId", "dbo.Posts");
            DropIndex("dbo.Comments", new[] { "postId" });
            DropIndex("dbo.Comments", new[] { "Id" });
            AlterColumn("dbo.Comments", "Id", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Comments", "Id", c => c.String(maxLength: 128));
            CreateIndex("dbo.Comments", "Id");
            CreateIndex("dbo.Comments", "postId");
            AddForeignKey("dbo.Comments", "postId", "dbo.Posts", "postId", cascadeDelete: true);
            AddForeignKey("dbo.Comments", "Id", "dbo.AspNetUsers", "Id");
        }
    }
}
