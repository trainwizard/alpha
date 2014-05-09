<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--  <img src="images/backgroundSRS.png" id="bg" alt="">--%>

    <div>
    
        <br />
        <asp:Label ID="msginvalidlogin" runat="server" ForeColor="Red" Text="Incorrect login, please try again." Visible="False">
            <div data-alert class="alert-box alert radius">
                This is a success alert with a radius.
                <a href="Login.aspx" class="close">&times;</a>
            </div>
        </asp:Label>
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


