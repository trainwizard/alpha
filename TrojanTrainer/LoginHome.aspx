<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="LoginHome.aspx.vb" Inherits="LoginHome" %>

<asp:Content ID="LoginHomePage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
    Welcome to Trojan Trainer.
    </p>
    <p>
    
    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="userrole">
        </asp:GridView>
        <asp:SqlDataSource ID="userrole" runat="server"></asp:SqlDataSource>
    
    
    </p>
    

</asp:Content>
