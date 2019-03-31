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
using System.Data.SqlClient;

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
                var addLikeSql = "update Posts set postLikes = postLikes + 1 where postID = @id";
                var paramID = new SqlParameter("@id", postIdInt);
                _dbContext.Database.ExecuteSqlCommand(addLikeSql, paramID);
            }
        }

        

        protected void btnDislike_Click(object sender, EventArgs e)
        {
            var postIdString = Request.QueryString["id"];
            var postIdInt = int.Parse(postIdString);


            using (var _dbContext = new ApplicationDbContext())
            {
                var addDisLikeikeSql = "update Posts set postDislikes = postDislikes + 1 where postID = @id";
                var paramID = new SqlParameter("@id", postIdInt);
                _dbContext.Database.ExecuteSqlCommand(addDisLikeikeSql, paramID);
            }
        }
    }
}