namespace ReviewForIdentity.MVCTemplate.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class username : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.AspNetUsers", "FirstName", c => c.String(maxLength:25));
            AddColumn("dbo.AspNetUsers", "LastName", c => c.String(maxLength:25));
        }
        
        public override void Down()
        {
            DropColumn("dbo.AspNetUsers", "LastName");
            DropColumn("dbo.AspNetUsers", "FirstName");
        }
    }
}
