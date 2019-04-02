using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using WebEnterprise.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Web.Services.Description;
using System.Net;
using System.Net.Mail;
using System.IO;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Diagnostics;

namespace WebEnterprise
{
    public partial class Feed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {
                string strCurrentUserId = User.Identity.GetUserId();
                Response.Redirect("/Account/Login", true);

            }

        }

        protected void AddPost(object sender, EventArgs e)
        {

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var userID = "";
            var userEmail = "";
            var department = "";

            ApplicationUserManager _userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            ApplicationUser user = _userManager.FindByName<ApplicationUser, string>(HttpContext.Current.User.Identity.Name);

            if (inputAnonymous.SelectedValue == "0")
            {
              

                userID = user.Id;
                userEmail = user.Email;

               
            }

            using (var _dbContext = new ApplicationDbContext())
            {
                department = _dbContext.Departments.FirstOrDefault(c => c.deptId == user.deptId).deptName;
            }


            Post newPost = new Post()
            {
                postTitle = inputTitle.Text,
                postBody = inputBody.Text,
                postCategory = inputCategory.SelectedValue,
                postAnonymous = Convert.ToBoolean(Int32.Parse(inputAnonymous.SelectedValue)),
                Id = userID,
                Email = userEmail,
                postDepartment = department,
                postDate = DateTime.Now,
            };

            using (var _dbContext = new ApplicationDbContext())
            {
                newPost = _dbContext.Posts.Add(newPost);
                _dbContext.SaveChanges();
            }

            if (inputFiles.HasFile)
            {
                var filename = Path.GetFileName(inputFiles.FileName);           
                var path = "/Content/forumuploadfiles/" + filename;

                var trueFilepath = Path.Combine(Server.MapPath("~/Content/forumuploadfiles"), filename);

                inputFiles.SaveAs(trueFilepath);

                NewFile file = new NewFile()
                {
                    postId = newPost.postId,
                    filePath = path
                };
                using (var _dbContext = new ApplicationDbContext())
                {
                    _dbContext.Files.Add(file);
                    _dbContext.SaveChanges();
                }
            }


            using (var _dbContext = new IdentityDbContext())
            {

                var roleId = _dbContext.Roles.FirstOrDefault(c => c.Name == "QACoordinator").Id;

                using (var _context = new ApplicationDbContext())
                {

                    var deptAdmins = _context.Users
                             .Where(u => u.Roles.Any(r => r.RoleId == roleId))
                             .ToList();

                    var deptAdmin = deptAdmins.FirstOrDefault(c => c.deptName == department);

                    string from = ConfigurationManager.AppSettings["Email"].ToString(); //Replace this with your own correct Gmail Address

                    string to = deptAdmin.Email; //Replace this with the Email Address to whom you want to send the mail

                MailMessage mail = new System.Net.Mail.MailMessage();
                    mail.To.Add(to);
                    mail.From = new MailAddress(from, "Site Master", System.Text.Encoding.UTF8);
                    mail.Subject = "New post added";
                    mail.SubjectEncoding = System.Text.Encoding.UTF8;
                    mail.Body = "A user from your department has submitted a post, click <a href='http://localhost:51089/PostDisplay?id=" + newPost.postId+"'>here</a> to view post ";
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
                        Debug.WriteLine("Email error: "+ ex2.Message);
                        HttpContext.Current.Response.Write(errorMessage);
                    }
                }
            }

            


            //Display success message and clear the form.
            System.Windows.Forms.MessageBox.Show("You have successfully submitted a post!");
            inputTitle.Text = "";
            inputBody.Text = "";
            inputCategory.SelectedValue = "";
            inputAnonymous.SelectedValue = "";



        }


    }
}