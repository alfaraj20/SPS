using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPS.Views.Customer
{
    public partial class LoginRegistration : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
        int tot = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string Add = Session["Add"] as string;
            string Add1 = Session["Add1"] as string;
            string UserType = Session["UserType"] as string;
            TextBox search = this.Master.FindControl("search") as TextBox;
            Button searchbtn = this.Master.FindControl("searchbtn1") as Button;
            search.Enabled = false;
            search.Visible = false;
            searchbtn.Enabled = false;
            searchbtn.Visible = false;
            if (Add == "Add")
            {
                if (UserType == "0")
                {
                    Response.Redirect("OwnerWorkshop.aspx");
                }
                else
                {
                    Response.Redirect("Registration.aspx");
                }
            }
        }
        protected void MoveToHome(object sender, EventArgs e)
        {
            string Add1 = Session["Add1"] as string;
            //Start Update
            if (Session["CheckoutBut"] == "yes")
            {
                SqlConnection con = new SqlConnection(Cs);
                con.Open();
                SqlCommand cmd1 = con.CreateCommand();
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "select * from Users where Username='" + Username.Text + "' and Password='" + Password.Text + "'";
                cmd1.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                da.Fill(dt);
                con.Close();
                tot = Convert.ToInt32(dt.Rows.Count.ToString());

                if (tot > 0)
                {
                    
                    
                        Session["user"] = Username.Text;
                    
                    

                }
                else
                {
                    MSG.Text = "Invalid username or password";
                }
                SqlConnection con2 = new SqlConnection(Cs);

                string Statment = "select * from Users where Username = @username and Password = @password";
                string Statment1 = "select * from WorkShopR where ID = @ID";
                SqlCommand cmd2 = new SqlCommand(Statment, con2);
                SqlCommand cmd4 = new SqlCommand(Statment1, con2);
                con2.Open();
                cmd2.Parameters.AddWithValue("@username", Username.Text);
                cmd2.Parameters.AddWithValue("@password", Password.Text);
                cmd2.ExecuteNonQuery();
                SqlDataReader dr2 = cmd2.ExecuteReader();
                if (dr2.Read())
                {
                    Session["user"] = Username.Text;
                    Session["ID"] = dr2.GetValue(0).ToString().Trim();
                    Session["UserType"] = dr2.GetValue(8).ToString().Trim();
                    string ID1 = dr2.GetValue(0).ToString();
                    cmd2.Parameters.AddWithValue("@ID", ID1);
                }
                con2.Close();
                con2.Open();
                cmd2.ExecuteNonQuery();
                SqlDataReader dr1 = cmd2.ExecuteReader();
                if (dr1.Read())
                {
                    Session["WorkshopID"] = dr1.GetValue(0).ToString();
                    Response.Redirect("Update_Location.aspx");
                }
                else
                {
                    MSG.Text = "Username or Password Incorrect";
                }
                con2.Close();
            }
            //End Update
            else if (Add1 == "Add1")
            {
                SqlConnection con = new SqlConnection(Cs);
                string Statment = "select * from Users where Username = @username and Password = @password";
                string Statment1 = "select * from WorkShopR where ID = @ID";
                SqlCommand cmd = new SqlCommand(Statment, con);
                SqlCommand cmd1 = new SqlCommand(Statment1, con);
                con.Open();
                cmd.Parameters.AddWithValue("@username", Username.Text);
                cmd.Parameters.AddWithValue("@password", Password.Text);
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session["user"] = Username.Text;
                    Session["ID"] = dr.GetValue(0).ToString().Trim();
                    Session["UserType"] = dr.GetValue(8).ToString().Trim();
                    string Type = dr.GetValue(8).ToString().Trim();
                    string ID1 = dr.GetValue(0).ToString();
                    if (Type == "2")
                    {
                        cmd1.Parameters.AddWithValue("@ID", ID1);
                        dr.Close();
                        cmd1.ExecuteNonQuery();
                        SqlDataReader dr1 = cmd1.ExecuteReader();
                        if (dr1.Read())
                        {
                            Session["WorkshopID"] = dr1.GetValue(0).ToString();
                            Response.Redirect("Home.aspx");
                        }
                    }
                    else if (Type == "1")
                    {
                        Response.Redirect("Home.aspx");
                    }
                    else if (Type == "0")
                    {
                        Response.Redirect("OwnerWorkshop.aspx");
                    }
                }
                else
                {
                    MSG.Text = "Username or Password Incorrect";
                }
                con.Close();
            }
            else
            {
                SqlConnection con = new SqlConnection(Cs);
                string Statment = "select * from Users where Username = @username and Password = @password";
                string Statment1 = "select * from WorkShopR where ID = @ID";
                SqlCommand cmd = new SqlCommand(Statment, con);
                SqlCommand cmd1 = new SqlCommand(Statment1, con);
                con.Open();
                cmd.Parameters.AddWithValue("@username", Username.Text);
                cmd.Parameters.AddWithValue("@password", Password.Text);
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session["user"] = Username.Text;
                    Session["ID"] = dr.GetValue(0).ToString().Trim();
                    Session["UserType"] = dr.GetValue(8).ToString().Trim();
                    string Type = dr.GetValue(8).ToString().Trim();
                    string ID1 = dr.GetValue(0).ToString();
                    string Email = dr.GetValue(5).ToString();
                    if (Type == "2")
                    {
                        cmd1.Parameters.AddWithValue("@ID", ID1);
                        dr.Close();
                        cmd1.ExecuteNonQuery();
                        SqlDataReader dr1 = cmd1.ExecuteReader();
                        if (dr1.Read())
                        {
                            Session["WorkshopID"] = dr1.GetValue(0).ToString();
                            /*using (MailMessage mail = new MailMessage())
                            {
                                mail.From = new MailAddress("####");
                                mail.To.Add(Email);
                                mail.Subject = "Login";
                                mail.Body = "<h4>Hi,</h4><br/>You login to the system at:" + DateTime.Now.ToString("MM-dd-yyyy h:mm:sstt") + "";
                                mail.IsBodyHtml = true;
                                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                                {
                                    smtp.Credentials = new NetworkCredential("###", "####");
                                    smtp.EnableSsl = true;
                                    smtp.Send(mail);
                                }
                            }*/
                            Response.Redirect("Home.aspx");
                        }
                    }
                    else if(Type == "1")
                    {
                        /*using (MailMessage mail = new MailMessage())
                        {
                            mail.From = new MailAddress("#####");
                            mail.To.Add(Email);
                            mail.Subject = "Login";
                            mail.Body = "<h4>Hi,</h4><br/>Your login to the system at:" + DateTime.Now.ToString("MM-dd-yyyy h:mm:sstt") + "";
                            mail.IsBodyHtml = true;


                            using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                            {
                                smtp.Credentials = new NetworkCredential("####", "#####");
                                smtp.EnableSsl = true;
                                smtp.Send(mail);
                            }
                        }*/
                        Response.Redirect("Home.aspx");
                    }
                    else if (Type == "0")
                    {
                        /*using (MailMessage mail = new MailMessage())
                        {
                            mail.From = new MailAddress("####");
                            mail.To.Add(Email);
                            mail.Subject = "Login";
                            mail.Body = "<h4>Hi,</h4><br/>Your login to the system at:" + DateTime.Now.ToString("MM-dd-yyyy h:mm:sstt") + "";
                            mail.IsBodyHtml = true;


                            using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                            {
                                smtp.Credentials = new NetworkCredential("####", "#####");
                                smtp.EnableSsl = true;
                                smtp.Send(mail);
                            }
                        }*/
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    MSG.Text = "Username or Password Incorrect";
                }
                con.Close();
            }
        }

        protected void MoveToRegistration(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
    }
}