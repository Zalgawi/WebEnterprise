using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.Security;
using System.Xml.Linq;
using WebEnterprise.Models;


[assembly: OwinStartupAttribute(typeof(WebEnterprise.Startup))]
namespace WebEnterprise
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);

        }
    //    private async Task CreateRoles(ApplicationDbContext context, IServiceProvider serviceProvider)
    //    { 

    //    var UserManager = serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();
    //    var RoleManager = serviceProvider.GetRequiredService<RoleManager<IdentityRole>>();
    //    List<IdentityRole> roles = new List<IdentityRole>();
    //    Roles.Add(Newtonsoft IdentityRole { XName = "Admin", NormalizedName = "ADMIN"});
    //    Roles.Add(Newtonsoft IdentityRole { XName = "QACoordinator", NormalizedName = "QACOORDINATOR"});
    //    Roles.Add(Newtonsoft IdentityRole { XName = "QAManager", NormalizedName = "QAMANAGER"});
    //    Roles.Add(Newtonsoft IdentityRole { XName = "Staff", NormalizedName = "STAFF"});
    
    //}
    }
    }