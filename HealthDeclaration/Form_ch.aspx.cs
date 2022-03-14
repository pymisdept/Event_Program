using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.Security.Cryptography;

using System.Net;
using System.Data;
using System.Data.SqlClient;

public partial class Form_ch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string site = Request.QueryString["site"];

        if (string.IsNullOrEmpty(site))
        {
            Response.Redirect("Guide");
        }
        else
        {
            try
            {
                string key = EncryptClass.Decrypt(site);
                site_id.Value = site;

                string sql = "select project_desc from t_SiteProjectList where project = @key";
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DashboardConnection"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = sql;
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add("@key", SqlDbType.VarChar, 20).Value = key;

                SqlDataReader rd = cmd.ExecuteReader();

                if (rd.Read())
                {
                    site_location.InnerHtml = rd.GetString(0);
                    site_id.Value = site;
                    hyperlink.Attributes["href"] = "Form_en?site=" + site;
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("Guide");
            }

        }
    }
}
