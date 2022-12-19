using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SPS.Views.Customer
{
    public partial class WorkShopPage : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox search = this.Master.FindControl("search") as TextBox;
            Button searchbtn = this.Master.FindControl("searchbtn1") as Button;
            SqlConnection con = new SqlConnection(Cs);
            con.Open();
            SqlDataAdapter sdaa = new SqlDataAdapter("Select * from WorkShopR where (Name like '%" + search.Text + "%')", con);
            DataTable dt = new DataTable();
            sdaa.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();
            if (!IsPostBack)
            {
                Drop_WS();
                BindBind();
            }
        }
        private void BindBind()
        {
            using (SqlConnection con1 = new SqlConnection(Cs))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT * FROM [WorkShopR]", con1);
                con1.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd1;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                SqlDataReader sdr = cmd1.ExecuteReader();
                if (sdr.HasRows)
                {
                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                    DataList1.Visible = true;
                }
                else
                {
                    DataList1.Visible = false;
                }
                con1.Close();
            }
        }
        protected void btn_Search_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductPage.aspx");
            SqlConnection con = new SqlConnection(Cs);
            SqlDataAdapter sdaa = new SqlDataAdapter("Select * from WorkShopR where (Name like '%" + Search.Text + "%')", con);
            DataTable dt = new DataTable();
            sdaa.Fill(dt);
            DataList1.DataSourceID = null;
            DataList1.DataSource = dt;
            DataList1.DataBind();


        }
        public void Drop_WS()
        {
            SqlConnection con = new SqlConnection(Cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM WorkshopCategory", con);
            WorkShop_Specialization.DataSource = cmd.ExecuteReader();
            WorkShop_Specialization.DataTextField = "Category";
            WorkShop_Specialization.DataValueField = "WorkshopCategoryID";
            WorkShop_Specialization.DataBind();
            WorkShop_Specialization.Items.Insert(0, "Workshops Category");
            con.Close();

        }

        protected void WorkShop_Specialization_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Cs);

            string strQuery;
            string selected = WorkShop_Specialization.SelectedItem.Text;

            if (selected == "Workshops Category")
            {
                strQuery = "";
            }
            else
            {
                int CategoryID = Int32.Parse(WorkShop_Specialization.SelectedValue);
                strQuery = "where WorkshopCategoryID = " + CategoryID + "";
            }
            SqlDataAdapter sda = new SqlDataAdapter("select * from WorkShopR " + strQuery + " ", con);
            DataTable df = new DataTable();
            sda.Fill(df);
            try
            {
                if (selected == df.Rows[0][6].ToString())
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('No Workshop found')</script>");
            }
            DataList1.DataSourceID = null;
            DataList1.DataSource = df;
            DataList1.DataBind();
        }
    }
}