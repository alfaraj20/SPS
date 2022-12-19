using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Configuration;

namespace SPS.Views.Customer
{
    public partial class ProductPage : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Wname"] = Request.QueryString["Name"];

            if (IsPostBack)
            {

                SqlConnection con = new SqlConnection(Cs);
                //SqlDataAdapter sdaa = new SqlDataAdapter("Select * from Product where (Name like '%" + //Search.Text + "%' AND WorkShopID = @id)", con);
                //sdaa.SelectCommand.Parameters.AddWithValue("@id", Request.QueryString["wid"]);
                DataTable dt = new DataTable();
                //sdaa.Fill(dt);
                DataList1.DataSourceID = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }

        }

    }
}