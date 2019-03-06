namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatedTables : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Departments",
                c => new
                    {
                        deptId = c.Int(nullable: false, identity: true),
                        deptName = c.String(),
                    })
                .PrimaryKey(t => t.deptId);
            
            AddColumn("dbo.Comments", "commentBody", c => c.String());
            AddColumn("dbo.Posts", "postBody", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Posts", "postBody");
            DropColumn("dbo.Comments", "commentBody");
            DropTable("dbo.Departments");
        }
    }
}
