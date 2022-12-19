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
    public partial class CustomerOrders : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBind();
            }
        }
        private void BindBind()
        {
            string ID = Session["ID"] as string;
            using (SqlConnection con = new SqlConnection(Cs))
            {
                SqlCommand cmd = new SqlCommand("SELECT Orders.*, Order_details.* FROM Orders INNER JOIN Order_details ON Orders.OrderID = Order_details.order_id where Order_details.CustomerID = '"+ID+"' ORDER BY OrderID DESC", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                    DataList1.Visible = true;
                    OrdersDiv.Visible = false;
                }
                else
                {
                    DataList1.Visible = false;
                    OrdersDiv.Visible = true;
                }
                con.Close();
            }
        }

    }
}