using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SPS
{
    public partial class Dashboard : System.Web.UI.MasterPage
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            ContentPlaceHolder MainContent = Page.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
            //Start Dashboard
            HiddenField Dashboard = MainContent.FindControl("Dashboard1") as HiddenField;
            if (Dashboard.Value == "Dashboard")
            {
                search.Visible = false;
            }
            //End Dashboard
            //Start Privileges
            string TypeUser = Session["UserType"] as string;
            if (TypeUser == "0")
            {
                Response.Redirect("../Customer/Home.aspx");
            }
            else if (TypeUser == "1")
            {
                Workshop.Visible = false;
            }
            else if (TypeUser == "2")
            {
                Workshop.Visible = false;
                LinkButton1.Visible = false;
                Customers.Visible = false;
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Customer/LoginRegistration.aspx");
            }
            //End Privileges
        }

        protected void search1_TextChanged(object sender, EventArgs e)
        {
            ContentPlaceHolder MainContent = Page.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
            DataList DataList1 = MainContent.FindControl("DataList1") as DataList;
            Label ID = (Label)DataList1.Items[DataList1.EditItemIndex].FindControl("ID");
            //Start Workshop
            HiddenField Workshops = MainContent.FindControl("WorkshopsPage") as HiddenField;
            HtmlControl WorkshopsDiv = MainContent.FindControl("NameWorkshop") as HtmlControl;
            //End Workshop
            //Start Product
            HiddenField Products = MainContent.FindControl("Products2") as HiddenField;
            HtmlControl ProductsDiv = MainContent.FindControl("Product1") as HtmlControl;
            //End Product
            //Start Order
            HiddenField Orders = MainContent.FindControl("Orders1") as HiddenField;
            HtmlControl OrdersDiv = MainContent.FindControl("OrdersDiv") as HtmlControl;
            //End Order
            //Start Customer
            HiddenField Customers = MainContent.FindControl("CustomersPage1") as HiddenField;
            HtmlControl CustomersDiv = MainContent.FindControl("UsernameCustomers") as HtmlControl;
            HtmlControl Container = MainContent.FindControl("products_div") as HtmlControl;
            //End Customer

            //Start check for workshop
            if (Workshops.Value == "Workshops")
            {
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("WorkshopSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NameWorkshopSearch", search1.Text);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    DataList1.Visible = true;
                    WorkshopsDiv.Visible = false;
                    DataList1.DataSource = sdr;
                    DataList1.DataBind();
                }
                else
                {
                    DataList1.Visible = false;
                    WorkshopsDiv.Visible = true;
                }
                foreach (DataListItem item in DataList1.Items)
                {
                    CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                    CheckBoxDelete.InputAttributes["class"] = "DeleteMultiple";
                }
            }
            //End check for workshop
            //Start check for Product
            else if (Products.Value == "Products")
            {
                string TypeUser = Session["UserType"].ToString();
                if (TypeUser == "1")
                {
                    using (SqlConnection con1 = new SqlConnection(Cs))
                    {
                        SqlConnection con = new SqlConnection(Cs);
                        SqlCommand cmd = new SqlCommand("ProductSearch", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@NameProductSearch", search1.Text);
                        con.Open();
                        SqlDataReader sdr = cmd.ExecuteReader();
                        if (sdr.HasRows)
                        {
                            DataList1.Visible = true;
                            DataList1.DataSource = sdr;
                            DataList1.DataBind();
                            ProductsDiv.Visible = false;
                        }
                        else
                        {
                            DataList1.Visible = false;
                            ProductsDiv.Visible = true;
                        }
                    }
                }
                else if (TypeUser == "2")
                {
                    string LoginID = Session["WorkshopID"].ToString();
                    using (SqlConnection con1 = new SqlConnection(Cs))
                    {
                        SqlConnection con = new SqlConnection(Cs);
                        SqlCommand cmd = new SqlCommand("ProductSearchLogin", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@NameProductSearch", search1.Text);
                        cmd.Parameters.AddWithValue("@NameProductSearchLogin", LoginID);
                        con.Open();
                        SqlDataReader sdr = cmd.ExecuteReader();
                        if (sdr.HasRows)
                        {
                            DataList1.Visible = true;
                            DataList1.DataSource = sdr;
                            DataList1.DataBind();
                            ProductsDiv.Visible = false;
                        }
                        else
                        {
                            DataList1.Visible = false;
                            ProductsDiv.Visible = true;
                        }
                    }
                }
                else
                {
                    Session.Abandon();
                    Response.Redirect("../Customer/LoginRegistration.aspx");
                }
                foreach (DataListItem item in DataList1.Items)
                {
                    CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                    CheckBoxDelete.InputAttributes["class"] = "DeleteMultiple1";
                }
            }
            //End check for Product
            //Start check for order
            else if (Orders.Value == "Orders")
            {
                string TypeUser = Session["UserType"].ToString();
                if (TypeUser == "1")
                {
                    using (SqlConnection con1 = new SqlConnection(Cs))
                    {
                        SqlConnection con = new SqlConnection(Cs);
                        SqlCommand cmd = new SqlCommand("OrderSearch", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@NameOrderSearch", search1.Text);
                        con.Open();
                        SqlDataReader sdr = cmd.ExecuteReader();
                        if (sdr.HasRows)
                        {
                            DataList1.Visible = true;
                            DataList1.DataSource = sdr;
                            DataList1.DataBind();
                            OrdersDiv.Visible = false;
                        }
                        else
                        {
                            DataList1.Visible = false;
                            OrdersDiv.Visible = true;
                        }
                    }
                }
                else if (TypeUser == "2")
                {
                    string LoginID = Session["WorkshopID"].ToString();
                    using (SqlConnection con1 = new SqlConnection(Cs))
                    {
                        SqlConnection con = new SqlConnection(Cs);
                        SqlCommand cmd = new SqlCommand("OrderSearchLogin", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@NameOrderSearch", search1.Text);
                        cmd.Parameters.AddWithValue("@WorkshopId", LoginID);
                        con.Open();
                        SqlDataReader sdr = cmd.ExecuteReader();
                        if (sdr.HasRows)
                        {
                            DataList1.Visible = true;
                            DataList1.DataSource = sdr;
                            DataList1.DataBind();
                            OrdersDiv.Visible = false;
                        }
                        else
                        {
                            DataList1.Visible = false;
                            OrdersDiv.Visible = true;
                        }
                    }
                }
                else
                {
                    Session.Abandon();
                    Response.Redirect("../Customer/LoginRegistration.aspx");
                }
                foreach (DataListItem item in DataList1.Items)
                {
                    CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                    CheckBoxDelete.InputAttributes["class"] = "DeleteMultiple1";
                }
            }
            //End check for order
            //Start check for customer
            else if (Customers.Value == "Customers")
            {
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("UsersSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NameUsersSearch", search1.Text);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    DataList1.Visible = true;
                    CustomersDiv.Visible = false;
                    DataList1.DataSource = sdr;
                    DataList1.DataBind();
                }
                else
                {
                    DataList1.Visible = false;
                    CustomersDiv.Visible = true;
                }
                foreach (DataListItem item in DataList1.Items)
                {
                    CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                    CheckBoxDelete.InputAttributes["class"] = "DeleteMultiple1";
                }
            }
            //End check for customer

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Views/Customer/Home.aspx");
        }
    }
}