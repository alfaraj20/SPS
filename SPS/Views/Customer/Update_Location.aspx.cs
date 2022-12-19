using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

namespace SPS.Views.Customer
{
    public partial class Update_Location : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Users where Username='" + Session["user"].ToString() + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                FN.Text = dr["Fname"].ToString();
                LN.Text = dr["Lname"].ToString();
                Country.Text = dr["Country"].ToString();
                Region.Text = dr["Region"].ToString();
                City.Text = dr["City"].ToString();
                NB.Text = dr["neighborhood"].ToString();
                Street.Text = dr["Street"].ToString();
                ZipC.Text = dr["ZipCode"].ToString();
                Mob.Text = dr["Phone"].ToString();
                email.Text = dr["Email"].ToString();

            }

            con.Close();

        }

        protected void but_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update Users set Fname='" + FN.Text + "',Lname='" + LN.Text + "',Country='" + Country.Text + "',Region='" + Region.Text + "',City='" + City.Text + "',neighborhood='" + NB.Text + "',Street='" + Street.Text + "',ZipCode='" + ZipC.Text + "',Phone='" + Mob.Text + "',Email='"+email.Text+"' where Username='" + Session["user"].ToString() + "'";
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Payment.aspx");
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
    }
}