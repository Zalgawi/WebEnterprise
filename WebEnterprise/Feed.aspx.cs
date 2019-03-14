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


            
            var User = System.Web.HttpContext.Current.User.Identity.GetUserId();
            //if (Convert.ToBoolean(Int32.Parse(inputAnonymous.SelectedValue)))
            //{
            //    User = "anonymous";
            //}

            Post newPost = new Post()
            {
                postTitle = inputTitle.Text,
                postBody = inputBody.Text,
                //postDescription = inputDescription.Text,
                postCategory = inputCategory.SelectedValue,
                postAnonymous = Convert.ToBoolean(Int32.Parse(inputAnonymous.SelectedValue)),
                Id = User,
            };

            using (var _dbContext = new ApplicationDbContext())
            {
                _dbContext.Posts.Add(newPost);
                _dbContext.SaveChanges();
            }
        }
    }
}