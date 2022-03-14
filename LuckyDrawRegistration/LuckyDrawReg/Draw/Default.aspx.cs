using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuckyDrawReg
{
    public partial class Form : System.Web.UI.Page
    {
        private string cnStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cnStr);
            try
            {
                conn.Open();
                SqlCommand cmd =
                    new SqlCommand("select count(*) from Staff_Name where StaffID=@UId and SUBSTRING(HKID,1,4)=@HKID",
                        conn);
                cmd.Parameters.Add("@UId", SqlDbType.Char);
                cmd.Parameters.Add("@HKID", SqlDbType.Char);
                cmd.Parameters[0].Value = post.Text;
                cmd.Parameters[1].Value = hkid.Text;
                int count = (int)cmd.ExecuteScalar();
                if (count == 1)
                {
                    SqlCommand cmd2 = new SqlCommand("select count(*) from Staff_Reg where StaffID=@UId and SUBSTRING(HKID,1,4)=@HKID",
                        conn);
                    cmd2.Parameters.Add("@UId", SqlDbType.Char);
                    cmd2.Parameters.Add("@HKID", SqlDbType.Char);
                    cmd2.Parameters[0].Value = post.Text;
                    cmd2.Parameters[1].Value = hkid.Text;
                    int count1 = (int)cmd2.ExecuteScalar();
                    if (count1 >= 1)
                    {
                        Response.Write("<script>var status='success';</script>");
                        return;
                    }

                    SqlCommand cmd1 =
                        new SqlCommand(
                            "INSERT INTO Staff_Reg select [StaffID], [English Name],[Dept# / Site],[HKID],GETDATE() as Time from Staff_Name where [StaffID]=@UId and SUBSTRING(HKID,1,4)=@HKID ",
                            conn);
                    cmd1.Parameters.Add("@UId", SqlDbType.Char);
                    cmd1.Parameters.Add("@HKID", SqlDbType.Char);
                    cmd1.Parameters[0].Value = post.Text;
                    cmd1.Parameters[1].Value = hkid.Text;
                    string result = (string)cmd1.ExecuteScalar();

                    Response.Write("<script>var status='success';</script>");
                }
                else
                {
                    Response.Write("<script>var status='wrong';</script>");
                }
            }

            catch
            {
                Response.Write("<script>var status='hr';</script>");
            }
            finally
            {
                conn.Close();
            }
        }
    }
}