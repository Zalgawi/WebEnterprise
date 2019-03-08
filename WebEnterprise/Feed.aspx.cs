using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebEnterprise
{
    public partial class Feed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {

                Response.Redirect("/Account/Login", true);

            }

        }

        protected void formSubmit_click(object sender, EventArgs e)
        {
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