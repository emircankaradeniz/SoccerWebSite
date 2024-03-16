<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="futbol_sitesi.giris" %>

<!DOCTYPE html>

<html">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8"/> 

<title>Login</title> 
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
<link rel="stylesheet" href="assets/css/style.css"/> 
<link rel="stylesheet" href="assets/css/style2.css"/>
    
</head>
<body>
 <!-- partial:index.partial.html --> 
    <form id="form1" runat="server" class="form-container">
        <section> 
         <div class="signin" >
          <div class="content">
              <asp:Button CssClass='glowing-btn' runat="server" Style="font-size: small;" OnClick="backbtn_Click" Text="Geri" TabIndex="10" UseSubmitBehavior="False" EnableTheming="True"></asp:Button>
              <h2>Sign In</h2>
           <div class="form">
            <div class="inputBox">
                <asp:TextBox class="inputBox" ID="txt_username" runat="server"  AutoCompleteType="Disabled"  CssClass="signin-content-form-input" required></asp:TextBox><i>Username</i>
            </div>
            <div class="inputBox">
                <asp:TextBox class="inputBox" ID="txt_password" runat="server" TextMode="Password"  AutoCompleteType="Disabled"  CssClass="signin-content-form-input" required></asp:TextBox><i>password</i>
            </div>
            
            <div class="links"> <a href="sifreDegistir.aspx">Forgot Password</a> <a href="kayit.aspx">Signup</a> 
            </div> 
            <div class="inputBox"> 
                <asp:Button runat="server" ID="btnSubmit" Text="Giriş Yap" OnClick="btn_submit_Click" />
            </div> 
           </div> 
          </div> 
         </div> 
</section> <!-- partial --> 

    </form>
          
 </body>
</html>
<!-- partial -->