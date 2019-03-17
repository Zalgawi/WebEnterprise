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
            /*/CONNECT TO THE DATABASE
            string connStr = (@"Data Source=(LocalDb)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\aspnet-WebEnterprise-20190201040107.mdf;Initial Catalog=aspnet-WebEnterprise-20190201040107;Integrated Security=True");
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            //CREATE A COMMAND
            SqlCommand cmd = new SqlCommand("SELECT [Id], [postTitle], [postBody], [postCategory], [postAnonymous], [likeORdislike] FROM [dbo].[Posts]");
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;

            string idOutput = "";
            string titleOutput = "";            
            string bodyOutput = "";
            string categoryOutput = "";
            string anonymousOutput = "";
            string likeORdislikeOutput = "";

            //READ FROM DATABASE
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                idOutput += reader["Id"].ToString();
                titleOutput += reader["postTitle"].ToString();
                bodyOutput += reader["postBody"].ToString();
                categoryOutput += reader["postCategory"].ToString();
                anonymousOutput += reader["postAnonymous"].ToString();
                likeORdislikeOutput += reader["likeORdislike"].ToString();
                //temp += "<br/>";

            }

            conn.Close();

            outputId.Text = idOutput;
            outputTitle.Text = titleOutput;
            outputBody.Text = bodyOutput;
            outputCategory.Text = categoryOutput;
            outputAnonymous.Text = anonymousOutput;
            outputlikeORdislike.Text = likeORdislikeOutput;
            //outputBody.Text = bodyOutput;*/




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
    }
}