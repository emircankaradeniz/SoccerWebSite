<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hesapAdmin.aspx.cs" Inherits="futbol_sitesi.hesapAdmin" MasterPageFile="~/Site2.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%
    if (Session["kullaniciadi"] != null && Session["yetki"] != null)
    {
    %>
    <!-- Sayfa özel içeriği buraya eklenecek -->
    <!-- ***** Banner Start ***** -->
    <% 
        string connectionString = @"Data Source=EMIRCAN;Initial Catalog=ProjeDatabase;Integrated Security=True";
        string link = "";
        string ad = "";
        string soyadad = "";
        if (Session["yetki"].ToString() == "True")
        {
            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
            {
                con.Open();

                using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT kullanici_adi,kullanici_soyadi,fotograf FROM Kullanicilar where kullanici_adi ='" + Session["kullaniciadi"].ToString() + "' and yetki = '" + Session["yetki"].ToString() + "'", con))
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
            Response.Redirect("~/hesap.aspx");
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
          <img src=<%= link %> alt="" style="border-radius: 23px;"/>
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
                      <img src=<%= linklogo %> alt="" height="240px" style="border-radius: 23px;"/>
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
        <asp:Button runat="server" ID="btnCıkıs2" Text="Çıkış" CssClass="inputBox" OnClick="btnCıkıs2_Click" UseSubmitBehavior="False" />
    </div>
  </div>
</div>
<!-- ***** Banner End ***** -->

<!-- ***** Admin işlemleri Start ***** -->
<div class="container" style ="margin-top:20px; color: white;">                    
  <div class="card row" style="background-color: rgba(31,33,34,0.95);">
    <div class="card-header">Takım Ekle</div>
      <div class="card-body">
            <div name="form">
                <div class="form-row">
                    <asp:Label runat="server" ID="lbl1" Text="Label"></asp:Label>
                    <asp:TextBox runat="server" ID="txt_takimadi" CssClass="form-control" placeholder="Takım İsmi"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txt_direktör" CssClass="form-control" placeholder="Teknik Direktör"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txt_logolink" CssClass="form-control" placeholder="Takım Logo Linki"></asp:TextBox>
                </div>
                <asp:Button runat="server" ID="btnTakımKaydet" Text="Takım Ekleyin" CssClass="btn btn-danger" OnClick="btnTakımKaydet_Click" UseSubmitBehavior="False" />
            </div>
            <hr/>
      </div>  
    </div>
  </div>
  <div class="container" style ="margin-top:20px; color: white;">                    
    <div class="card row" style="background-color: rgba(31,33,34,0.95);">
      <div class="card-header">Futbolcu Ekle</div>
        <div class="form-row">
            <asp:TextBox runat="server" ID="txt_futbolcuadi" CssClass="form-control" placeholder="Futbolcu Ad" ></asp:TextBox>
            <asp:TextBox runat="server" ID="txt_futbolcusoyadi" CssClass="form-control" placeholder="Futbolcu Soyad" BackColor="White"></asp:TextBox>
            <label>Tarih Seç : </label><br />
            <asp:TextBox runat="server" ID="Dogtarih" TextMode="Date" AutoCompleteType="Disabled" CssClass="form-control"></asp:TextBox>
            <label for="takim">Takım Seç:</label>
            <asp:DropDownList runat="server" ID="takim" CssClass="form-control">
            </asp:DropDownList>
            <asp:TextBox runat="server" ID="pozisyon" CssClass="form-control" placeholder="Pozisyon"></asp:TextBox>
            <asp:TextBox runat="server" ID="resimLink" CssClass="form-control" placeholder="Futbolcu Resim Linki"></asp:TextBox>
        </div>
        <asp:Button runat="server" ID="btnFutEkle" Text="Futbolcu Ekleyin" CssClass="btn btn-danger" UseSubmitBehavior="False" OnClick="btnFutEklee_Click" />
    </div>
  </div>
    <div class="container" style ="margin-top:20px; color: white;">                    
      <div class="card row" style="background-color: rgba(31,33,34,0.95);">
        <div class="card-header">Maç Ekle</div>
          <div class="card-body">
                <div id="Form2" runat="server">
        <div class="form-row">
            <label for="ddlTeams1">Takım Seç:</label>
            <asp:DropDownList runat="server" ID="evTakim"  OnSelectedIndexChanged="evTakim_SelectedIndexChanged">
            </asp:DropDownList>

            <label for="ddlTeams2">Takım Seç:</label>
            <asp:DropDownList runat="server" ID="depTakim"  OnSelectedIndexChanged="depTakim_SelectedIndexChanged">
            </asp:DropDownList>

            <div class="form-group col-md-6">
                <label for="timePicker">Saat Seç : </label>
                <asp:TextBox runat="server" ID="macsaatSec" TextMode="Time" AutoCompleteType="Disabled" CssClass="form-control" min="09:00" max="24:00" Required="true"></asp:TextBox>
            </div>
            <div class="form-group col-md-6">
                <label for="datePicker">Tarih Seç : </label>
                <asp:TextBox runat="server" ID="macTarih" TextMode="Date" AutoCompleteType="Disabled" CssClass="form-control" Required="true"></asp:TextBox>
            </div>
        </div>
                    <asp:Button runat="server" ID="btn_MacKaydet" Text="Maç Ekleyin" CssClass="btn btn-danger" OnClick="btn_MacKaydet_Click" UseSubmitBehavior="False" />
    </div>

                <hr/>
          </div>  
        </div>
      </div>
    <%
        }
        else
        {
            Response.Redirect("~/giris.aspx");
        }
        %>
<!-- ***** Admin işlemleri End ***** -->
</asp:Content>
