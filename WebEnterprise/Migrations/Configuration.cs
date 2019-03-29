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
            string[] roleNames = { "Admin", "QACoordinator", "QAManager", "Staff" };
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
                    var passwordHash = new PasswordHasher();
                    string password = passwordHash.HashPassword("QAcoordinator@123");
                    context.Users.AddOrUpdate(u => u.UserName, new ApplicationUser { deptId = 6, UserName = "QA@Coordinator.com", EmailConfirmed = true, PasswordHash = password, PhoneNumber = "12345678911", Email = "QA@Coordinator.com" });
                   // context.Roles.AddOrUpdate(new IdentityRole { Id = "a1f04ba5-5600-4a6e-be43-ae0d6360c0ab", Name = "QAcoordinator" });
                }
                catch (Exception ex)
                {
                    string message = ex.Message;
                    if (ex.InnerException != null)
                    {
                        string innerMessage = ex.Message;
                    }
                }

                //After .AddToRole insert the ("UserId", "UserRole ");
                //  var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
                //  UserManager.AddToRole("c1d97ec4-91e8-4ab9-975f-952ede444a7f", "Admin");

            }
        }
    }
}
