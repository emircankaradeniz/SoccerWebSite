<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailsTakim.aspx.cs" Inherits="futbol_sitesi.detailsTakim" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Sayfa özel içeriği buraya eklenecek -->
    <% 
        string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
        string ad = "";
        string link = "";
        string puan = "";
        using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
        {
            con.Open();

            using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM Takim takim_id=" + Session["takim_id"], con))
            {
                using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                {
                    reader.Read();
                    ad = reader["takim_adi"].ToString();
                    link = reader["takim_logo"].ToString();
                    puan = reader["puan"].ToString();
                }
            }
        }
%>
    <!-- ***** Featured Start ***** -->
<div class="row" >
  <div class="col-lg-12" >
    <div class="feature-banner header-text" >
      <div class="row" >
        <div class="col-lg-4" style="margin-left: 25rem;" >
          <img src=<%= link%> alt="" height="400px" width="auto"  >
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ***** Featured End ***** -->

<!-- ***** Details Start ***** -->
<div class="game-details">
  <div class="row">
    <div class="col-lg-12">
      <div class="item">
        <ul>
          <li><h2><%= ad %></h2></li>
          <li><div class="main-border-button border-no-active"><a href="#">Favorilere Ekle</a></div></li>
        </ul>
      </div>
    </div>
    <div class="col-lg-12">
      <div class="content">
        <div class="row">
          <div class="col-lg-3" style=" flex-wrap:nowrap;">
            <h4>Puan :</h4>
          </div>
          <div class="col-lg-3" style=" flex-wrap:nowrap;">
            <h4><%= puan%></h4>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ***** Details End ***** -->
<div class="gaming-library">
  <div class="col-lg-12">
            <% 
          using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
          {
              con.Open();

              using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT saat,tarih,takim1_id,takim2_id FROM takimBilgiler where takim1_id="+""+"or takim2_id=", con))
              {
                  using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                  {
                      while (reader.Read())
                      {
                          string tarih = reader["tarih"].ToString();
                          string saat = reader["saat"].ToString();
                          string id1 = reader["takim1_id"].ToString();
                          string id2 = reader["takim2_id"].ToString();
                          string link1 = "";
                          string link2 = "";
                          using (System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand("SELECT takim_logo FROM takimBilgiler", con))
                          {
                              using (System.Data.SqlClient.SqlDataReader reader2 = cmd.ExecuteReader())
                              {
                                  while (reader2.Read())
                                  {
                                      if(link1=="")
                                      {
                                          link1 = reader["takim_logo"].ToString();
                                      }
                                      else if (link2=="")
                                       {
                                          link2 = reader["takim_logo"].ToString();
                                       }
                                  }
                              }
                          }
                %>
                <div class="item">
                  <ul>
                    <li><img src=<%= link1 %> alt="" class="templatemo-item"></li>
                    <li style="width: 5rem;"><h1>VS</h1></li>
                    <li><img src=<%= link2 %> alt="" class="templatemo-item"></li>
                    <li><h4>Tarih</h4><span><%= tarih %></span></li>
                    <li><h4>Saat</h4><span><%= saat %></span></li>
                    <li><div class="main-border-button border-no-active"><a href="#">Detaylar</a></div></li>
                  </ul>
                </div>
                <%
            }
        }
    }
}
%>
    <div class="item">
      <ul>
        <li><img src="https://upload.wikimedia.org/wikipedia/tr/a/ab/TrabzonsporAmblemi.png" alt="" class="templatemo-item"></li>
        <li style="width: 5rem;"><h1>VS</h1></li>
        <li><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/BesiktasJK-Logo.svg/800px-BesiktasJK-Logo.svg.png" alt="" class="templatemo-item"></li>
        <li><h4>Tarih</h4><span>24/08/2036</span></li>
        <li><h4>Saat</h4><span>19:00</span></li>
        <li><div class="main-border-button border-no-active"><a href="#">Detaylar</a></div></li>
      </ul>
    </div>
    <div class="item">
      <ul>
        <li><img src="https://upload.wikimedia.org/wikipedia/tr/a/ab/TrabzonsporAmblemi.png" alt="" class="templatemo-item"></li>
        <li style="width: 5rem;"><h1>VS</h1></li>
        <li><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/BesiktasJK-Logo.svg/800px-BesiktasJK-Logo.svg.png" alt="" class="templatemo-item"></li>
        <li><h4>Tarih</h4><span>24/08/2036</span></li>
        <li><h4>Saat</h4><span>19:00</span></li>
        <li><div class="main-border-button border-no-active"><a href="#">Detaylar</a></div></li>
      </ul>
    </div>
    <div class="item">
      <ul>
        <li><img src="https://upload.wikimedia.org/wikipedia/tr/a/ab/TrabzonsporAmblemi.png" alt="" class="templatemo-item"></li>
        <li style="width: 5rem;"><h1>VS</h1></li>
        <li><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/BesiktasJK-Logo.svg/800px-BesiktasJK-Logo.svg.png" alt="" class="templatemo-item"></li>
        <li><h4>Tarih</h4><span>24/08/2036</span></li>
        <li><h4>Saat</h4><span>19:00</span></li>
        <li><div class="main-border-button border-no-active"><a href="#">Detaylar</a></div></li>
      </ul>
    </div>
    <div class="item">
      <ul>
        <li><img src="https://upload.wikimedia.org/wikipedia/tr/a/ab/TrabzonsporAmblemi.png" alt="" class="templatemo-item"></li>
        <li style="width: 5rem;"><h1>VS</h1></li>
        <li><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/BesiktasJK-Logo.svg/800px-BesiktasJK-Logo.svg.png" alt="" class="templatemo-item"></li>
        <li><h4>Tarih</h4><span>24/08/2036</span></li>
        <li><h4>Saat</h4><span>19:00</span></li>
        <li><div class="main-border-button border-no-active"><a href="#">Detaylar</a></div></li>
      </ul>
    </div>
  </div>
</div>
</asp:Content>