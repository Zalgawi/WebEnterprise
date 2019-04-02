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

            context.Departments.AddOrUpdate(r => r.deptName,
                    new Department { deptName = "Computing" },
                    new Department { deptName = "Humanities" },
                    new Department { deptName = "Music" },
                    new Department { deptName = "Medicine" },
                    new Department { deptName = "Business" },
                    new Department { deptName = "Other"}
                    );

            //The following code adds the roles to the AspNetRoles database.
            var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            string[] roleNames = {"QACoordinator", "QAManager", "Staff" };
            IdentityResult roleResult;
            foreach (var roleName in roleNames)
            {
                if (!RoleManager.RoleExists(roleName))
                {
                    roleResult = RoleManager.Create(new IdentityRole(roleName));
                }
            }

            {
                try
                {
                    //var passwordHash = new PasswordHasher();
                    //string password6 = passwordHash.HashPassword("QAmanager@6");
                    //context.Users.AddOrUpdate(u => u.UserName, new ApplicationUser {Id = "87ax99c7-bde5-4875-aaf1-bc0a96e9f24f", deptId = 6, deptName = "Other", UserName = "QA@Manager.com", EmailConfirmed = true, PasswordHash = password6, Email = "QA@Manager.com" });
                                       
                    ////After .AddToRole insert the ("UserId", "UserRole ");
                    var UserManager1 = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
                    UserManager1.AddToRole("87cd99c7-bde5-4875-aaf1-bc0a96e9f24f", "QAManager");                   

                }
                catch (Exception ex)
                {
                    string message = ex.Message;
                    if (ex.InnerException != null)
                    {
                        string innerMessage = ex.Message;
                    }
                }                              

            }
        }
    }
}
