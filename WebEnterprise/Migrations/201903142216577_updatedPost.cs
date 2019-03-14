namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedPost : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Posts", "postDescription");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Posts", "postDescription", c => c.String());
        }
    }
}
