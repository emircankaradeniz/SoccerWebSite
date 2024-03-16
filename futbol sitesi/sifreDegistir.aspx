<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sifreDegistir.aspx.cs" Inherits="futbol_sitesi.sifreDegistir" %>

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
                <asp:TextBox class="inputBox" ID="txt_userID" runat="server"  AutoCompleteType="Disabled" required CssClass="signin-content-form-input"></asp:TextBox><i>Username</i>
            </div>
            <div class="inputBox">
                <asp:TextBox class="inputBox" ID="txt_newpassword" runat="server" TextMode="Password"  AutoCompleteType="Disabled" required CssClass="signin-content-form-input"></asp:TextBox><i>password</i>
            </div>
            </div> 
            <div class="inputBox"> 
                <asp:Button runat="server" ID="btnKayit" Text="Submit" OnClick="btn_Kayit_Click" />
            </div>  
          </div> 
         </div> 
</section> <!-- partial --> 

    </form>
          
 </body>
</html>
<!-- partial -->
