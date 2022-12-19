using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPS.Views.Customer
{
    public partial class OwnerWorkshop : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string Add = Session["Add"] as string;
            if (Add == "Add")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Please enter your informations')", true);
            }
            string ID = Session["ID"] as string;
            User1.SelectedValue = ID;
            FileUploadBtn1.Attributes.Add("onclick", "document.getElementById('" + FileUploadArea.ClientID + "').click(); return false;");
        }
        protected void InsertWorkshop(object sender, EventArgs e)
        {
            try
            {
                if (FileUploadArea.HasFile)
                {
                    string ID = Session["ID"] as string;
                    FileUploadArea.SaveAs(Server.MapPath("/Images/Admin/WorkShop/" + "(" + DateTime.Now.ToString("dd-MM-yy--hh--mm--ss--tt") + ")" + FileUploadArea.FileName));
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
                    SqlCommand cmd1 = new SqlCommand("update Users set UserType = 2 where ID = '"+ ID + "'", con);
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    Session.Abandon();
                    NameTextBox.Text = PhoneTextBox.Text = EmailTextBox.Text = LocationTextBox.Text = LicenseTextBox.Text = string.Empty;
                    WorkshopCategory.ClearSelection();
                    User1.ClearSelection();
                    Response.Redirect("LoginRegistration.aspx");
                }
                else
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('There is something is wrong','','error')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The Problem Is: '" + ex + "'')", true);
            }
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
    }
}