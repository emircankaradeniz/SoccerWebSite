using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace futbol_sitesi
{
    public partial class sifreDegistir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void backbtn_Click(object sender,EventArgs e)
        {
            Response.Redirect("~/giris.aspx");
        }

        protected void btn_Kayit_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
            string sqlCumlecik = "sifreDegistir";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sqlCumlecik, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@kullaniciadi", txt_userID.Text);
                    cmd.Parameters.AddWithValue("@parola", Get_MD5(txt_newpassword.Text));
                    int rowCount = 0;
                    try
                    {
                        rowCount = cmd.ExecuteNonQuery();
                        if (rowCount > 0)
                        {
                            Console.WriteLine("işlem başarılı");
                            Response.Redirect("~/giris.aspx");
                        }
                        else 
                        {
                            Console.WriteLine("işlem başarısız");
                        }

                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
        }
        public static string Get_MD5(string deger)
        {
            deger = "x" + deger + "y";
            UTF8Encoding encoder = new UTF8Encoding();
            MD5 mydy = new MD5CryptoServiceProvider();
            byte[] d = mydy.ComputeHash(encoder.GetBytes(deger));
            string s = "";
            for (int i = 0; i < d.Length; i++)
            {
                s += d[i].ToString();
            }
            return s;
        }
    }
}