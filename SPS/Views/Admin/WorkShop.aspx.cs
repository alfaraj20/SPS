using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Web.Script.Services;

namespace SPS.Views.Admin
{
    public partial class WorkShop : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            FileUploadBtn1.Attributes.Add("onclick", "document.getElementById('" + FileUploadArea.ClientID + "').click(); return false;");

            Check();
            if (!IsPostBack)
            {
                BindBind1();
                BindBind();
            }
        }
        protected void InsertWorkshop(object sender, EventArgs e)
        {
            try
            {
                if (FileUploadArea.HasFile)
                {
                    FileUploadArea.SaveAs(Server.MapPath("/Images/Admin/WorkShop/" + "(" +DateTime.Now.ToString("dd-MM-yy--hh--mm--ss--tt") + ")" + FileUploadArea.FileName));
                    string FileUploadPath = FileUploadArea.FileName;
                    SqlConnection con = new SqlConnection(Cs); //Create Object.
                    con.Open(); //Open Connection On Database. 
                    string Statment = "insert into WorkShopR values (@WorkshopCategoryID, @Name, @Phone, @Email, @Location, @License, @Image, @Date, @ID,@WorkshopCategoryName)"; //Statment To Insert Data.
                    SqlCommand cmd = new SqlCommand(Statment, con); //Open Command Insert Into Database.
                    cmd.Parameters.AddWithValue("@WorkshopCategoryID", WorkshopCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
                    cmd.Parameters.AddWithValue("@Phone", PhoneTextBox.Text);
                    cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                    cmd.Parameters.AddWithValue("@Location", LocationTextBox.Text);
                    cmd.Parameters.AddWithValue("@License", LicenseTextBox.Text);
                    cmd.Parameters.AddWithValue("@Image", "~/Images/Admin/WorkShop/" + "(" + DateTime.Now.ToString("dd-MM-yy--hh--mm--ss--tt") + ")" + FileUploadPath);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("MM-dd-yyyy h:mm:sstt"));
                    cmd.Parameters.AddWithValue("@ID", User1.SelectedValue);
                    cmd.Parameters.AddWithValue("@WorkshopCategoryName", WorkshopCategory.SelectedItem.Text);
                    cmd.ExecuteNonQuery(); //Close Command Insert Into Database.
                    con.Close(); //Close Connection On Database.
                    SqlCommand cmd1 = new SqlCommand("update Users set UserType = 2 where ID = '" + User1.SelectedValue + "'", con);
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    NameTextBox.Text = PhoneTextBox.Text = EmailTextBox.Text = LocationTextBox.Text = LicenseTextBox.Text = string.Empty;
                    WorkshopCategory.ClearSelection();
                    User1.ClearSelection();
                    BindBind();
                    Check();
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('There is something is wrong','','error')", true);
                    Check();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The Problem Is: '" + ex + "'')", true);
                Check();
            }
        }
        [ScriptMethod()]
        [WebMethod]
        public static List<string> GetUsername(string searchname)
        {
            string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlConnection con = new SqlConnection(Cs);
            con.Open();
            string statment = "select Username from Users where Username like '% +@SearchText + '%'";
            SqlCommand cmd = new SqlCommand(statment,con);
            cmd.Parameters.AddWithValue("@SearchText", searchname);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            List<string> names = new List<string>();
            for(int i = 0; i < dt.Rows.Count; i++)
            {
                names.Add(dt.Rows[i][i].ToString());
            }
            return names;
        }
        private void BindBind()
        {
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    SqlCommand cmd1 = new SqlCommand("select * from WorkShopR  ORDER BY WorkshopID DESC", con1);
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
                    NameWorkshop.Visible = false;
                    }
                    else
                    {
                    DataList1.Visible = false;
                    NameWorkshop.Visible = true;
                    }
                    con1.Close();
                    Check();
                    selected.Text = "0";
                }
        }
        private void BindBind1()
        {
            using (SqlConnection con1 = new SqlConnection(Cs))
            {
                TextBox search = this.Master.FindControl("search1") as TextBox;
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("WorkshopSearch", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NameWorkshopSearch", search.Text);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    DataList1.Visible = true;
                    DataList1.DataSource = sdr;
                    DataList1.DataBind();
                    Check();
                }
                else
                {
                    DataList1.Visible = false;
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
        protected void CheckBox(object sender, EventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                if (CheckBoxDelete.Checked)
                {
                    int ID = int.Parse((item.FindControl("ID") as Label).Text.Trim());
                    //Start select id and delete workshop order_details
                    SqlConnection con1 = new SqlConnection(Cs);
                    con1.Open();
                    SqlCommand cmd1 = new SqlCommand("delete from Order_details where WorkshopID='" + ID + "'", con1);
                    cmd1.ExecuteNonQuery();
                    con1.Close();
                    //Start select id and delete workshop product
                    SqlConnection con2 = new SqlConnection(Cs);
                    con2.Open();
                    SqlCommand cmd2 = new SqlCommand("delete from Product where WorkshopID='" + ID + "'", con2);
                    cmd2.ExecuteNonQuery();
                    con2.Close();
                    //Start select id and delete workshop
                    SqlConnection con = new SqlConnection(Cs);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete from WorkShopR where WorkshopID='" + ID + "'", con);
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
            string NameTextBox1 = ((TextBox)DataList1.Controls[id].FindControl("NameTextBox1")).Text;
            if (item == "Delete")
            {
                //Start select id and delete order_details
                SqlConnection con1 = new SqlConnection(Cs);
                SqlCommand cmd1 = new SqlCommand("delete from Order_details where WorkshopID='" + ID + "'", con1);
                con1.Open();
                cmd1.ExecuteNonQuery();
                con1.Close();
                //Start select id and delete workshop
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("delete from WorkShopR where WorkshopID='" + ID + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                //End select id and delete workshop
                BindBind();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Deleted Successfully','("+NameTextBox1+")','success')", true);
                DataList1.EditItemIndex = -1;
                this.BindBind();
                BindBind();
            }
            else if(item == "Cancel")
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
        protected void Update(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "Update")
            {
                try
                {
                    FileUpload thumbnailImageUpload = (FileUpload)DataList1.Items[DataList1.EditItemIndex].FindControl("aaa");
                    TextBox search = this.Master.FindControl("search1") as TextBox;
                    if (thumbnailImageUpload.HasFile)
                    {
                        string FileUploadPath = "/Images/Admin/WorkShop/" + thumbnailImageUpload.FileName;
                        string ID = ((Label)e.Item.FindControl("ID")).Text;
                        string NameTextBox1 = ((TextBox)e.Item.FindControl("NameTextBox1")).Text;
                        string PhoneTextBox1 = ((TextBox)e.Item.FindControl("PhoneTextBox1")).Text;
                        string EmailTextBox1 = ((TextBox)e.Item.FindControl("EmailTextBox1")).Text;
                        string LocationTextBox1 = ((TextBox)e.Item.FindControl("LocationTextBox1")).Text;
                        string LicenseTextBox1 = ((TextBox)e.Item.FindControl("LicenseTextBox1")).Text;
                        string WorkshopCategory1 = ((DropDownList)e.Item.FindControl("WorkshopCategory1")).SelectedValue;
                        string User1 = ((DropDownList)e.Item.FindControl("User1")).SelectedValue;
                        SqlConnection con = new SqlConnection(Cs);
                        SqlCommand cmd = new SqlCommand("update WorkShopR set ID='"+User1+"',WorkshopCategoryID='" + WorkshopCategory1 + "',Name='" + NameTextBox1 + "',Phone='" + PhoneTextBox1 + "',Email='" + EmailTextBox1 + "',Location='" + LocationTextBox1 + ",License='" + LicenseTextBox1 + "',Image=/Images/Admin/WorkShop/'" + FileUploadPath + "'where WorkshopID=" + ID, con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        DataList1.EditItemIndex = -1;
                        this.BindBind();
                    }
                    else
                    {
                        string ID = ((Label)e.Item.FindControl("ID")).Text;
                        string NameTextBox1 = ((TextBox)e.Item.FindControl("NameTextBox1")).Text;
                        string PhoneTextBox1 = ((TextBox)e.Item.FindControl("PhoneTextBox1")).Text;
                        string EmailTextBox1 = ((TextBox)e.Item.FindControl("EmailTextBox1")).Text;
                        string LocationTextBox1 = ((TextBox)e.Item.FindControl("LocationTextBox1")).Text;
                        string LicenseTextBox1 = ((TextBox)e.Item.FindControl("LicenseTextBox1")).Text;
                        string WorkshopCategory1 = ((DropDownList)e.Item.FindControl("WorkshopCategory1")).SelectedValue;
                        string User1 = ((DropDownList)e.Item.FindControl("User1")).SelectedValue;
                        SqlConnection con = new SqlConnection(Cs);
                        SqlCommand cmd = new SqlCommand("update WorkShopR set ID='" + User1 + "',WorkshopCategoryID='" + WorkshopCategory1 + "',Name='" + NameTextBox1 + "',Phone='" + PhoneTextBox1 + "',Email='" + EmailTextBox1 + "',Location='" + LocationTextBox1 + "',License='" + LicenseTextBox1 +"'where WorkshopID=" + ID, con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        search.Text = string.Empty;
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Updated Successfully','(" + NameTextBox1 + ")','success')", true);
                        DataList1.EditItemIndex = -1;
                        this.BindBind();
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('The Problem Is: '" + ex + "'')", true);
                }
            }
        }
        protected void Edit(object sender, EventArgs e)
        {
            DataListItem item = (sender as HtmlInputButton).NamingContainer as DataListItem;
            DataList1.EditItemIndex = item.ItemIndex;
            BindBind1();
        }

        [WebMethod]
        public static bool WorkshopNameChecker(string newUserName)
        {
            string conString = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlConnection conn = new SqlConnection(conString);

            conn.Open();
            SqlCommand command = new SqlCommand("select Name from WorkShopR where Name = '" + newUserName + "';", conn);

            object found = command.ExecuteScalar();

            if (found != null)
                return true;
            else
                return false;
        }

        [WebMethod]
        public static bool PhoneWorkShopChecker(string newUserName)
        {
            string conString = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlConnection conn = new SqlConnection(conString);

            conn.Open();
            SqlCommand command = new SqlCommand("select Phone from WorkShopR where Phone = '" + newUserName + "';", conn);

            object found = command.ExecuteScalar();

            if (found != null)
                return true;
            else
                return false;
        }

        [WebMethod]
        public static bool EmailWorkShopChecker(string newUserName)
        {
            string conString = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlConnection conn = new SqlConnection(conString);

            conn.Open();
            SqlCommand command = new SqlCommand("select Email from WorkShopR where Email = '" + newUserName + "';", conn);

            object found = command.ExecuteScalar();

            if (found != null)
                return true;
            else
                return false;
        }

        [WebMethod]
        public static bool LicenseWorkShopChecker(string newUserName)
        {
            string conString = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlConnection conn = new SqlConnection(conString);

            conn.Open();
            SqlCommand command = new SqlCommand("select License from WorkShopR where License = '" + newUserName + "';", conn);

            object found = command.ExecuteScalar();

            if (found != null)
                return true;
            else
                return false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FileUpload thumbnailImageUpload = (FileUpload)DataList1.Items[DataList1.EditItemIndex].FindControl("aaa");
            Label WorkshopID = (Label)DataList1.Items[DataList1.EditItemIndex].FindControl("ID");
            TextBox NameTextBox1 = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("NameTextBox1");
            TextBox PhoneTextBox1 = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("PhoneTextBox1");
            TextBox EmailTextBox1 = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("EmailTextBox1");
            TextBox LocationTextBox1 = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("LocationTextBox1");
            TextBox LicenseTextBox1 = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("LicenseTextBox1");
            DropDownList WorkshopCategory1 = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("WorkshopCategory1");
            DropDownList User1 = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("User1");

            string ID = WorkshopID.Text;
            if (thumbnailImageUpload.HasFile)
            {
                thumbnailImageUpload.SaveAs(Server.MapPath("/Images/Admin/WorkShop/" + thumbnailImageUpload.FileName));
                string FileUploadPath = thumbnailImageUpload.FileName;
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("update WorkShopR set ID='"+User1.SelectedValue+"' ,Name='"+NameTextBox1.Text+"',Phone='"+PhoneTextBox1.Text+ "',Email='"+EmailTextBox1.Text+ "',Location='"+LocationTextBox1.Text+ "',License='"+LicenseTextBox1.Text+ "',WorkshopCategoryID='"+WorkshopCategory1.SelectedValue+"',Image=@Image where WorkshopID = @ID", con);
                con.Open();
                cmd.Parameters.AddWithValue("@Image", "~/Images/Admin/WorkShop/" + FileUploadPath);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.ExecuteNonQuery();
                con.Close();
                DataList1.EditItemIndex = -1;
                this.BindBind1();
            }
        }
    }
}