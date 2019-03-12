namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class inititate : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Posts", "postTitle", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Posts", "postTitle");
        }
    }
}
