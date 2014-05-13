<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Logout.aspx.vb" Inherits="Logout" %>


<asp:Content ID="LogoutPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div align="center">
    
        You have successfully logged out!<br />
        <br />
        <asp:Button ID="btnloginpage" runat="server" Text="Login" 
            CssClass="button small" />
    
    </div>

</asp:Content>
