using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SPS
{
    public partial class HeaderAndFooter : System.Web.UI.MasterPage
    {
        string s;
        string t;
        string[] a = new string[6];
        double total = 0;
        int totcount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            ContentPlaceHolder MainContent = Page.Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
            HtmlControl AddWorkshopDiv = MainContent.FindControl("AddWorkshopDiv") as HtmlControl;
            string TypeUser = Session["UserType"] as string;
            if (TypeUser == "0")
            {
                Dashboard.Visible = false;
                Dashboard.Enabled = false;
                Login.Visible = false;
            }
            else if (TypeUser == "1")
            {
                Login.Visible = false;
            }
            else if (TypeUser == "2")
            {
                Login.Visible = false;
            }
            else
            {
                Dashboard.Visible = false;
                Dashboard.Enabled = false;
                Logout.Visible = false;
                CustomerOrders.Visible = false;
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

                    totcount = totcount + 1;

                    cartcount.Text = totcount.ToString();

                }

            }
        }
        protected void MoveToDashboard(object sender, EventArgs e)
        {
            Response.Redirect("../Admin/Dashboard.aspx");
        }
        protected void MoveToOders(object sender, EventArgs e)
        {
            Response.Redirect("../Admin/Orders.aspx");
        }

        protected void LogoutBtn(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Views/Customer/Home.aspx");
        }
        protected void MoveToCart(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/Customer/cart.aspx");
        }
    }
}