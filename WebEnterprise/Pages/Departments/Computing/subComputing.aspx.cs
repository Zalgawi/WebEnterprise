using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebEnterprise.Models;

namespace WebEnterprise.Pages.Departments.Computing
{
    public partial class subComputing : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.User.Identity.IsAuthenticated)
            {
                string strCurrentUserId = User.Identity.GetUserId();
                Response.Redirect("/Account/Login", true);

            }

            //check for a postback
            if (!Page.IsPostBack)
            {
                //bind the gridview data
                string Department = Request.QueryString["Department"];
                depId.Value = Department;
            }

        }

        [WebMethod]
        protected string GetDatatable(string department)
        {
            List<Post> records;

            using (var _dbContext = new ApplicationDbContext())
            {
                records = _dbContext.Posts.Where(c => c.postCategory == department).ToList();
            }

            return JsonConvert.SerializeObject(records);
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