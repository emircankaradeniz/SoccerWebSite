<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hesap.aspx.cs" Inherits="futbol_sitesi.hesap" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Sayfa özel içeriği buraya eklenecek -->
    <!-- ***** Banner Start ***** -->
<%
    if (Session["kullaniciadi"] != null)
    {
    %>
    <%
        string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
        string link = "";
        string ad = "";
        string soyadad = "";
        if (Session["yetki"].ToString() == "False")
        {
            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
            {
                con.Open();

                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT kullanici_adi,kullanici_soyadi,fotograf FROM Kullanicilar where kullanici_adi ='" + Session["kullaniciadi"].ToString() + "'", con))
                {
                    using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                    {
                        reader.Read();
                        ad = reader["kullanici_adi"].ToString();
                        soyadad = reader["kullanici_soyadi"].ToString();
                        link = reader["fotograf"].ToString();
                    }
                }
            }
        }
        else
        {
            Response.Redirect("~/hesapAdmin.aspx");
        }

%>
<div class="row">
  <div class="col-lg-4">
    <div class="featured-games header-text">
      <div class="heading-section">
        <h4>Hesap Bilgileri</h4>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-12">
    <div class="main-profile ">
      <div class="row">
        <div class="col-lg-4">
          <img src=<%= link %> alt="" style="border-radius: 23px;">
        </div>
        <div class="col-lg-4 align-self-center">
          <div class="main-info header-text">
            <h4><%= ad + " " + soyadad%></h4>
            <div class="main-border-button">
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="clips">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>Takip Edilen Takımlar</em></h4>
                </div>
              </div>
                <% 
                    using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
                    {
                        con.Open();

                        using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT * FROM Takim inner join Kullanici_Takim ktt on ktt.takim_id=Takim.takim_id inner join Kullanicilar kul on kul.kullanici_id=ktt.kullanici_id where kullanici_adi ='" + Session["kullaniciadi"].ToString() + "'", con))
                        {
                            using (System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    string teamName = reader["takim_adi"].ToString();
                                    string linklogo = reader["takim_logo"].ToString();

                %>
                <div class="col-lg-3 col-sm-6">
                  <div class="item">
                    <div class="thumb">
                      <img src=<%= linklogo %> alt="" height="240px" style="border-radius: 23px;">
                    </div>
                    <div class="down-content">
                      <h4><%= teamName %></h4>
                      <span><i class="fa fa-star" style="color: yellow;"></i> 250</span>
                    </div>
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
      <asp:Button runat="server" ID="btnCıkıs" Text="Çıkış" OnClick="btnCıkıs_Click" CssClass="inputBox" />
        
    </div>
  </div>
</div>
>
<% }
    else
    {
        Response.Redirect("~/giris.aspx");
    }

    %>!-- ***** Banner End ***** -->

</asp:Content>
