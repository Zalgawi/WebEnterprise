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
            ApplicationUserManager _userManager = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            ApplicationUser user = _userManager.FindByName<ApplicationUser, string>(HttpContext.Current.User.Identity.Name);


            var department = "";
            using (var _dbContext = new ApplicationDbContext())
            {
                department = _dbContext.Departments.FirstOrDefault(c => c.deptId == user.deptId).deptName;
            }

            //if (Convert.ToBoolean(Int32.Parse(inputAnonymous.SelectedValue)))
            //{
            //    User = "anonymous";
            //}

            Post newPost = new Post()
            {
                postTitle = inputTitle.Text,
                postBody = inputBody.Text,
                postCategory = inputCategory.SelectedValue,
                postAnonymous = Convert.ToBoolean(Int32.Parse(inputAnonymous.SelectedValue)),
                Id = user.Id,
                postDepartment = department,
                postDate = DateTime.Now,
            };

            using (var _dbContext = new ApplicationDbContext())
            {
                _dbContext.Posts.Add(newPost);
                _dbContext.SaveChanges();
            }

            //Display success message and clear the form.
            string message = "Your suggestion has been submitted successfully!";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }

        
    }
}