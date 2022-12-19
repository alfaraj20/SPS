using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPS.Views.Admin
{
    public partial class Dashboard : System.Web.UI.Page
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
            string TypeUser = Session["UserType"] as string;
            string LoginID = Session["WorkshopID"] as string;
            string ID = Session["ID"] as string;
            if (TypeUser == "1")
            {
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    SqlCommand cmd = new SqlCommand("SELECT Users.*, ManagementUsers.UserNameManagement FROM Users INNER JOIN ManagementUsers ON ManagementUsers.UserIDManagement = Users.UserType WHERE year(date) ='" + DateTime.Now.ToString("yyyy") + "' And month(date) ='" + DateTime.Now.ToString("MM") + "' ORDER BY ID DESC", con1);
                    con1.Open();
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    SqlDataReader sdr2 = cmd.ExecuteReader();
                    if (sdr2.HasRows)
                    {
                        DataList1.DataSource = ds;
                        DataList1.DataBind();
                        DataList1.Visible = true;
                        DashboardDiv.Visible = false;
                    }
                    else
                    {
                        DataList1.Visible = false;
                        DashboardDiv.Visible = true;
                        //products_div.Attributes["class"] = "products_div_postion";
                    }
                    con1.Close();
                }

                //Total new customers this month
                SqlConnection con = new SqlConnection(Cs);
                string Statment1 = "select month(Date) as 'Month', count(*) from Users WHERE year(Date) ='" + DateTime.Now.ToString("yyyy") + "'And month(Date) ='" + DateTime.Now.ToString("MM") + "' group by month(Date) ";
                SqlCommand cmd1 = new SqlCommand(Statment1, con);
                con.Open();
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.Read())
                {
                    TotalNewUsers.InnerText = dr.GetValue(1).ToString();
                }
                con.Close();

                //Total customers
                string Statment2 = "select COUNT(ID) from Users";
                SqlCommand cmd2 = new SqlCommand(Statment2, con);
                con.Open();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.Read())
                {
                    TotalUsers.InnerText = dr2.GetValue(0).ToString();
                }
                con.Close();

                //Total new orders this month
                string Statment3 = "select month(Date) as 'Month', count(*) from Order_details WHERE year(Date) ='" + DateTime.Now.ToString("yyyy") + "'And month(Date) ='" + DateTime.Now.ToString("MM") + "' group by month(Date) ";
                SqlCommand cmd3 = new SqlCommand(Statment3, con);
                con.Open();
                SqlDataReader dr3 = cmd3.ExecuteReader();
                if (dr3.Read())
                {
                    TotalNewOrders.InnerText = dr3.GetValue(1).ToString();
                }
                con.Close();

                //Total orders
                string Statment4 = "select COUNT(id) from Order_details";
                SqlCommand cmd4 = new SqlCommand(Statment4, con);
                con.Open();
                SqlDataReader dr4 = cmd4.ExecuteReader();
                if (dr4.Read())
                {
                    TotalOrders.InnerText = dr4.GetValue(0).ToString();
                }
                con.Close();

                //Total new products sell this month
                string Statment5 = "select month(Date) as 'Month', sum(Pqty) from Order_details WHERE year(Date) ='" + DateTime.Now.ToString("yyyy") + "'And month(Date) ='" + DateTime.Now.ToString("MM") + "' group by month(Date) ";
                SqlCommand cmd5 = new SqlCommand(Statment5, con);
                con.Open();
                SqlDataReader dr5 = cmd5.ExecuteReader();
                if (dr5.Read())
                {
                    TotalNewProductsSell.InnerText = dr5.GetValue(1).ToString();
                }
                con.Close();

                //Total products sell
                string Statment6 = "SELECT sum(Pqty) AS TotalQuantity FROM Order_details";
                SqlCommand cmd6 = new SqlCommand(Statment6, con);
                con.Open();
                SqlDataReader dr6 = cmd6.ExecuteReader();
                if (dr6.Read())
                {
                    TotalProductsSell.InnerText = dr6.GetValue(0).ToString();
                }
                con.Close();

                //Total new products sell this month
                string Statment7 = "select month(Date) as 'Month', sum(Pprice) from Order_details WHERE year(Date) ='" + DateTime.Now.ToString("yyyy") + "'And month(Date) ='" + DateTime.Now.ToString("MM") + "' group by month(Date) ";
                SqlCommand cmd7 = new SqlCommand(Statment7, con);
                con.Open();
                SqlDataReader dr7 = cmd7.ExecuteReader();
                if (dr7.Read())
                {
                    TotalNewMonth.InnerText = dr7.GetValue(1).ToString();
                }
                con.Close();

                //Total products sell
                string Statment8 = "SELECT sum(Pprice) AS TotalQuantity FROM Order_details";
                SqlCommand cmd8 = new SqlCommand(Statment8, con);
                con.Open();
                SqlDataReader dr8 = cmd8.ExecuteReader();
                if (dr8.Read())
                {
                    TotalSells.InnerText = dr8.GetValue(0).ToString();
                }
                con.Close();
            }
            else if(TypeUser == "2")
            {
                UsersTotal.Visible = false;
                UsersNew.Visible = false;
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    SqlCommand cmd = new SqlCommand("SELECT Users.*, ManagementUsers.UserNameManagement FROM Users INNER JOIN ManagementUsers ON ManagementUsers.UserIDManagement = Users.UserType WHERE year(date) ='" + DateTime.Now.ToString("yyyy") + "' And month(date) ='" + DateTime.Now.ToString("MM") + "' ORDER BY ID DESC", con1);
                    con1.Open();
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    SqlDataReader sdr2 = cmd.ExecuteReader();
                    if (sdr2.HasRows)
                    {
                        DataList1.DataSource = ds;
                        DataList1.DataBind();
                        DataList1.Visible = false;
                        DashboardDiv.Visible = false;
                    }
                    else
                    {
                        DataList1.Visible = false;
                        DashboardDiv.Visible = true;
                        //products_div.Attributes["class"] = "products_div_postion";
                    }
                    con1.Close();
                }
                SqlConnection con = new SqlConnection(Cs);
                //Total new orders this month
                string Statment3 = "select month(Date) as 'Month', count(*) from Order_details WHERE year(Date) ='" + DateTime.Now.ToString("yyyy") + "'And month(Date) ='" + DateTime.Now.ToString("MM") + "'And WorkshopID='" + LoginID + "' group by month(Date) ";
                SqlCommand cmd3 = new SqlCommand(Statment3, con);
                con.Open();
                SqlDataReader dr3 = cmd3.ExecuteReader();
                if (dr3.Read())
                {
                    TotalNewOrders.InnerText = dr3.GetValue(1).ToString();
                }
                con.Close();
                //Total orders
                string Statment4 = "select COUNT(id) from Order_details where WorkshopID ='" + LoginID + "'";
                SqlCommand cmd4 = new SqlCommand(Statment4, con);
                con.Open();
                SqlDataReader dr4 = cmd4.ExecuteReader();
                if (dr4.Read())
                {
                    TotalOrders.InnerText = dr4.GetValue(0).ToString();
                }
                con.Close();
                //Total new products sell this month
                string Statment5 = "select month(Date) as 'Month', sum(Pqty) from Order_details WHERE year(Date) ='" + DateTime.Now.ToString("yyyy") + "'And month(Date) ='" + DateTime.Now.ToString("MM") + "'And WorkshopID='" + LoginID + "' group by month(Date) ";
                SqlCommand cmd5 = new SqlCommand(Statment5, con);
                con.Open();
                SqlDataReader dr5 = cmd5.ExecuteReader();
                if (dr5.Read())
                {
                    TotalNewProductsSell.InnerText = dr5.GetValue(1).ToString();
                }
                con.Close();
                //Total products sell
                string Statment6 = "SELECT sum(Pqty) AS TotalQuantity FROM Order_details where WorkshopID ='" + LoginID + "'";
                SqlCommand cmd6 = new SqlCommand(Statment6, con);
                con.Open();
                SqlDataReader dr6 = cmd6.ExecuteReader();
                if (dr6.Read())
                {
                    TotalProductsSell.InnerText = dr6.GetValue(0).ToString();
                }
                con.Close();
                //Total new products sell this month
                string Statment7 = "select month(Date) as 'Month', sum(Pprice) from Order_details WHERE year(Date) ='" + DateTime.Now.ToString("yyyy") + "'And month(Date) ='" + DateTime.Now.ToString("MM") + "'And WorkshopID='" + LoginID + "' group by month(Date) ";
                SqlCommand cmd7 = new SqlCommand(Statment7, con);
                con.Open();
                SqlDataReader dr7 = cmd7.ExecuteReader();
                if (dr7.Read())
                {
                    TotalNewMonth.InnerText = dr7.GetValue(1).ToString();
                }
                con.Close();
                //Total products sell
                string Statment8 = "SELECT sum(Pprice) AS TotalQuantity FROM Order_details where WorkshopID ='" + LoginID + "'";
                SqlCommand cmd8 = new SqlCommand(Statment8, con);
                con.Open();
                SqlDataReader dr8 = cmd8.ExecuteReader();
                if (dr8.Read())
                {
                    TotalSells.InnerText = dr8.GetValue(0).ToString();
                }
                con.Close();
            }
        }

    }
}