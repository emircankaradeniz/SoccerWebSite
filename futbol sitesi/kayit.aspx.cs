using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace futbol_sitesi
{
    public partial class kayit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string link = "";
            if (txt_pictureLink.Text=="")
            {
                link = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Carl_von_Linn%C3%A9%2C_1707-1778%2C_botanist%2C_professor_%28Alexander_Roslin%29_-_Nationalmuseum_-_15723.tif/lossy-page1-800px-Carl_von_Linn%C3%A9%2C_1707-1778%2C_botanist%2C_professor_%28Alexander_Roslin%29_-_Nationalmuseum_-_15723.tif.jpg";
            }
            else
            {
                link = txt_pictureLink.Text;
            }
            string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
            string sqlCumlecik = "MD5_KAYIT";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(sqlCumlecik, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@kullaniciadi", txt_username.Text);
                    cmd.Parameters.AddWithValue("@kullanicisoyadi", txt_lastname.Text);
                    cmd.Parameters.AddWithValue("@foto",link );
                    cmd.Parameters.AddWithValue("@sifre", Get_MD5(txt_password.Text));
                    int afectedrows =cmd.ExecuteNonQuery();
                    if(afectedrows > 0)
                    {
                        Session["kullaniciadi"] = txt_username.Text;
                        Session["hesap"] = txt_username.Text;
                        Response.Redirect("~/giris.aspx");
                    }
                    else
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/giris.aspx");
        }
    }
}