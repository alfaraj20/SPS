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

namespace SPS.Views.Admin
{
    public partial class Orders : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Check();
            if (!IsPostBack)
            {
                BindBind1();
                BindBind();
            }
        }
        private void BindBind()
        {
            string TypeUser = Session["UserType"] as string;
            string LoginID = Session["WorkshopID"] as string;
            if (TypeUser == "1")
            {
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    SqlCommand cmd1 = new SqlCommand("SELECT Orders.*, Order_details.* FROM Orders INNER JOIN Order_details ON Orders.OrderID = Order_details.order_id", con1);
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
                        OrdersDiv.Visible = false;
                    }
                    else
                    {
                        DataList1.Visible = false;
                        OrdersDiv.Visible = true;
                    }
                    Check();
                    selected.Text = "0";
                }
            }
            else if (TypeUser == "2")
            {
                {
                    using (SqlConnection con1 = new SqlConnection(Cs))
                    {
                        SqlCommand cmd1 = new SqlCommand("SELECT Orders.*, Order_details.* FROM Orders INNER JOIN Order_details ON Orders.OrderID = Order_details.order_id where WorkshopID ='"+ LoginID + "'ORDER BY OrderID DESC", con1);
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
                            OrdersDiv.Visible = false;
                        }
                        else
                        {
                            DataList1.Visible = false;
                            OrdersDiv.Visible = true;
                        }
                        Check();
                        selected.Text = "0";
                    }
                }
            }
        }
        private void BindBind1()
        {
            string TypeUser = Session["UserType"] as string;
            string LoginID = Session["WorkshopID"] as string;
            if (TypeUser == "1")
            {
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    TextBox search = this.Master.FindControl("search1") as TextBox;
                    SqlConnection con = new SqlConnection(Cs);
                    SqlCommand cmd = new SqlCommand("OrderSearch", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NameOrderSearch", search.Text);
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        DataList1.Visible = true;
                        OrdersDiv.Visible = false;
                        DataList1.DataSource = sdr;
                        DataList1.DataBind();
                        Check();
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
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    TextBox search = this.Master.FindControl("search1") as TextBox;
                    SqlConnection con = new SqlConnection(Cs);
                    SqlCommand cmd = new SqlCommand("OrderSearchLogin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NameOrderSearch", search.Text);
                    cmd.Parameters.AddWithValue("@WorkshopId", LoginID);
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        DataList1.Visible = true;
                        DataList1.DataSource = sdr;
                        DataList1.DataBind();
                        OrdersDiv.Visible = false;
                        Check();
                    }
                    else
                    {
                        DataList1.Visible = false;
                        OrdersDiv.Visible = true;
                    }
                }
            }
        }
        protected void Check()
        {
            foreach (DataListItem item in DataList1.Items)
            {
                CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                CheckBoxDelete.InputAttributes["class"] = "DeleteMultiple1";
            }
        }
        protected void CheckBox(object sender, EventArgs e)//Delete Problem
        {
            foreach (DataListItem item in DataList1.Items)
            {
                CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                if (CheckBoxDelete.Checked)
                {
                    int ID = int.Parse((item.FindControl("ID") as Label).Text.Trim());
                    SqlConnection con = new SqlConnection(Cs);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete from Orders where OrderID='" + ID + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Deleted Successfully','','success')", true);
                }
            }
            BindBind();
        }
        protected void Delete(object sender, EventArgs e)
        {
            var drp = (DropDownList)sender;
            var row = (DataListItem)drp.NamingContainer;
            int id = Convert.ToInt32(((HiddenField)row.FindControl("Hidden")).Value) - 1;
            string item = ((DropDownList)DataList1.Controls[id].FindControl("DropDownListChose")).SelectedItem.Text;
            string ID = ((Label)DataList1.Controls[id].FindControl("ID")).Text;
            string Username = ((TextBox)DataList1.Controls[id].FindControl("Username")).Text;
            if (item == "Delete")
            {
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("delete from Orders where OrderID='" + ID + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindBind();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Deleted Successfully','(" + Username + ")','success')", true);
                DataList1.EditItemIndex = -1;
                this.BindBind();
                BindBind();
            }
            else if (item == "Cancel")
            {
                DataList1.EditItemIndex = -1;
                this.BindBind1();
                Check();
            }
            else
            {
                Check();
            }
        }
        protected void Edit(object sender, EventArgs e)
        {
            DataListItem item = (sender as HtmlInputButton).NamingContainer as DataListItem;
            DataList1.EditItemIndex = item.ItemIndex;
            BindBind1();
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Label ProductID = (Label)DataList1.Items[DataList1.EditItemIndex].FindControl("ID");
            TextBox FirstName = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("FirstName");
            TextBox LastName = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("LastName");
            TextBox Username = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("Username");
            TextBox Phone = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("Phone");
            DropDownList OrderStatus = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("OrderStatus");
            TextBox neighborhood = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("neighborhood");
            TextBox Street = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("Street");
            TextBox ZipCode = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("ZipCode");
            string ID = ProductID.Text;

            SqlConnection con = new SqlConnection(Cs);
            SqlCommand cmd = new SqlCommand("update Orders set Fname='" + FirstName.Text + "',Lname='" + LastName.Text + "',Phone='" + Phone.Text  + "',StatusID='" + OrderStatus.SelectedValue + "',neighborhood='"+neighborhood.Text+ "',Street='"+Street.Text+ "',ZipCode='"+ZipCode.Text+"' where OrderID = @ID", con);
            con.Open();
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.ExecuteNonQuery();
            con.Close();

            DataList1.EditItemIndex = -1;
            this.BindBind1();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Updated Successfully','(" + Username.Text + ")','success')", true);
        }

    }
}