namespace WebEnterprise.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddedFilesTables : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.NewFiles",
                c => new
                    {
                        FileId = c.Int(nullable: false, identity: true),
                        postId = c.Int(nullable: false),
                        filePath = c.String(),
                    })
                .PrimaryKey(t => t.FileId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.NewFiles");
        }
    }
}
