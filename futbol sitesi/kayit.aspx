<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kayit.aspx.cs" Inherits="futbol_sitesi.kayit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Kayıt</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
        }

        .form-container {
            position: absolute;
            top: 0px;
            left: 0px;
            transform: translate(-50%, -50%);
        }
</style>
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/style2.css" />
</head>
<body>
    
<form id="form2" runat="server" class="form-container">
    <section>
        <div class="signin">
            <div class="content">
                <asp:Button class="glowing-btn" ID="btnBack" runat="server" Text="Geri" Style="font-size: small" OnClick="btnBack_Click" />
                <h2>Sign Up</h2>
                <div class="form">
                    <div class="inputBox">
                        <asp:TextBox class="inputBox" ID="txt_username" runat="server" AutoCompleteType="Disabled"  CssClass="signin-content-form-input" required></asp:TextBox><i>İsim</i>
                    </div>
                    <div class="inputBox">
                        <asp:TextBox class="inputBox" ID="txt_lastname" runat="server" AutoCompleteType="Disabled"  CssClass="signin-content-form-input" required></asp:TextBox><i>Soyisim</i>
                    </div>
                    <div class="inputBox">
                        <asp:TextBox class="inputBox" ID="txt_password" runat="server" TextMode="Password" AutoCompleteType="Disabled" CssClass="signin-content-form-input" required></asp:TextBox>
                        <i>şifre</i>
                    </div>
                    <div class="inputBox">
                        <asp:TextBox class="inputBox" ID="txt_pictureLink" runat="server" AutoCompleteType="Disabled" CssClass="signin-content-form-input" required ></asp:TextBox>
                        <i>resim linki</i>
                    </div>
                    <div class="inputBox">
                        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" UseSubmitBehavior="False" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>
</body>
</html>
