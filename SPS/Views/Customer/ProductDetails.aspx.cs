using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;

namespace SPS.Views.Customer
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString);

        string Name, Price, Detalis, Qty, image;
        string Qun;
        int RelQ = 0;
        int Max = 6;
        int res = 0;
        int q;
        string s;
        string t;
        string[] a = new string[6];
        int idddd = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                foreach (DataListItem item in DataList1.Items)
                {

                    Label lll = (Label)item.FindControl("qlab");


                    RelQ = Convert.ToInt32(lll.Text);

                }
                if (RelQ > Max)
                {
                    res = Max;
                }
                else
                {
                    res = RelQ;
                }

                for (int r = 1; r <= res; r++)
                {
                    Qdrob.Items.Add(r.ToString());
                }
            }

            int id = Convert.ToInt32(Request.QueryString["pid"]);
            q = get_qty(id);

            if (q == 0)
            {
                Qdrob.Visible = false;
                AddToCart.Visible = false;
                ErrorMsg.Text = "There is no available quantity";
            }
        }
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["pid"]);

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Product where ProductID=" + id;
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                Name = dr["Name"].ToString();
                Detalis = dr["Deatalis"].ToString();
                Price = dr["Price"].ToString();
                Qty = dr["Quantity"].ToString();
                image = dr["Image"].ToString();

            }

            con.Close();

            Qun = Qdrob.SelectedItem.Text;

            if (Request.Cookies["aa"] == null)
            {
                Response.Cookies["aa"].Value = Name.ToString() + "," + Detalis.ToString() + "," + Price.ToString() + "," + Qun.ToString() + "," + image.ToString() + "," + id.ToString();
                Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
            }
            else
            {
                DataTable d = new DataTable();
                d.Columns.AddRange(new DataColumn[7] { new DataColumn("Name"), new DataColumn("Deatalis"), new DataColumn("Price"), new DataColumn("Quantity"), new DataColumn("Image"), new DataColumn("id"), new DataColumn("PID") });

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
                    d.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), i.ToString(), a[5].ToString());


                    idddd = Convert.ToInt32(a[5].ToString());

                }

                if (idddd == id)
                {
                    ErrorMsg.Text = " ";
                }
                else
                {
                    Response.Cookies["aa"].Value = Request.Cookies["aa"].Value + "|" + Name.ToString() + "," + Detalis.ToString() + "," + Price.ToString() + "," + Qun.ToString() + "," + image.ToString() + "," + id.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        public int get_qty(int id)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Product where ProductID=" + id;
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {

                q = Convert.ToInt32(dr["Quantity"].ToString());

            }

            return q;
        }

    }
}