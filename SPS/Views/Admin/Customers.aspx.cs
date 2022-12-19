using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SPS.Views.Admin
{
    public partial class Customers : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Check();
            if (!IsPostBack)
            {
                BindBind();
            }
        }
        private void BindBind()
        {
            using (SqlConnection con1 = new SqlConnection(Cs))
            {
                string TypeUser = Session["UserType"] as string;
                string LoginID = Session["WorkshopID"] as string;

                if (TypeUser == "1")
                {
                    SqlCommand cmd1 = new SqlCommand("select ID,Username,Fname,Lname,Email,Phone,UserType from Users", con1);
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
                        UsernameCustomers.Visible = false;
                    }
                    else
                    {
                        DataList1.Visible = false;
                        UsernameCustomers.Visible = true;
                    }
                    con1.Close();
                    Check();
                    selected.Text = "0";
                }
                if (TypeUser == "2")
                {

                }
            }
        }
        private void BindBind1()
        {
            using (SqlConnection con1 = new SqlConnection(Cs))
            {
                TextBox search = this.Master.FindControl("search1") as TextBox;
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("UsersSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NameUsersSearch", search.Text);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    DataList1.Visible = true;
                    DataList1.DataSource = sdr;
                    UsernameCustomers.Visible = false;
                    DataList1.DataBind();
                    Check();
                }
                else
                {
                    DataList1.Visible = false;
                    UsernameCustomers.Visible = true;
                }
            }
        }
        protected void Check()
        {
            foreach (DataListItem item in DataList1.Items)
            {
                CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                CheckBoxDelete.InputAttributes["class"] = "DeleteMultiple";
            }
        }
        [WebMethod]
        public static bool UserNameChecker(string newUserName)
        {
            string conString = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlConnection conn = new SqlConnection(conString);

            conn.Open();
            SqlCommand command = new SqlCommand("select Username from Users where Username = '" + newUserName + "';", conn);

            object found = command.ExecuteScalar();

            if (found != null)
                return true;
            else
                return false;
        }
        [WebMethod]
        public static bool PhoneChecker(string newUserName)
        {
            string conString = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlConnection conn = new SqlConnection(conString);

            conn.Open();
            SqlCommand command = new SqlCommand("select Phone from Users where Phone = '" + newUserName + "';", conn);

            object found = command.ExecuteScalar();

            if (found != null)
                return true;
            else
                return false;
        }
        [WebMethod]
        public static bool EmailChecker(string newUserName)
        {
            string conString = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlConnection conn = new SqlConnection(conString);

            conn.Open();
            SqlCommand command = new SqlCommand("select Email from Users where Email = '" + newUserName + "';", conn);

            object found = command.ExecuteScalar();

            if (found != null)
                return true;
            else
                return false;
        }
        protected void Edit(object sender, EventArgs e)
        {
            DataListItem item = (sender as HtmlInputButton).NamingContainer as DataListItem;
            DataList1.EditItemIndex = item.ItemIndex;
            BindBind1();
            Check();
        }
        protected void CheckBox(object sender, EventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                if (CheckBoxDelete.Checked)
                {
                    int ID = int.Parse((item.FindControl("ID") as Label).Text.Trim());
                    SqlConnection con = new SqlConnection(Cs);
                    //Start select id and delete product
                    string Statment1 = "select WorkshopID from WorkShopR where ID ='"+ID+"'";
                    SqlCommand cmd1 = new SqlCommand(Statment1, con);
                    con.Open();
                    SqlDataReader dr = cmd1.ExecuteReader();
                    if (dr.Read())
                    {
                        string DeleteForProduct = dr.GetValue(0).ToString();
                        dr.Close();
                        SqlCommand cmd12 = new SqlCommand("delete from Order_details where WorkshopID='" + DeleteForProduct + "'", con);
                        SqlCommand cmd2 = new SqlCommand("delete from Product where WorkshopID='" + DeleteForProduct + "'", con);
                        cmd2.ExecuteNonQuery();
                        cmd12.ExecuteNonQuery();
                    }
                    con.Close();
                    //End select id and delete product
                    con.Open();
                    SqlCommand cmd3 = new SqlCommand("delete from WorkShopR where ID='" + ID + "'", con);
                    SqlCommand cmd4 = new SqlCommand("delete from Users where ID='" + ID + "'", con);
                    cmd3.ExecuteNonQuery();
                    cmd4.ExecuteNonQuery();
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
            string NameTextBox1 = ((TextBox)DataList1.Controls[id].FindControl("Username")).Text;
            if (item == "Delete")
            {
                SqlConnection con = new SqlConnection(Cs);
                //Start select id and delete product
                string Statment1 = "select WorkshopID from WorkShopR where ID ='" + ID + "'";
                SqlCommand cmd1 = new SqlCommand(Statment1, con);
                con.Open();
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.Read())
                {
                    string DeleteForProduct = dr.GetValue(0).ToString();
                    dr.Close();
                    SqlCommand cmd12 = new SqlCommand("delete from Order_details where WorkshopID='" + DeleteForProduct + "'", con);
                    SqlCommand cmd2 = new SqlCommand("delete from Product where WorkshopID='" + DeleteForProduct + "'", con);
                    cmd2.ExecuteNonQuery();
                    cmd12.ExecuteNonQuery();
                }
                con.Close();
                //End select id and delete product
                con.Open();
                SqlCommand cmd3 = new SqlCommand("delete from WorkShopR where ID='" + ID + "'", con);
                SqlCommand cmd4 = new SqlCommand("delete from Users where ID='" + ID + "'", con);
                cmd3.ExecuteNonQuery();
                cmd4.ExecuteNonQuery();
                con.Close();
                BindBind();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Deleted Successfully','(" + NameTextBox1 + ")','success')", true);
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
        protected void UpdateUsers(object sender,EventArgs e)
        {
            Label CustomerID = (Label)DataList1.Items[DataList1.EditItemIndex].FindControl("ID");
            TextBox Username = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("Username");
            TextBox Phone = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("Phone");
            TextBox Email = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("Email");
            TextBox Fname = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("Fname");
            TextBox Lname = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("Lname");
            DropDownList UserType = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("UserType");
            string ID = CustomerID.Text;

            SqlConnection con = new SqlConnection(Cs);
            SqlCommand cmd = new SqlCommand("update Users set Username='" + Username.Text + "',Phone='" + Phone.Text + "',Email='" + Email.Text + "',Fname='" + Fname.Text + "',Lname='" + Lname.Text + "',UserType='" + UserType.SelectedValue + "'where ID = @ID", con);
            con.Open();
            cmd.Parameters.AddWithValue("@ID", ID);
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Updated Successfully','(" + Username.Text + ")','success')", true);
            DataList1.EditItemIndex = -1;
            this.BindBind1();
        }
    }
}