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
&nbsp;
        <asp:RequiredFieldValidator ID="usernamevalidator" runat="server" 
            ControlToValidate="NewUsername" ErrorMessage="Username Required"></asp:RequiredFieldValidator>
        <br />
        <br />
        Password:
        <asp:TextBox ID="NewPassword" runat="server"></asp:TextBox>
&nbsp;
        <asp:RequiredFieldValidator ID="passwordvalidator" runat="server" 
            ControlToValidate="NewPassword" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
        <br />
        <br />
        First Name:
        <asp:TextBox ID="NewFirstName" runat="server"></asp:TextBox>
&nbsp;
        <asp:RequiredFieldValidator ID="firstnamevalidator" runat="server" 
            ControlToValidate="NewFirstName" ErrorMessage="First Name Required"></asp:RequiredFieldValidator>
        <br />
        <br />
        Last Name:
        <asp:TextBox ID="NewLastName" runat="server"></asp:TextBox>
&nbsp;
        <asp:RequiredFieldValidator ID="lastnamevalidator" runat="server" 
            ControlToValidate="NewLastName" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>
        <br />
        <br />
        Role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="RoleDropDown" runat="server">
            <asp:ListItem Value="5">Any User</asp:ListItem>
            <asp:ListItem Selected="True" Value="4">Athlete</asp:ListItem>
            <asp:ListItem Value="3">Athletic Trainer</asp:ListItem>
            <asp:ListItem Value="2">Coach</asp:ListItem>
            <asp:ListItem Value="1">Systems Admin</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btncreateuser" runat="server" Text="Create User" />
        <br />
        <br />
        <asp:Label ID="msgvalidusername" runat="server" ForeColor="Red" Text="default" 
            Visible="False"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
