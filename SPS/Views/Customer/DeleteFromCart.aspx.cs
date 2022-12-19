using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SPS.Views.Customer
{
    public partial class DeleteFromCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString);
        string s;
        string t;
        string[] a = new string[6];
        string Name, Price, Detalis, Qty, image;
        int idd = 0;
        int count = 0;

        int PID, Pqty;
        protected void Page_Load(object sender, EventArgs e)
        {

            idd = Convert.ToInt32(Request.QueryString["id"].ToString());

            DataTable dtt = new DataTable();
            dtt.Rows.Clear();

            dtt.Columns.AddRange(new DataColumn[7] { new DataColumn("Name"), new DataColumn("Deatalis"), new DataColumn("Price"), new DataColumn("Quantity"), new DataColumn("Image"), new DataColumn("id"), new DataColumn("PID") });

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

                    dtt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), i.ToString(), a[5].ToString());
                }
            }


            


            DataRow[] dtr = dtt.Select("PID=" + idd);
            foreach (var drow in dtr)
            {
                drow.Delete();
                break;
            }
            



            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);



            foreach (DataRow dr in dtt.Rows)
            {
                Name = dr["Name"].ToString();
                Detalis = dr["Deatalis"].ToString();
                Price = dr["Price"].ToString();
                Qty = dr["Quantity"].ToString();
                image = dr["Image"].ToString();
                PID = Convert.ToInt32(dr["PID"].ToString());

                count = count + 1;


                if (count == 1)
                {
                    Response.Cookies["aa"].Value = Name.ToString() + "," + Detalis.ToString() + "," + Price.ToString() + "," + Qty.ToString() + "," + image.ToString() + "," + PID.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["aa"].Value = Response.Cookies["aa"].Value + "|" + Name.ToString() + "," + Detalis.ToString() + "," + Price.ToString() + "," + Qty.ToString() + "," + image.ToString() + "," + PID.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
                }

            }

            Response.Redirect("Cart.aspx");

        }
    }
}