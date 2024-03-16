<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ButunTopcular.aspx.cs" Inherits="futbol_sitesi.ButunTopcular" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Sayfa özel içeriği buraya eklenecek -->
    <div class="row">
  <div class="col-lg-4">
    <div class="featured-games header-text">
      <div class="heading-section">
        <h4><em>Tüm</em>Topcular</h4>
      </div>
    </div>
  </div>
</div>
<!-- ***** Most Popular Start ***** -->
<div class="most-popular">
  <div class="row">
    <div class="col-lg-12">
      <div class="row">
          <% 
    string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
    using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
    {
        con.Open();

        using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT futbolcu_adi,futbolcu_soyadi,futbolcu_resim,takim_adi FROM Futbolcu tkb inner join Futbolcu_Takim fut on fut.futbolcu_id=tkb.futbolcu_id inner join Takim tak on fut.takim_id=tak.takim_id ", con))
        {
            using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    string takim = reader["takim_adi"].ToString();
                    string ad = reader["futbolcu_adi"].ToString();
                    string Soyad =reader["futbolcu_soyadi"].ToString();
                    string link = reader["futbolcu_resim"].ToString();

                %>
                <div class="col-lg-4 col-sm-6">
                  <div class="item">
                    <img src=<%= link %> alt="" width="400px" height="250px"/>
                    <h4><%= ad %><br><%= Soyad %><br><span><%= takim %></span></h4>
                    <ul>
                      <span><i class="fa fa-thumbs-up" style="color: rgb(70, 117, 248);"></i> 4.9</span>
                        <div class="text-button">
                            <a href="detailsFutbolcu.aspx">incele</a>
                        </div>
                    </ul>
                  </div>
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
</div>
<!-- ***** Most Popular End ***** -->
</asp:Content>
