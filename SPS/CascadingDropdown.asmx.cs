using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
using AjaxControlToolkit;

namespace SPS
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.Web.Script.Services.ScriptService()]
    public class CascadingDropdown : System.Web.Services.WebService
    {
        public CascadingDropdown()
        {

            //Uncomment the following line if using designed components
            //InitializeComponent();
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString);
        [WebMethod]
        public CascadingDropDownNameValue[] BindProduct(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from CompanyName", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> ProductDetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string productID = DR["CompanyID"].ToString();
                string productName = DR["CompanyName"].ToString();
                ProductDetails.Add(new CascadingDropDownNameValue(productName, productID));
            }
            return ProductDetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindBrand(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            int ProductID;
            StringDictionary ProductDetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            ProductID = Convert.ToInt32(ProductDetails["product"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from CarName where WorkshopCategoryID=@ProductID", conn);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> BrandDetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string brandID = DR["CarNameID"].ToString();
                string brandName = DR["CarName"].ToString();
                BrandDetails.Add(new CascadingDropDownNameValue(brandName, brandID));
            }
            return BrandDetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindCategoryProduct(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from CategoryProduct", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> ProductDetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string productID = DR["CategoryProductID"].ToString();
                string productName = DR["CategoryProductName"].ToString();
                ProductDetails.Add(new CascadingDropDownNameValue(productName, productID));
            }
            return ProductDetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindProductName(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            int ProductID;
            StringDictionary ProductDetails = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            ProductID = Convert.ToInt32(ProductDetails["CategoryProduct"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from ProductName where CategoryProductID=@ProductID", conn);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> BrandDetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string brandID = DR["CategoryProductID"].ToString();
                string brandName = DR["ProductName"].ToString();
                BrandDetails.Add(new CascadingDropDownNameValue(brandName, brandID));
            }
            return BrandDetails.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindSupplierName(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from WorkShopR", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> ProductDetails = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string productID = DR["WorkshopID"].ToString();
                string productName = DR["Name"].ToString();
                ProductDetails.Add(new CascadingDropDownNameValue(productName, productID));
            }
            return ProductDetails.ToArray();
        }
    }
}
