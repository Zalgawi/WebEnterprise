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
       

        protected void Page_Load(object sender, EventArgs e)
        {
            //check for a postback
            if (!Page.IsPostBack)
            {
                //bind the gridview data
                computingPostGridView.DataSource = computingDataSource;
                computingPostGridView.DataBind();
            }

        }

        protected void computingPostGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void computingPostGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void 
        //    {

        //    }
    }
}