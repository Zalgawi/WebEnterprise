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

            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
            UserManager.AddToRole("97cb250d-b4b0-43cd-8888-cee206659085", "Admin");

        }
    }
}
