<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


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


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
</asp:Content>


