using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEnterprise.Account
{
    public partial class test2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
           
            
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
           
        }

        protected void Button4_Click(object sender, EventArgs e)
           
        {
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin/Report.aspx");


        }

    
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Account/QACoordinator.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

            Response.Redirect("~/Admin/Post.aspx");
        }
    }
}