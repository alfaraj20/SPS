using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SPS.Views.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        string Cs = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string TypeUser = Session["UserType"] as string;
            string LoginID = Session["WorkshopID"] as string;
            string ID = Session["ID"] as string;
            FileUploadBtn1.Attributes.Add("onclick", "document.getElementById('" + FileUploadArea.ClientID + "').click(); return false;");
            Check();
            if (!IsPostBack)
            {
                BindBind();
            }
            if (TypeUser == "1")
            {
                SupplierName.Enabled = true;
            }
            else if(TypeUser == "2")
            {
                SupplierName.Enabled = false;
                SupplierName.SelectedValue = LoginID;
            }
        }
        private void BindBind()
        {
            string TypeUser = Session["UserType"] as string;
            string LoginID = Session["WorkshopID"] as string;
            if (TypeUser == "1")
            {
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    SqlCommand cmd1 = new SqlCommand("select * from Product ORDER BY ProductID DESC", con1);
                    con1.Open();
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = cmd1;
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    SqlDataReader sdr = cmd1.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        DataList1.DataSource = ds;
                        DataList1.DataBind();
                        DataList1.Visible = true;
                        Product1.Visible = false;
                    }
                    else
                    {
                        DataList1.Visible = false;
                        Product1.Visible = true;
                    }
                    con1.Close();
                    Check();
                    selected.Text = "0";
                }
            }
            else if (TypeUser == "2")
            {
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    SqlCommand cmd1 = new SqlCommand("select * from Product where WorkshopID = '"+ LoginID + "'ORDER BY ProductID DESC", con1);
                    con1.Open();
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = cmd1;
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    SqlDataReader sdr = cmd1.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        DataList1.DataSource = ds;
                        DataList1.DataBind();
                        DataList1.Visible = true;
                        Product1.Visible = false;
                        SupplierName.SelectedValue = LoginID;
                    }
                    else
                    {
                        DataList1.Visible = false;
                        Product1.Visible = true;
                    }
                    con1.Close();
                    Check();
                    selected.Text = "0";
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Customer/LoginRegistration.aspx");
            }
        }
        private void BindBind1()
        {
            string TypeUser = Session["UserType"] as string;
            string LoginID = Session["WorkshopID"] as string;

            if (TypeUser == "1")
            {
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    TextBox search = this.Master.FindControl("search1") as TextBox;
                    SqlConnection con = new SqlConnection(Cs);
                    SqlCommand cmd = new SqlCommand("ProductSearch", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NameProductSearch", search.Text);
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        DataList1.Visible = true;
                        DataList1.DataSource = sdr;
                        DataList1.DataBind();
                    }
                    else
                    {
                        DataList1.Visible = false;
                    }
                    Check();
                }
            }
            else if (TypeUser == "2")
            {
                using (SqlConnection con1 = new SqlConnection(Cs))
                {
                    TextBox search = this.Master.FindControl("search1") as TextBox;
                    SqlConnection con = new SqlConnection(Cs);
                    SqlCommand cmd = new SqlCommand("ProductSearchLogin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NameProductSearch", search.Text);
                    cmd.Parameters.AddWithValue("@NameProductSearchLogin", LoginID);
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        DataList1.Visible = true;
                        Product1.Visible = false;
                        DataList1.DataSource = sdr;
                        DataList1.DataBind();
                    }
                    else
                    {
                        DataList1.Visible = false;
                        Product1.Visible = true;
                    }
                    Check();
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Customer/LoginRegistration.aspx");
            }
        }
        protected void Check()
        {
            foreach (DataListItem item in DataList1.Items)
            {
                Label ID = item.FindControl("ID") as Label;
                CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                CheckBoxDelete.InputAttributes["class"] = "DeleteMultiple1";
            }
        }
        private void BindDropDownList(DropDownList ddl, string query, string text, string value, string defaultText)
        {
            string conString = ConfigurationManager.ConnectionStrings["SPS"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    con.Open();
                    ddl.DataSource = cmd.ExecuteReader();
                    ddl.DataTextField = text;
                    ddl.DataValueField = value;
                    ddl.DataBind();
                    con.Close();
                }
            }
        }

        protected void CarName_TextChanged(object sender, EventArgs e)
        {
            DropDownList CompanyName = (sender as DropDownList);
            DataListItem item = (CompanyName.NamingContainer as DataListItem);
            DropDownList CarName = item.FindControl("CarName") as DropDownList;
            int countryId = int.Parse(CompanyName.SelectedItem.Value);
            if (countryId > 0)
            {
                string query = string.Format("select CarNameID, CarName from CarName where WorkshopCategoryID = {0}", countryId);
                BindDropDownList(CarName, query, "CarName", "CarNameID", "Select car name");
            }
        }
        protected void InsertWorkshop(object sender, EventArgs e)
        {
            try
            {
                if (FileUploadArea.HasFile)
                {
                    FileUploadArea.SaveAs(Server.MapPath("/Images/Admin/Products/" + "(" + DateTime.Now.ToString("dd-MM-yy--hh--mm--ss--tt") + ")" + FileUploadArea.FileName));
                    string FileUploadPath = FileUploadArea.FileName;
                    SqlConnection con = new SqlConnection(Cs); //Create Object.
                    con.Open(); //Open Connection On Database. 
                    string Statment = "insert into Product values (@Name, @Price, @Quantity, @Model, @Deatalis, @Image, @CompanyName, @CarName, @WorkshopID, @CategoryProduct, @CompanyID, @CarNameID, @Date)"; //Statment To Insert Data.
                    SqlCommand cmd = new SqlCommand(Statment, con); //Open Command Insert Into Database.
                    cmd.Parameters.AddWithValue("@Name", ProductName.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Price", ProducPrice.Text);
                    cmd.Parameters.AddWithValue("@Quantity", ProductQuantity.Text);
                    cmd.Parameters.AddWithValue("@Model", ProductMatchYears.Text);
                    cmd.Parameters.AddWithValue("@Deatalis", ProductDetails.InnerText);
                    cmd.Parameters.AddWithValue("@Image", "~/Images/Admin/Products/" + "(" + DateTime.Now.ToString("dd-MM-yy--hh--mm--ss--tt") + ")" + FileUploadPath);
                    cmd.Parameters.AddWithValue("@CompanyName", CompanyName.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@CarName", CarName.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@WorkshopID", SupplierName.SelectedValue);
                    cmd.Parameters.AddWithValue("@CategoryProduct", CategoryProduct.SelectedValue);
                    cmd.Parameters.AddWithValue("@CompanyID", CompanyName.SelectedValue);
                    cmd.Parameters.AddWithValue("@CarNameID", CarName.SelectedValue);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("MM-dd-yyyy h:mm:sstt"));
                    cmd.ExecuteNonQuery(); //Close Command Insert Into Database.
                    con.Close(); //Close Connection On Database. 
                    CascadingDropDownCompanyName.SelectedValue = "";
                    ProducPrice.Text = ProductMatchYears.Text = ProductDetails.InnerText = ProductQuantity.Text = string.Empty;
                    BindBind();
                    Check();
                }
                else
                {
                    Check();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The Problem Is: '" + ex + "'')", true);
            }
        }
        protected void Delete(object sender, EventArgs e)
        {
            var drp = (DropDownList)sender;
            var row = (DataListItem)drp.NamingContainer;
            int id = Convert.ToInt32(((HiddenField)row.FindControl("Hidden")).Value) - 1;
            string item = ((DropDownList)DataList1.Controls[id].FindControl("DropDownListChose")).SelectedItem.Text;
            string ID = ((Label)DataList1.Controls[id].FindControl("ID")).Text;
            string ProductName = ((DropDownList)DataList1.Controls[id].FindControl("ProductName")).SelectedItem.Text;
            if (item == "Delete")
            {
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("delete from Product where ProductID='" + ID + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                BindBind();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Deleted Successfully','(" + ProductName + ")','success')", true);
                DataList1.EditItemIndex = -1;
                this.BindBind();
                BindBind();
            }
            else if (item == "Cancel")
            {
                DataList1.EditItemIndex = -1;
                this.BindBind1();
                Check();
            }
            else
            {
                Check();
            }
        }
        protected void Update(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                try
                {
                    FileUpload thumbnailImageUpload = (FileUpload)DataList1.Items[DataList1.EditItemIndex].FindControl("aaa");
                    TextBox search = this.Master.FindControl("search1") as TextBox;
                    if (thumbnailImageUpload.HasFile)
                    {
                        string FileUploadPath = "/Images/Admin/Products/" + thumbnailImageUpload.FileName;
                        string ID = ((Label)e.Item.FindControl("ID")).Text;
                        string Name = ((DropDownList)e.Item.FindControl("ProductName")).SelectedItem.Text;
                        string Price = ((TextBox)e.Item.FindControl("ProducPrice")).Text;
                        string Quantity = ((TextBox)e.Item.FindControl("ProductQuantity")).Text;
                        string Model = ((TextBox)e.Item.FindControl("ProductMatchYears")).Text;
                        string Deatalis = ((HtmlTextArea)e.Item.FindControl("ProductDetails")).InnerText;
                        string CompanyName = ((DropDownList)e.Item.FindControl("CompanyName")).SelectedItem.Text;
                        string CarName = ((DropDownList)e.Item.FindControl("CarName")).SelectedItem.Text;
                        string WorkshopID = ((DropDownList)e.Item.FindControl("SupplierName")).SelectedValue;
                        string CategoryProduct = ((DropDownList)e.Item.FindControl("CategoryProduct")).SelectedValue;
                        string CompanyNameValue = ((DropDownList)e.Item.FindControl("CompanyName")).SelectedValue;
                        string CarNameValue = ((DropDownList)e.Item.FindControl("CarName")).SelectedValue;
                        SqlConnection con = new SqlConnection(Cs);
                        SqlCommand cmd = new SqlCommand("update Product set Name='" + Name + "',Price='" + Price + "',Quantity='" + Quantity + "',Model='" + Model + "',Deatalis='" + Deatalis + "',CompanyName='" + CompanyName + "',WorkshopID='"+ WorkshopID + "',CategoryProduct='"+CategoryProduct+ "',CompanyID='"+CompanyNameValue+ "',CarNameID='"+CarNameValue+"',Image=/Images/Admin/Products/'"+ "(" + DateTime.Now.ToString("dd-MM-yy--hh--mm--ss--tt") + ")" + FileUploadPath + "'where ProductID=" + ID, con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        DataList1.EditItemIndex = -1;
                        this.BindBind();
                    }
                    else
                    {
                        string ID = ((Label)e.Item.FindControl("ID")).Text;
                        string Name = ((DropDownList)e.Item.FindControl("ProductName")).SelectedItem.Text;
                        string Price = ((TextBox)e.Item.FindControl("ProducPrice")).Text;
                        string Quantity = ((TextBox)e.Item.FindControl("ProductQuantity")).Text;
                        string Model = ((TextBox)e.Item.FindControl("ProductMatchYears")).Text;
                        string Deatalis = ((HtmlTextArea)e.Item.FindControl("ProductDetails")).InnerText;
                        string CompanyName = ((DropDownList)e.Item.FindControl("CompanyName")).SelectedItem.Text;
                        string CarName = ((DropDownList)e.Item.FindControl("CarName")).SelectedItem.Text;
                        string WorkshopID = ((DropDownList)e.Item.FindControl("SupplierName")).SelectedValue;
                        string CategoryProduct = ((DropDownList)e.Item.FindControl("CategoryProduct")).SelectedValue;
                        string CompanyNameValue = ((DropDownList)e.Item.FindControl("CompanyName")).SelectedValue;
                        string CarNameValue = ((DropDownList)e.Item.FindControl("CarName")).SelectedValue;
                        SqlConnection con = new SqlConnection(Cs);
                        SqlCommand cmd = new SqlCommand("update Product set Name='" + Name + "',Price='" + Price + "',Quantity='" + Quantity + "',Model='" + Model + "',Deatalis='" + Deatalis + "',CompanyName='" + CompanyName + "',WorkshopID='" + WorkshopID + "',CategoryProduct='" + CategoryProduct + "',CompanyID='" + CompanyNameValue + "',CarNameID='" + CarNameValue + "'where ProductID=" + ID, con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        search.Text = string.Empty;
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Updated Successfully','(" + Name + ")','success')", true);
                        DataList1.EditItemIndex = -1;
                        this.BindBind();
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, GetType(), "alertMessage", "alert('The Problem Is: '" + ex + "'')", true);
                }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FileUpload thumbnailImageUpload = (FileUpload)DataList1.Items[DataList1.EditItemIndex].FindControl("aaa");
            Label WorkshopID = (Label)DataList1.Items[DataList1.EditItemIndex].FindControl("ID");
            DropDownList CompanyName = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("CompanyName");
            DropDownList CarName = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("CarName");
            DropDownList CategoryProduct = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("CategoryProduct");
            DropDownList ProductName = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("ProductName");
            DropDownList SupplierName = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("SupplierName");
            TextBox ProductQuantity = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("ProductQuantity");
            TextBox ProducPrice = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("ProducPrice");
            TextBox ProductMatchYears = (TextBox)DataList1.Items[DataList1.EditItemIndex].FindControl("ProductMatchYears");
            HtmlTextArea ProductDetails = (HtmlTextArea)DataList1.Items[DataList1.EditItemIndex].FindControl("ProductDetails");
            string ID = WorkshopID.Text;
            if (thumbnailImageUpload.HasFile)
            {
                thumbnailImageUpload.SaveAs(Server.MapPath("/Images/Admin/Products/" + "(" + DateTime.Now.ToString("dd-MM-yy--hh--mm--ss--tt") + ")" + thumbnailImageUpload.FileName));
                string FileUploadPath = thumbnailImageUpload.FileName;
                SqlConnection con = new SqlConnection(Cs);
                SqlCommand cmd = new SqlCommand("update Product set Name='" + ProductName.SelectedItem.Text + "',Price='" + ProducPrice.Text + "',Quantity='" + ProductQuantity.Text + "',Model='" + ProductMatchYears.Text + "',Deatalis='" + ProductDetails.InnerText + "',CarName='"+CarName.SelectedItem.Text+ "',WorkshopID='"+SupplierName.SelectedValue+ "',CategoryProduct='"+CategoryProduct.SelectedValue+ "',CompanyID='"+CompanyName.SelectedValue+ "',CarNameID='"+CarName.SelectedValue+ "',Image=@Image where ProductID = @ID", con);
                con.Open();
                cmd.Parameters.AddWithValue("@Image", "~/Images/Admin/Products/"+ "(" + DateTime.Now.ToString("dd-MM-yy--hh--mm--ss--tt") + ")" + FileUploadPath);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Updated Successfully','(" + ProductName.SelectedItem.Text + ")','success')", true);
                DataList1.EditItemIndex = -1;
                this.BindBind1();
            }
        }
        protected void CheckBox(object sender, EventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                CheckBox CheckBoxDelete = item.FindControl("DeleteMultiple") as CheckBox;
                if (CheckBoxDelete.Checked)
                {
                    int ID = int.Parse((item.FindControl("ID") as Label).Text.Trim());
                    SqlConnection con = new SqlConnection(Cs);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete from Product where ProductID='" + ID + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "AlertTest", "swal('Deleted Successfully','','success')", true);
                }
            }
            BindBind();
        }
        protected void Edit(object sender, EventArgs e)
        {
            DataListItem item = (sender as HtmlInputButton).NamingContainer as DataListItem;
            DataList1.EditItemIndex = item.ItemIndex;
            BindBind1();
            string TypeUser = Session["UserType"].ToString();

            if (TypeUser == "1")
            {
            }
            else if (TypeUser == "2")
            {
                DropDownList SupplierName = (DropDownList)DataList1.Items[DataList1.EditItemIndex].FindControl("SupplierName");
                SupplierName.Enabled = false;
            }
        }
    }
}