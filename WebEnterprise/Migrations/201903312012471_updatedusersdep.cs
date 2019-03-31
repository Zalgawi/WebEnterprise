namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedusersdep : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "deptName", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "deptName");
        }
    }
}
