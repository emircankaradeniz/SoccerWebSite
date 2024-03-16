using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using static System.Net.WebRequestMethods;

namespace futbol_sitesi
{
    public partial class hesapAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            evTakim.Items.Insert(0, new ListItem("Takım Seçiniz", "1"));
            depTakim.Items.Insert(0, new ListItem("Takım Seçiniz", "1"));
            takim.Items.Insert(0, new ListItem("Takım Seçiniz", "1"));
            string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
            {
                con.Open();

                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT takim_adi FROM Takim", con))
                {
                    using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                    {
                        
                        while (reader.Read())
                        {
                            string teamName = reader["takim_adi"].ToString();
                            evTakim.Items.Add(teamName);
                            depTakim.Items.Add(teamName);
                            takim.Items.Add(teamName);
                            
                        }
                    }
                }
            }
        }
        protected void btnCıkıs2_Click(object sender, EventArgs e)
        {
            Session["hesap"] = null; Session["yetki"] = null;
            Response.Redirect("~/Default.aspx");
        }
        protected void btnFutEklee_Click(object sender, EventArgs e)
        {
            if (txt_futbolcuadi.Text!="" && txt_futbolcusoyadi.Text!="" && takim.SelectedItem.Text!="" && pozisyon.Text!="" && resimLink.Text!="")
            {
                string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
                string sqlCümlecik = "futbolcuEkleme";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlTransaction transaction = null;
                    try
                    {
                        // Transaction'ı başlat
                        transaction = connection.BeginTransaction();
                        using (SqlCommand cmd = new SqlCommand(sqlCümlecik, connection, transaction))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@kullaniciadi", txt_futbolcuadi.Text);
                            cmd.Parameters.AddWithValue("@kullanicisoyadi", txt_futbolcusoyadi.Text);
                            cmd.Parameters.AddWithValue("@dogtarih", Dogtarih.Text);
                            cmd.Parameters.AddWithValue("@pozisyon", pozisyon.Text);
                            cmd.Parameters.AddWithValue("@yas", YasHesapla(Dogtarih.Text));
                            cmd.Parameters.AddWithValue("@foto", resimLink.Text);
                            // İşlemleri gerçekleştir
                            cmd.ExecuteNonQuery();

                            // Transaction'ı commit et
                            transaction.Commit();
                            lbl1.Text = "kayıt eklendi";
                            SqlDependency dependency = new SqlDependency(cmd);
                            dependency.OnChange += DependencyOnChange;
                            

                        }
                    }
                    catch (Exception ex)
                    {
                        lbl1.Text = "rolback oldu";
                        // Hata durumunda transaction'ı geri al
                        transaction.Rollback();
                    }
                    finally
                    {
                        // Bağlantıyı kapat
                        connection.Close();
                    }
                }
            }
            else
            {
                lbl1.Text = "başarısız";
            }
        }
            private static void DependencyOnChange(object sender, SqlNotificationEventArgs e)
            {
                Console.WriteLine("Veri değişikliği algılandı!");
            }
            protected void btnTakımKaydet_Click(object sender, EventArgs e)
            {
            string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
            string sqlCümlecik = "takimEkleme";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = null;
                try
                {
                    // Transaction'ı başlat
                    transaction = connection.BeginTransaction();
                    using (SqlCommand cmd = new SqlCommand(sqlCümlecik, connection, transaction))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@takimadi", txt_takimadi.Text);
                        cmd.Parameters.AddWithValue("@teknikdirektör", txt_direktör.Text);
                        cmd.Parameters.AddWithValue("@logo", txt_logolink.Text);
                        // İşlemleri gerçekleştir
                        cmd.ExecuteNonQuery();

                        // Transaction'ı commit et
                        transaction.Commit();
                        lbl1.Text = "kayıt eklendi";
                        

                    }
                }
                catch (Exception ex)
                {
                    lbl1.Text = "rolback oldu";
                    // Hata durumunda transaction'ı geri al
                    transaction.Rollback();
                }
                finally
                {
                    // Bağlantıyı kapat
                    connection.Close();
                    Response.Redirect("~/Default.aspx");
                }
            }
        }
        string ev_id = "";
        string dep_id = "";
        protected void btn_MacKaydet_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
            string sqlCümlecik = "MacEkleme";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlTransaction transaction = null;
                try
                {
                    // Transaction'ı başlat
                    transaction = connection.BeginTransaction();
                    using (SqlCommand cmd = new SqlCommand(sqlCümlecik, connection, transaction))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ev_takim", ev_id);
                        cmd.Parameters.AddWithValue("@dep_takim", dep_id);
                        cmd.Parameters.AddWithValue("@tarih", macTarih.Text);
                        cmd.Parameters.AddWithValue("@saat", macsaatSec.Text);
                        // İşlemleri gerçekleştir
                        cmd.ExecuteNonQuery();

                        // Transaction'ı commit et
                        transaction.Commit();
                        lbl1.Text = "kayıt eklendi";
                        

                    }
                }
                catch (Exception ex)
                {
                    lbl1.Text = "rolback oldu";
                    // Hata durumunda transaction'ı geri al
                    transaction.Rollback();
                }
                finally
                {
                    // Bağlantıyı kapat
                    connection.Close();
                    Response.Redirect("~/Default.aspx");
                }
            }
        }
        protected void evTakim_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(evTakim.SelectedIndex!=0)
            {
                string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
                using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
                {
                    con.Open();

                    using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT takim_id FROM Takim where takim_adi='" + evTakim.SelectedItem.Value + "'", con))
                    {
                        using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            ev_id = reader["takim_id"].ToString();
                        }
                    }
                }
            }
            
        }
        protected void depTakim_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(depTakim.SelectedIndex != 0)
            {
                string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
                using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
                {
                    con.Open();

                    using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT takim_id FROM Takim where takim_adi='" + depTakim.SelectedItem.Value + "'", con))
                    {
                        using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            dep_id = reader["takim_id"].ToString();
                        }
                    }
                }
            }
            
        }
        public string YasHesapla(string tarih)
        {
            int yas=0;
            DateTime bugun = DateTime.Today;
            ;
            // Yaşı hesapla
            yas = bugun.Year - Convert.ToDateTime(tarih).Year;

            // Doğum tarihi bu yıl gerçekleşmediyse yaşını bir azalt

            return yas.ToString();
            
        }
    }
}