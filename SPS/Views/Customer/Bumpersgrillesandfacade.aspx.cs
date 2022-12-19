using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPS.Views.Customer
{
    public partial class Bumpersgrillesandfacade : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                TextBox search = this.Master.FindControl("search") as TextBox;
                Button searchbtn = this.Master.FindControl("searchbtn1") as Button;
                SqlConnection con = new SqlConnection(Cs);
                SqlDataAdapter sdaa = new SqlDataAdapter("Select * from Product where Name like '%"+search.Text+ "%'and CategoryProduct = '1' ORDER BY CategoryProduct DESC", con);
                DataTable dt = new DataTable();
                sdaa.Fill(dt);
                DataList1.DataSourceID = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
        }
    }
}