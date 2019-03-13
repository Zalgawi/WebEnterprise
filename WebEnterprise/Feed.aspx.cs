﻿using System;
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
            if (Convert.ToBoolean(Int32.Parse(inputAnonymous.SelectedValue)))
            {
                User = "anonymous";
            }

            Post newPost = new Post()
            {
                postTitle = inputTitle.Text,
                postBody = inputBody.Text,
                postDescription = inputDescription.Text,
                postCategory = inputCategory.SelectedValue,
                postAnonymous = Convert.ToBoolean(Int32.Parse(inputAnonymous.SelectedValue)),
                Id = User
            };

            using (var _dbContext = new ApplicationDbContext())
            {
                _dbContext.Posts.Add(newPost);
                _dbContext.SaveChanges();
            }
        }



        protected void formSubmit_click(object sender, EventArgs e)
        {

            //AddPost();
           // SqlConnection PostConnection = new SqlConnection(@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebEnterprise-20190201040107.mdf;Initial Catalog=aspnet-WebEnterprise-20190201040107;Integrated Security=True");
            //PostConnection.Open();
            
           //string Query= "INSERT INTO dbo.Posts (postTitle, postBody, postDescription, postCategory, postAnonymous) VALUES ('" + inputTitle.Text + "','" + inputBody.Text + "','" + inputDescription.Text + "','" + inputCategory.SelectedValue + "','" + inputAnonymous.SelectedValue + "')";
            //SqlDataAdapter enterpriseWeb = new SqlDataAdapter(Query, PostConnection);
            //SqlCommand thisCommand = PostConnection.CreateCommand();
            //thisCommand.CommandText = 
            //thisCommand.ExecuteNonQuery();
            //PostConnection.Close();

            //start code from here
            /*try
            {

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into RegisterDataBase(postTitle)values (@posttitle)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                cmd.Parameters.AddWithValue("@posttitle", inputTitle.Text);

                cmd.ExecuteNonQuery();

                Response.Write("Student registeration Successfully!!!thank you");

                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("error" + ex.ToString());
            }
        }*/
        }
    }
}