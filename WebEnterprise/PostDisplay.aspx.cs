using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebEnterprise.Models;
using System.Web.UI.HtmlControls;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Configuration;
using System.Net.Mail;
using System.Diagnostics;

namespace WebEnterprise
{
    public partial class PostDisplay : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {
                string strCurrentUserId = User.Identity.GetUserId();
                Response.Redirect("/Account/Login", true);
                

            }
            else
            {
                var postIdString = Request.QueryString["id"];
                postIdHidden.Value = postIdString;
            }
            //  int postId = int.Parse(Request.QueryString["postId"]);

        }


        protected void LoadPost(string Id)
        {
           
            //var post = "";
            using (var _dbContext = new ApplicationDbContext())
            {
                int postId = int.Parse(Id);

                var post = _dbContext.Posts.FirstOrDefault(c => c.postId == postId);

                //var latestPosts = _dbContext.Posts.Where(c => c.Id != null).ToList().OrderByDescending(c => c.postDate == postDate);
                if (post == null)
                {
                    Exception e = new Exception("Can't find post");
                    throw e;
                }
                else
                {
                    outputTitle.Text = post.postTitle;
                    outputBody.Text = post.postBody;
                    outputCategory.Text = post.postCategory;

                }
            }


        }

        protected void AddComment(object sender, EventArgs e)
        {
           

            var userID = "";
            var userEmail = "";

            if(commentAnonymous.SelectedValue == "0")
            {
                ApplicationUserManager _userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
                ApplicationUser user = _userManager.FindByName<ApplicationUser, string>(HttpContext.Current.User.Identity.Name);

                userID = user.Id;
                userEmail = user.Email;
            }



            var postIdString = Request.QueryString["id"];
            var postIdInt = int.Parse(postIdString);

            Comment newComment = new Comment()
            {
                
                commentBody = commentBody.Text,
                commentAnonymous = Convert.ToBoolean(Int32.Parse(commentAnonymous.SelectedValue)),
                Id = userID,
                Email = userEmail,
                commentDate = DateTime.Now,
                postId = postIdInt
            };

            using (var _dbContext = new ApplicationDbContext())
            {
                _dbContext.Comments.Add(newComment);
                _dbContext.SaveChanges();
            }

            using (var _dbContext = new IdentityDbContext())
            {

                var roleId = _dbContext.Roles.FirstOrDefault(c => c.Name == "QACoordinator").Id;

                using (var _context = new ApplicationDbContext())
                {

                    var userWhoPostedID = _context.Posts.FirstOrDefault(c => c.postId == postIdInt).Id;

                    var userWhoPostedEmail = _context.Users.FirstOrDefault(c => c.Id == userWhoPostedID).Email;

                    string from = ConfigurationManager.AppSettings["Email"].ToString(); //Replace this with your own correct Gmail Address

                    string to = userWhoPostedEmail; //Replace this with the Email Address to whom you want to send the mail

                    MailMessage mail = new System.Net.Mail.MailMessage();
                    mail.To.Add(to);
                    mail.From = new MailAddress(from, "Site Master", System.Text.Encoding.UTF8);
                    mail.Subject = "New comment has been made";
                    mail.SubjectEncoding = System.Text.Encoding.UTF8;
                    mail.Body = "A user from your department has made a comment on your post, click <a href='http://localhost:51089/PostDisplay?id=" + postIdInt + "'>here</a> to view post ";
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


            //Display success message and clear the form.
            commentBody.Text = "";
            commentAnonymous.SelectedValue = "";

        }

            protected void commentBody_TextChanged(object sender, EventArgs e)
                 {

                }

         protected void btnLike_Click(object sender, EventArgs e)
            {
            var postIdString = Request.QueryString["id"];
            var postIdInt = int.Parse(postIdString);


            

           
             using (var _dbContext = new ApplicationDbContext())
            {
                
                var post = _dbContext.Posts.FirstOrDefault(c => c.postId == postIdInt);
                if (btnDislike.Enabled == false)
                {
                    btnDislike.Enabled = true;
                    btnDislike.Visible = true;
                    btnUndislike.Enabled = false;
                    btnUndislike.Visible = false;
                    post.postDislikes--;
                }
                    post.postLikes++;
                _dbContext.SaveChanges();
            }


            btnLike.Enabled = false;
            btnLike.Visible = false;
            btnUnlike.Enabled = true;
            btnUnlike.Visible = true;
        }

        

        protected void btnDislike_Click(object sender, EventArgs e)
        {
            var postIdString = Request.QueryString["id"];
            var postIdInt = int.Parse(postIdString);


            using (var _dbContext = new ApplicationDbContext())
            {
                var post = _dbContext.Posts.FirstOrDefault(c => c.postId == postIdInt);

                if (btnLike.Enabled == false)
                {
                    btnLike.Enabled = true;
                    btnLike.Visible = true;
                    btnUnlike.Enabled = false;
                    btnUnlike.Visible = false;
                    post.postLikes--;
                }

                post.postDislikes++;
                _dbContext.SaveChanges();
            }

            btnDislike.Enabled = false;
            btnDislike.Visible = false;
            btnUndislike.Enabled = true;
            btnUndislike.Visible = true;

        }

        protected void btnUnlike_Click(object sender, EventArgs e)
        {
            var postIdString = Request.QueryString["id"];
            var postIdInt = int.Parse(postIdString);


            using (var _dbContext = new ApplicationDbContext())
            {
                var post = _dbContext.Posts.FirstOrDefault(c => c.postId == postIdInt);
                post.postLikes--;
                _dbContext.SaveChanges();
            }

            btnUnlike.Enabled = false;
            btnUnlike.Visible = false;
            btnLike.Enabled = true;
            btnLike.Visible = true;

        }

        protected void btnUndislike_Click(object sender, EventArgs e)
        {
            var postIdString = Request.QueryString["id"];
            var postIdInt = int.Parse(postIdString);


            using (var _dbContext = new ApplicationDbContext())
            {
                var post = _dbContext.Posts.FirstOrDefault(c => c.postId == postIdInt);
                post.postDislikes--;
                _dbContext.SaveChanges();
            }


            btnUndislike.Enabled = false;
            btnUndislike.Visible = false;
            btnDislike.Enabled = true;
            btnDislike.Visible = true;

        }
    }
}

