namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedCommentDate : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Comments", "commentDate", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Comments", "commentDate");
        }
    }
}
