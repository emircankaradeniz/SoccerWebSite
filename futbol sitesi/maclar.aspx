<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="maclar.aspx.cs" Inherits="futbol_sitesi.maclar" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Sayfa özel içeriği buraya eklenecek -->
    <!-- ***** Gaming Library Start ***** -->
<div class="row">
  <div class="col-lg-4">
    <div class="featured-games header-text">
      <div class="heading-section">
        <h4><em>Bütün</em> Maçlar</h4>
      </div>
    </div>
  </div>
</div>
<div class="gaming-library">
  <div class="col-lg-12">
    
                    <% 
            string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
            List<string> dep_id = new List<string>();
            List<string> ev_id = new List<string>();
            List<string> tarih = new List<string>();
            List<string> saat = new List<string>();
            List<string> link1 = new List<string>();
            List<string> link2 = new List<string>();
          using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
          {
              con.Open();
              using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT saat,tarih,dep_takim_id,ev_takim_id FROM Karsilasmalar order by tarih ", con))
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
                    <li><img src=<%=link1[i] %> alt="" class="templatemo-item"></li>
                    <li style="width: 5rem;"><h1>VS</h1></li>
                    <li><img src=<%=link2[i] %> alt="" class="templatemo-item"></li>
                    <li><h4>Tarih</h4><span><%=tarih[i] %></span></li>
                    <li><h4>Saat</h4><span><%=saat[i] %></span></li>
                    <li><div class="main-border-button border-no-active"><a href="#">Detaylar</a></div></li>
                  </ul>
                </div>
                <%
                    }
%>
</div>
<!-- ***** Gaming Library End ***** -->
</asp:Content>