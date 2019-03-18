using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebEnterprise.Pages.Departments.Computing
{
    public partial class subComputing : System.Web.UI.Page
    {
        int postId = Convert.ToInt32(GridView1.Rows[GridView1.CurrentRow.Index].Cells[0].Value);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("PostDisplay.aspx?postId=" + )
        }

        //protected void 
        //    {

        //    }
    }
}