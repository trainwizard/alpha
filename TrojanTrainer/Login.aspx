﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:Label ID="msginvalidlogin" runat="server" ForeColor="Red" 
            Text="Incorrect login, please try again." Visible="False"></asp:Label>
        <br />
        <br />
    
        Login Here:<br />
        <br />
        Username:</div>
    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
    <br />
    <br />
    Password:<br />
    <asp:TextBox ID="txtpassword" TextMode="password" runat="server" ></asp:TextBox>
    <br />
    <br />
    <asp:CheckBox ID="ckbloggedin" runat="server" Text="Keep me logged in." />
    <br />
    <br />
    <asp:Button ID="btnlogin" runat="server" EnableTheming="True" Text="Login" />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>

    <br />
    </form>
</body>
</html>