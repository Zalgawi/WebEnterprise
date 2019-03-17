namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedComment : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Comments", "commentAnonymous", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Comments", "commentAnonymous");
        }
    }
}
