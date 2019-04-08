using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebEnterprise.Account
{

    public partial class QACoordinator : System.Web.UI.Page
    {
        string connectionString;
        SqlConnection con;

      

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=aspnet-WebEnterprise-20190201040107;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            con = new SqlConnection(connectionString);

            SqlCommand cmdinsert = new SqlCommand("Insert into dbo.Categories values( ' " + txtAdd.Text + " ')", con);
            con.Open();
            cmdinsert.CommandType = CommandType.Text;
            cmdinsert.ExecuteNonQuery();
            string message = "Your Category has been submitted successfully!";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);



        }

        
        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/admin.aspx");
        }
    }
}