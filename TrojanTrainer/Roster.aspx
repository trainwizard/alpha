<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Roster.aspx.vb" Inherits="Roster" %>

<asp:Content ID="RosterPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
    Roster page.
    </p>
    <p>
    
        <asp:DropDownList ID="ddlSports" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Sport_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT [Name], [Sport_ID] FROM [Sport] WHERE Active = 1">
        </asp:SqlDataSource>
    
    </p>
    <p>
    
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource2" Enabled="False">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT * FROM [Team] WHERE Sport_ID = ddlSports.SelectedValue">
        </asp:SqlDataSource>
    
    </p>
    <p>
    
        &nbsp;</p>
    

</asp:Content>