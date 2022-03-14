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
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;

public partial class Confirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string sql = "insert into t_HealthDeclare (project, salutation, name, comp, post, tel, q1, q2, q3, q4, q5, q6, created, q5_1) values (@proj, @sal, @name, @comp, @post, @tel, @q1, @q2, @q3, @q4, @q5, @q6, GETDATE(), @q5_1)";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DashboardConnection"].ConnectionString);

            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = sql;
            cmd.CommandType = CommandType.Text;

            var q1 = Request.Form["q1"];
            var q2 = Request.Form["q2"];
            var q3 = Request.Form["q3"];
            var q4 = Request.Form["q4"];
            //var q5 = Request.Form["q5"];
            var q5_1 = Request.Form["q5_1"];
            var q6 = "";

            if(q5_1 == "Y")
                q6 = "";
            else
                q6 = Request.Form["q6"];

            cmd.Parameters.Add("@proj", SqlDbType.NVarChar, 10).Value = EncryptClass.Decrypt(Request.Form["site_id"]);
            cmd.Parameters.Add("@sal", SqlDbType.NVarChar, 10).Value = Request.Form["salutation"];
            cmd.Parameters.Add("@name", SqlDbType.NVarChar, 100).Value = Request.Form["name"];
            cmd.Parameters.Add("@post", SqlDbType.NVarChar, 100).Value = Request.Form["post"];
            cmd.Parameters.Add("@comp", SqlDbType.NVarChar, 100).Value = Request.Form["comp"];
            cmd.Parameters.Add("@tel", SqlDbType.NVarChar, 100).Value = Request.Form["tel"];
            cmd.Parameters.Add("@q1", SqlDbType.NVarChar, 1).Value = q1;
            cmd.Parameters.Add("@q2", SqlDbType.NVarChar, 1).Value = q2;
            cmd.Parameters.Add("@q3", SqlDbType.NVarChar, 1).Value = q3;
            cmd.Parameters.Add("@q4", SqlDbType.NVarChar, 1).Value = q4;
            cmd.Parameters.Add("@q5", SqlDbType.NVarChar, 1).Value = "";
            cmd.Parameters.Add("@q6", SqlDbType.NVarChar, 1).Value = q6;
            cmd.Parameters.Add("@q5_1", SqlDbType.NVarChar, 1).Value = q5_1;
            cmd.Prepare();


            cmd.ExecuteNonQuery();
            conn.Close();

             if (q1 == "Y" || q2 == "Y" || q3 == "Y" || q4 == "Y" || q6 == "N")
            {
                message.InnerHtml = "感謝你提供的資料。<br />根據 閣下填寫的資料，我們不建議 閣下進入地盤，如有任何問題請與地盤職員聯絡。<br /><br />Thank you for the information. <br />Based on the information provided, we could not allow you to enter the site. Should you have any questions, please contact our site staff.";
                image1.ImageUrl = @"~/images/cross.png";
                lastdate.InnerHtml = "最後更新日期: (" + DateTime.Now.ToString("yyyy年MM月dd日 HH時mm分") + ")";
            }
            else
            {
                message.InnerHtml = "感謝你提供的資料。<br />我們會盡快安排量度體溫，如有任何問題請與地盤職員聯絡。<br /><br />Thank you for the information. <br />Our site staff will take your temperature. Should you have any questions, please contact our site staff.";
                image1.ImageUrl = @"~/images/tick.png";
                lastdate.InnerHtml = "最後更新日期: (" + DateTime.Now.ToString("yyyy年MM月dd日 HH時mm分") + ")";
            }
        }

        catch (Exception ex)
        {
            message.InnerHtml = "暫時未能提交資料，請稍後再試。<br /><br />Please try again later.<br />";
            image1.ImageUrl = @"~/images/cross.png";
            lastdate.InnerHtml = "最後更新日期: (" + DateTime.Now.ToString("yyyy年MM月dd日 HH時mm分") + ")";
        }
    }
}
