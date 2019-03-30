namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddingEmailToComments : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Comments", "Email", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Comments", "Email");
        }
    }
}
