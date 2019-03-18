using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebEnterprise.Models;

namespace WebEnterprise
{
    public partial class PostDisplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                       


        }


        protected void LoadPost(int postId)
        {
            using (var _dbContext = new ApplicationDbContext())
            {
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



            var User = System.Web.HttpContext.Current.User.Identity.GetUserId();
            //if (Convert.ToBoolean(Int32.Parse(inputAnonymous.SelectedValue)))
            //{
            //    User = "anonymous";
            //}

            Comment newComment = new Comment()
            {
                commentBody = commentBody.Text,
                commentAnonymous = Convert.ToBoolean(Int32.Parse(commentAnonymous.SelectedValue)),
                Id = User,
                commentDate = DateTime.Now,
            };

            using (var _dbContext = new ApplicationDbContext())
            {
                _dbContext.Comments.Add(newComment);
                _dbContext.SaveChanges();
            }
        }
    }
}