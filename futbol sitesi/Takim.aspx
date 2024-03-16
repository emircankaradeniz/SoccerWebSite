<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Takim.aspx.cs" Inherits="futbol_sitesi.Takim" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Sayfa özel içeriği buraya eklenecek -->
    <!-- ***** Most Popular Start ***** -->
    <div class="row">
  <div class="col-lg-4">
    <div class="featured-games header-text">
      <div class="heading-section">
        <h4><em>Tüm</em>Takımlar</h4>
      </div>
    </div>
  </div>
</div>
<div class="most-popular">
  <div class="row">
    <div class="col-lg-12">
      <div class="row">
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
                <div class="col-lg-4 col-sm-6">
                <div class="item" style="padding-bottom: 3rem;">
                  <img src=<%= link %> style="width:300px;height:300px;" alt=""/>
                  <h4><%= teamName %></h4>
                  <ul>
                    <span><i class="fa fa-star" style="color: yellow;"></i> 4.9</span>
                    <div class="text-button">
                      <a href="detailsTakim.aspx" >incele</a>
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
