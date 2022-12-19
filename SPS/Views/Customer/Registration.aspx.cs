using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPS.Views.Customer
{
    public partial class Registration : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox search = this.Master.FindControl("search") as TextBox;
            Button searchbtn = this.Master.FindControl("searchbtn1") as Button;
            search.Visible = false;
            searchbtn.Visible = false;
            string Add = Session["Add"] as string;
            if (Add == "Add")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('To add your workshop you have to register or login if you have account')", true);
                Session["Add"] = null;
            }
        }
        protected void InsertWorkshop(object sender, EventArgs e)
        {
            string Add1 = Session["Add1"] as string;
            if (Add1 == "Add1")
            {
                try
                {
                    SqlConnection con = new SqlConnection(Cs); //Create Object.
                    con.Open(); //Open Connection On Database. 
                    string Statment = "INSERT INTO Users (Username, Password, Fname, Lname, Email, Phone, date) VALUES ('" + username.Text + "', '" + password.Text + "', '" + fname.Text + "', '" + lname.Text + "', '" + email.Text + "', '" + phone.Text + "','" + DateTime.Now.ToString("MM-dd-yyyy") + "')"; //Statment To Insert Data.
                    SqlCommand cmd = new SqlCommand(Statment, con); //Open Command Insert Into Database.
                    cmd.ExecuteNonQuery(); //Close Command Insert Into Database.
                    con.Close(); //Close Connection On Database. 
                    //Select user type
                    string Statment1 = "select * from Users where Username = @Username";
                    SqlCommand cmd1 = new SqlCommand(Statment1, con);
                    con.Open();
                    cmd1.Parameters.AddWithValue("@Username", username.Text);
                    cmd1.ExecuteNonQuery();
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if (dr1.Read())
                    {
                        Session["ID"] = dr1.GetValue(0).ToString().Trim();
                    }
                    con.Close();
                    con.Open();
                    cmd1.ExecuteNonQuery();
                    Session["UserType"] = "0";
                    username.Text = password.Text = fname.Text = lname.Text = email.Text = phone.Text = string.Empty;
                    Response.Redirect("LoginRegistration.aspx");
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('There is something is wrong','','error')", true);
                }
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(Cs); //Create Object.
                    con.Open(); //Open Connection On Database. 
                    string Statment = "INSERT INTO Users (Username, Password, Fname, Lname, Email, Phone, date) VALUES ('" + username.Text + "', '" + password.Text + "', '" + fname.Text + "', '" + lname.Text + "', '" + email.Text + "', '" + phone.Text + "','" + DateTime.Now.ToString("MM-dd-yyyy") + "')"; //Statment To Insert Data.
                    SqlCommand cmd = new SqlCommand(Statment, con); //Open Command Insert Into Database.
                    cmd.ExecuteNonQuery(); //Close Command Insert Into Database.
                    con.Close(); //Close Connection On Database. 
                    username.Text = password.Text = fname.Text = lname.Text = email.Text = phone.Text = string.Empty;
                    Response.Redirect("LoginRegistration.aspx");
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('There is something is wrong','','error')", true);
                }
            }
        }
        [WebMethod]
        public static bool WorkshopNameChecker(string newUserName)
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
        public static bool EmailWorkShopChecker(string newUserName)
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
        protected void MoveToLogin(object sender, EventArgs e)
        {
            Response.Redirect("LoginRegistration.aspx");
        }
    }
}