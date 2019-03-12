namespace WebEnterprise.Migrations
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using WebEnterprise.Models;

    internal sealed class Configuration : DbMigrationsConfiguration<WebEnterprise.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(WebEnterprise.Models.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data.

            //context.Roles.AddOrUpdate(r => r.Name,
            //    new IdentityRole { Name = "Admin"},
            //    new IdentityRole { Name = "QACoordinator" },
            //    new IdentityRole { Name = "QAManager" },
            //    new IdentityRole { Name = "Staff" }
            //    );

            //The following code adds the roles to the AspNetRoles database.
            var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            string[] roleNames = { "Admin", "QACoordinator", "QAManager", "Staff" };
            IdentityResult roleResult;
            foreach (var roleName in roleNames)
            {
                if (!RoleManager.RoleExists(roleName))
                {
                    roleResult = RoleManager.Create(new IdentityRole(roleName));
                }
            }

            //After .AddToRole insert the ("UserId", "UserRole ");
          //  var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
          //  UserManager.AddToRole("c1d97ec4-91e8-4ab9-975f-952ede444a7f", "Admin");

        }
    }
}
