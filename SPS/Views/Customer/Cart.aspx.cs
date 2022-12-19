using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace SPS.Views.Customer
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        string s;
        string t;
        string[] a = new string[6];
        double total = 0;



        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox search = this.Master.FindControl("search") as TextBox;
            Button searchbtn = this.Master.FindControl("searchbtn1") as Button;
            search.Enabled = false;
            search.Visible = false;
            searchbtn.Enabled = false;
            searchbtn.Visible = false;
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] { new DataColumn("Name"), new DataColumn("Deatalis"), new DataColumn("Price"), new DataColumn("Quantity"), new DataColumn("Image"), new DataColumn("id"), new DataColumn("PID") });



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
                    dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), i.ToString(), a[5].ToString());



                    total = total + (Convert.ToDouble(a[2].ToString()) * Convert.ToDouble(a[3].ToString()));

                }




            }



            d1.DataSource = dt;
            d1.DataBind();

            TotLab.Text = total.ToString();

        }

        protected void CheckOut_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["aa"] == null)
            {
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else
            {
                Session["CheckoutBut"] = "yes";
                Response.Redirect("Checkout.aspx");
            }
        }
    }
}