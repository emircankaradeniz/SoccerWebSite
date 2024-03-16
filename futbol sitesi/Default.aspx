<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="futbol_sitesi._Default" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Sayfa özel içeriği buraya eklenecek -->
    <!-- ***** Featured Games Start ***** -->
<div class="row">
  <div class="col-lg-8">
    <div class="featured-games header-text">
      <a href="Takim.aspx">
        <div class="heading-section">
          <h4><em>Popüler Lig</em> Takımları</h4>
        </div>
      </a>
      <div class="owl-features owl-carousel">
          <%
              string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
              using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
              {
                  con.Open();

                  using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM Takim", con))
                  {
                      using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                      {
                          while (reader.Read())
                          {
                              string teamName = reader["takim_adi"].ToString();
                              string link = reader["takim_logo"].ToString();
                              string puan = reader["puan"].ToString();

                          %>
                          <div class="item">
                              <div class="thumb">
                                  <img src="<%= link %>" alt="" height="240px">
                                  <div class="hover-effect">
                                  <div class="main-button">
                                      <a href="detailsTakim.aspx">incele</a>
                                  </div>
                              </div>
                          </div>
                          <h4><%= teamName %><br><span>Puan : <%= puan %></span></h4>
                          <ul>
                           <li><i class="fa fa-star" style="color: yellow;"></i> 4.8</li>
                          </ul>
                          </div>
                          <%
                                          }
                                      }
                                  }
                              }
          %>
      </div>
    </div>
  </div>
  <div class="col-lg-4" style="line-height: 0.1rem;">
    <div class="top-downloaded">
      <div class="heading-section">
        <h4><em>Popüler</em> Futbolcular</h4>
      </div>
      <ul>
          <% 
     using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
     {
         con.Open();

         using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM Futbolcu ftb inner join Futbolcu_Takim fut on fut.futbolcu_id=ftb.futbolcu_id inner join Takim tak on fut.takim_id=tak.takim_id ", con))
         {
             using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
             {
                 for(int i=0;i<3;i++)
                 {
                     reader.Read();
                     string fut_id =reader["futbolcu_id"].ToString();
                     string takim = reader["takim_adi"].ToString();
                     string adSoyad = reader["futbolcu_adi"].ToString() + " " + reader["futbolcu_soyadi"].ToString();
                     string link = reader["futbolcu_resim"].ToString();

                %>
                <li>
                  <img src=<%= link %> alt="" class="templatemo-item" width="70px" height="50px">
                  <h4><%= adSoyad %></h4>
                  <h6><%= takim %></h6>
                  <span><i class="fa fa-thumbs-up" style="color: rgb(70, 117, 248);"></i> 4.9</span>
                  <div class="text-button">
                    <a href="detailsFutbolcu.aspx" onclick="<%Session["topcu_id"] = fut_id; %>">incele</a>
                  </div>
                </li>
                <%
            }
        }
    }
}
%>
        </ul>
      <div class="text-button">
        <a href="ButunTopcular.aspx">Tüm Topcuları Gör</a>
      </div>
    </div>
  </div>
<!-- ***** Featured Games End ***** -->
<!-- ***** Gaming Library Start ***** -->
<div class="gaming-library">
  <div class="col-lg-12">
    <div class="heading-section">
      <h4><em>Bu Günün Maçları</em></h4>
    </div>
      <% 
          List<string> dep_id = new List<string>();
            List<string> ev_id = new List<string>();
            List<string> tarih = new List<string>();
            List<string> saat = new List<string>();
            List<string> link1 = new List<string>();
            List<string> link2 = new List<string>();
          using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
          {
              con.Open();
              using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT saat,tarih,dep_takim_id,ev_takim_id FROM Karsilasmalar where tarih = convert(varchar,FORMAT(GETDATE(),'yyyy-MM-dd'))", con))
              {
                  using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                  {
                      while (reader.Read())
                      {
                          tarih.Add(reader["tarih"].ToString());
                          saat.Add(reader["saat"].ToString());
                          dep_id.Add(reader["dep_takim_id"].ToString());
                          ev_id.Add( reader["ev_takim_id"].ToString());
                      }
                  }
              }

              for(int i=0;i<dep_id.Count;i++)
              {
                  using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT takim_logo FROM Takim where takim_id=" + dep_id[i] +" or takim_id=" + ev_id[i], con))
                  {
                      using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                      {
                          while (reader.Read())
                          {
                                if (link1.Count==link2.Count)
                                {
                                    link1.Add(reader["takim_logo"].ToString());
                                }
                                else
                                {
                                    link2.Add(reader["takim_logo"].ToString());
                                }
                              
                              
                          }
                      }
                  }
              }

          }
          for (int i = 0; i < dep_id.Count; i++)
          {
                %>
                <div class="item">
                  <ul>
                    <li><img src=<%= link1[i] %> alt="" class="templatemo-item"/></li>
                    <li style="width: 5rem;"><h1>VS</h1></li>
                    <li><img src=<%= link2[i] %> alt="" class="templatemo-item"/></li>
                    <li><h4>Tarih</h4><span><%=tarih[i] %></span></li>
                    <li><h4>Saat</h4><span><%=saat[i] %></span></li>
                    <li><div class="main-border-button border-no-active"><a href="#">Detaylar</a></div></li>
                  </ul>
                </div>
                <%
                    }
%>
  </div>
  <div class="col-lg-12">
    <div class="main-button">
      <a href="maclar.aspx">Bütün Maçları Göster</a>
    </div>
  </div>
</div>
<!-- ***** Gaming Library End ***** -->
</asp:Content>