<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detailsFutbolcu.aspx.cs" Inherits="futbol_sitesi.detailsFutbolcu1" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Sayfa özel içeriği buraya eklenecek -->
    <!-- ***** Featured Start ***** -->
           

<div class="game-details">
  <div class="row">
                 <% 
                     string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
                     string takim = "";
                     string adSoyad = "";
                     string link = "";
                     string link2 = "";
                     string yas = "";
                     string begeni = "";
                     string pozisyon = "";
                     string dogum = "";
                     using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
                     {
                         con.Open();

                         using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM Futbolcu tkb inner join Futbolcu_Takim fut on fut.futbolcu_id=tkb.futbolcu_id inner join Takim tak on fut.takim_id=tak.takim_id where tkb.futbolcu_id = " + Session["topcu_id"], con))
                         {
                             using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                             {
                                 reader.Read();
                                 takim = reader["takim_adi"].ToString();
                                 adSoyad = reader["futbolcu_adi"].ToString() + " " + reader["futbolcu_soyadi"].ToString();
                                 link = reader["futbolcu_resim"].ToString();
                                 link2 = reader["takim_logo"].ToString();
                                 yas = reader["futbolcu_yas"].ToString();
                                 begeni = reader["begeni"].ToString();
                                 pozisyon = reader["futbolcu_pozisyon"].ToString();
                                 dogum = reader["futbolcu_dogum_tarihi"].ToString();
                             }
                         }
                     }
%>
       <div class="col-lg-12" >
  <div class="feature-banner header-text" >
    <div class="row" >
      <div class="col-lg-4" style="margin-left: 25rem;" >
        <img src=<%= link %> alt="" style=" border-radius: 23px;" >
      </div>
    </div>
  </div>
</div>
    <div class="col-lg-12">
      <div class="item">
        <ul>
          <li><h2><%=adSoyad  %></h2></li>
          <li><div class="main-border-button border-no-active"><a href="#">Beğen</a></div></li>
        </ul>
      </div>
    </div>
    <div class="col-lg-12">
      <div class="content">
        <div class="row">
          <div class="col-lg-3" style=" flex-wrap:nowrap;">
            <h4>Oynadığı Takım</h4>
                  <span style="color: rgb(146, 151, 156);"><%= takim %></span>
            <ul>
              <img src=<%= link2 %> alt="" style="height: 50px; width: auto;" >
            </ul>
          </div>
          <div class="col-lg-3" style=" flex-wrap:nowrap;">
            <h4>Yaş</h4>
                  <span style="color: rgb(146, 151, 156);"><%= yas %></span>
          </div>
          <div class="col-lg-3" style=" flex-wrap:nowrap;">
            <h4>Doğum Tarihi</h4>
                  <span style="color: rgb(146, 151, 156);"><%= dogum %></span>
          </div>
          <div class="col-lg-3" style=" flex-wrap:nowrap;">
            <h4>Pozisyon</h4>
                  <span style="color: rgb(146, 151, 156);"><%= pozisyon %></span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ***** Details End ***** -->
</asp:Content>
