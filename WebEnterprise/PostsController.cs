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
        [ActionName("GetDataTables")]
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

        [ActionName("GetComments")]
        [HttpGet]
        public IHttpActionResult GetComment(string Id)
        {
            using (var _dbContext = new ApplicationDbContext())
            {
                int postId = int.Parse(Id);
                var comments = _dbContext.Comments.Where(c => c.postId == postId).ToList();

                return Json(comments);
            }
        }


        [HttpGet]
        public IHttpActionResult GetPost(string id)
        {
            using (var _dbContext = new ApplicationDbContext())
            {
                int postId = int.Parse(id);

                var post = _dbContext.Posts.FirstOrDefault(c => c.postId == postId);

                //var latestPosts = _dbContext.Posts.Where(c => c.Id != null).ToList().OrderByDescending(c => c.postDate == postDate);
                return Json(post);
            }
        }

    }
}