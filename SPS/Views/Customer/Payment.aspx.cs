using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;

namespace SPS.Views.Customer
{
    public partial class Payment1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString);
        string order_id;
        string order_details_id;
        string s;
        string t;
        string[] a = new string[6];
        int status = 1;
        string CustomerEmail;
        string Fname, Lname;
        string Workshopid;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Buy_Click(object sender, EventArgs e)
        {

            string name = Session["user"].ToString();
            string ID = Session["ID"].ToString();

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Users where Username='" + name + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                CustomerEmail = dr["Email"].ToString();
                Fname = dr["Fname"].ToString();
                Lname = dr["Lname"].ToString();
                SqlCommand cmd1 = con.CreateCommand();
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "insert into Orders values('" + dr["Fname"].ToString() + "','" + dr["Lname"].ToString() + "','" + dr["Country"].ToString() + "','" + dr["Region"].ToString() + "','" + dr["City"].ToString() + "','" + dr["neighborhood"].ToString() + "','" + dr["Street"].ToString() + "','" + dr["ZipCode"].ToString() + "','" + dr["Phone"].ToString() + "','" + Session["user"].ToString() + "','" + status + "','"+ ID +"')";
                cmd1.ExecuteNonQuery();
            }



            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "select top 1 * from Orders where Username='" + Session["user"].ToString() + "' order by OrderID desc ";
            cmd2.ExecuteNonQuery();
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(dt2);
            foreach (DataRow dr2 in dt2.Rows)
            {
                order_id = dr2["OrderID"].ToString();
            }




            if (Request.Cookies["aa"] != null)
            {

                s = Convert.ToString(Request.Cookies["aa"].Value);


                string[] strArr = s.Split('|');

                for (int i = 0; i < strArr.Length; i++)
                {
                    t = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = t.Split(',');
                    for (int j = 0; j < strArr1.Length; j++)
                    {
                        a[j] = strArr1[j].ToString();
                    }


                    SqlCommand cm = con.CreateCommand();
                    cm.CommandType = CommandType.Text;
                    cm.CommandText = "update Product set Quantity = Quantity -" + Convert.ToInt32(a[3].ToString()) + "where ProductID=" + Convert.ToInt32(a[5].ToString());
                    cm.ExecuteNonQuery();

                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "select * from Product where ProductID=" + Convert.ToInt32(a[5].ToString());
                    cmd1.ExecuteNonQuery();
                    DataTable dt1 = new DataTable();
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    da1.Fill(dt1);
                    foreach (DataRow dr1 in dt1.Rows)
                    {
                        Workshopid = dr1["WorkshopID"].ToString();
                    }

                    SqlCommand cmd3 = con.CreateCommand();
                    cmd3.CommandType = CommandType.Text;
                    cmd3.CommandText = "insert into Order_details values('" + order_id.ToString() + "','" + a[0].ToString() + "','" + Convert.ToDecimal(a[2].ToString()) + "','" + Convert.ToInt32(a[3].ToString()) + "','" + a[4].ToString() + "','" + DateTime.Now.ToString("MM-dd-yyyy") + "','"+ DateTime.Now.ToString("dd-MM-yyyy h:mm:sstt") + "','"+ Convert.ToInt32(Workshopid)+"','"+ ID + "')";
 
                     cmd3.ExecuteNonQuery();

                }


            }


            SqlCommand cmd4 = con.CreateCommand();
            cmd4.CommandType = CommandType.Text;
            cmd4.CommandText = "select top 1 * from Order_details where order_id='" + order_id + "' order by Id desc ";
            cmd4.ExecuteNonQuery();
            DataTable dt4 = new DataTable();
            SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
            da4.Fill(dt4);
            foreach (DataRow dr4 in dt4.Rows)
            {
                order_details_id = dr4["Id"].ToString();
            }


            SqlCommand cmd5 = con.CreateCommand();
            cmd5.CommandType = CommandType.Text;
            cmd5.CommandText = "insert into Payment values('" + order_id.ToString() + "','" + NOC.Text + "','" + CNum.Text + "','" + EM.Text + "','" + EY.Text + "','" + CVV.Text + "','" + order_details_id.ToString() + "','" + DateTime.Now.ToString("dd-MM-yyyy--hh--mm") + "')";
            cmd5.ExecuteNonQuery();

            con.Close();


            /*using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("####");
                mail.To.Add(CustomerEmail);
                mail.Subject = "Thank You For Your Purchase";
                mail.Body = "<h4>Hi," + Fname + " " + Lname + "</h4><br/> Your order has been received and it will be delivered to you within 1-2 days <br/>  <p> Order Number:" + order_id + "</p>";
                mail.IsBodyHtml = true;


                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new NetworkCredential("####", "####");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
            }
            */
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);





            Session["done"] = "yes";

            Response.Redirect("Home.aspx");

        }
    }
}