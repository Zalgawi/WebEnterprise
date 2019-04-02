using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
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


                var images = _dbContext.Files.Where(c => c.postId == postId).ToList();

                if(images == null || images.Count == 0)
                {
                    images = null;
                }

                //var latestPosts = _dbContext.Posts.Where(c => c.Id != null).ToList().OrderByDescending(c => c.postDate == postDate);

                PostImageAjaxModel postAndImages = new PostImageAjaxModel() {
                    post = post,
                    images = images
                    
                };
                
               

                return Json(postAndImages);
            }
        }

        [HttpGet]
        public IHttpActionResult ReportPost(string postId)
        {
            int postIdInt = Int32.Parse(postId);

            using (var _dbContext = new IdentityDbContext())
            {

                var roleId = _dbContext.Roles.FirstOrDefault(c => c.Name == "QAManager").Id;

                using (var _context = new ApplicationDbContext())
                {

                    var admin = _context.Users
                             .FirstOrDefault(u => u.Roles.Any(r => r.RoleId == roleId));
                             

                   

                    string from = ConfigurationManager.AppSettings["Email"].ToString(); //Replace this with your own correct Gmail Address

                    string to = admin.Email;//Replace this with the Email Address to whom you want to send the mail

                    MailMessage mail = new System.Net.Mail.MailMessage();
                    mail.To.Add(to);
                    mail.From = new MailAddress(from, "Site Master", System.Text.Encoding.UTF8);
                    mail.Subject = "Post reported";
                    mail.SubjectEncoding = System.Text.Encoding.UTF8;
                    mail.Body = "A post has been reported, click <a href='http://localhost:51089/PostDisplay?id=" + postIdInt + "'>here</a> to view post ";
                    mail.BodyEncoding = System.Text.Encoding.UTF8;
                    mail.IsBodyHtml = true;
                    mail.Priority = MailPriority.High;

                    SmtpClient client = new SmtpClient();
                    //Add the Creddentials- use your own email id and password

                    client.Credentials = new System.Net.NetworkCredential(from, ConfigurationManager.AppSettings["Password"].ToString());

                    client.Port = 587; // Gmail works on this port
                    client.Host = "smtp.gmail.com";
                    client.EnableSsl = true; //Gmail works on Server Secured Layer
                    try
                    {
                        client.Send(mail);
                    }
                    catch (Exception ex)
                    {
                        Exception ex2 = ex;
                        string errorMessage = string.Empty;
                        while (ex2 != null)
                        {
                            errorMessage += ex2.ToString();
                            ex2 = ex2.InnerException;
                        }
                        Debug.WriteLine("Email error: " + ex2.Message);
                        HttpContext.Current.Response.Write(errorMessage);
                    }
                }
            }





            return Json("reported");
        }

    }
}