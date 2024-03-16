<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deneme.aspx.cs" Inherits="futbol_sitesi.deneme" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Sayfa özel içeriği buraya eklenecek -->
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
                          <h4><%= teamName %><br><span>30 Puan</span></h4>
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
</div>
</asp:Content>