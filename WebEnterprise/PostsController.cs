using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using WebEnterprise.Models;

namespace WebEnterprise
{
    public class PostsController : ApiController
    {
       
        [HttpGet]
        public IHttpActionResult GetDataTables()
        {
            ApplicationUserManager _userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            ApplicationUser user = _userManager.FindByName<ApplicationUser, string>(HttpContext.Current.User.Identity.Name);

            var department = "";
            using (var _dbContext = new ApplicationDbContext())
            {
                department = _dbContext.Departments.FirstOrDefault(c => c.deptId == user.deptId).deptName;
            }

            List<Post> records;

            using (var _dbContext = new ApplicationDbContext())
            {
                records = _dbContext.Posts.Where(c => c.postDepartment == department).ToList();
            }

            return Json(records);
        }

    }
}