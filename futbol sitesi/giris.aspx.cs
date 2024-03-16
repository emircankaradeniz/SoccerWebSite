using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace futbol_sitesi
{
    public partial class giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {



            //string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
            string sqlCumlecik = "SP_LOGIN_MD5";
            string Yetki = "";
            string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd2 = new SqlCommand("select yetki from Kullanicilar where kullanici_adi='"+txt_username.Text+"'", con))
                {
                    
                    using (System.Data.SqlClient.SqlDataReader reader = cmd2.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Yetki = reader["yetki"].ToString();
                        }
                    }
                }
                using (SqlCommand cmd = new SqlCommand(sqlCumlecik, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@kullaniciadi", txt_username.Text);
                    cmd.Parameters.AddWithValue("@sifre", Get_MD5(txt_password.Text));
                    int rowCount=0;
                    try
                    {
                        rowCount = Convert.ToInt32(cmd.ExecuteScalar());
                        if (rowCount > 0 && Yetki=="False")
                        {
                            Session["kullaniciadi"] = txt_username.Text;
                            Session["hesap"] = txt_username.Text;
                            Session["yetki"] = "False";
                            Response.Redirect("~/hesap.aspx");
                        }
                        else if (rowCount > 0 && Yetki == "True")
                        {
                            Session["kullaniciadi"] = txt_username.Text;
                            Session["hesap"] = txt_username.Text;
                            Session["yetki"] = "True";
                            Response.Redirect("~/hesapAdmin.aspx");
                        }

                    }
                    catch (Exception ex) {

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
        protected void backbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}