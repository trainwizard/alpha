<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SystemsAdminAddAccount.aspx.vb" Inherits="SystemsAdminAddAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Create New User.<br />
        <br />
        Username:
        <asp:TextBox ID="NewUsername" runat="server"></asp:TextBox>
        <br />
        <br />
        Password: 
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        First Name:
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        <br />
        Last Name:
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <br />
        Role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>View Only</asp:ListItem>
            <asp:ListItem Selected="True">Athlete</asp:ListItem>
            <asp:ListItem>Athletic Trainer</asp:ListItem>
            <asp:ListItem>Coach</asp:ListItem>
            <asp:ListItem>Systems Admin</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Create User" />
        <br />
    
    </div>
    </form>
</body>
</html>
