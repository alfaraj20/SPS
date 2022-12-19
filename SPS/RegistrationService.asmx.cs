using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;
using AjaxControlToolkit;

namespace SPS
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class RegistrationService : System.Web.Services.WebService
    {
        //Database connection string
        private static string strconnection = ConfigurationManager.AppSettings["SPS"].ToString();
        //database connection
        SqlConnection concountry = new SqlConnection(strconnection);

        [WebMethod]
        public bool IsWorkshopNameAvailable(string workshopName)
        {
            bool ret = false;
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("spUserNameExists", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter()
                    {
                        ParameterName = "@Name",
                        Value = workshopName
                    });

                    con.Open();
                    ret = Convert.ToBoolean(cmd.ExecuteScalar());

                }
                return ret;
            }
            catch
            {
                return false;
            }
        }
        [WebMethod]
        public bool IsWorkshopPhoneNumberAvailable(string workshopPhone)
        {
            bool ret = false;
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("spWorkshopPhonenumberExistsk", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter()
                    {
                        ParameterName = "@Phone",
                        Value = workshopPhone
                    });

                    con.Open();
                    ret = Convert.ToBoolean(cmd.ExecuteScalar());

                }
                return ret;
            }
            catch
            {
                return false;
            }
        }
        [WebMethod]
        public bool IsWorkshopEmailAvailable(string workshopEmail)
        {
            bool ret = false;
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("spWorkshopEmailExistsk", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter()
                    {
                        ParameterName = "@Email",
                        Value = workshopEmail
                    });

                    con.Open();
                    ret = Convert.ToBoolean(cmd.ExecuteScalar());

                }
                return ret;
            }
            catch
            {
                return false;
            }
        }
        [WebMethod]
        public bool IsWorkshopLicenseAvailable(string workshopLicense)
        {
            bool ret = false;
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SPS"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("spWorkshopLicenseExistsk", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter()
                    {
                        ParameterName = "@License",
                        Value = workshopLicense
                    });

                    con.Open();
                    ret = Convert.ToBoolean(cmd.ExecuteScalar());

                }
                return ret;
            }
            catch
            {
                return false;
            }
        }
    }
}