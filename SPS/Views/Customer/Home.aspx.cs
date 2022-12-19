using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPS.Views.Customer
{
    public partial class Home : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            TextBox search = this.Master.FindControl("search") as TextBox;
            Button searchbtn = this.Master.FindControl("searchbtn1") as Button;
            string TypeUser = Session["UserType"] as string;
            search.Enabled = false;
            search.Visible = false;
            searchbtn.Enabled = false;
            searchbtn.Visible = false;
            if (!IsPostBack)
            {
                if (Session["done"] == "yes")
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Your order has been successfully received','success')", true);
                    Session["done"] = null;
                }

                if (TypeUser == "0")
                {
                    AddWorkshopDiv.Visible = true;
                }
                else if (TypeUser == "1")
                {
                    AddWorkshopDiv.Visible = false;
                }
                else if (TypeUser == "2")
                {
                    AddWorkshopDiv.Visible = false;
                }
                else
                {
                    AddWorkshopDiv.Visible = true;
                }
            }
        }
        protected void AddWorkshop(object sender, EventArgs e)
        {
            Session["Add"] = "Add";
            Session["Add1"] = "Add1";
            Response.Redirect("LoginRegistration.aspx");
        }
    }
}