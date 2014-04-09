﻿<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Roster.aspx.vb" Inherits="Roster" %>

<asp:Content ID="RosterPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
    Roster page.
    </p>
    <p>
    
        Select a Sport:</p>
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
    
        Select a Team:</p>
    <p>
    
        <asp:DropDownList ID="ddlTeams" runat="server" 
            DataSourceID="SqlDataSource2" Enabled="False" DataTextField="Name" 
            DataValueField="Team_ID">
        </asp:DropDownList>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetSportTeams" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSports" DefaultValue="" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </p>
    <p>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource3" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" 
                    SortExpression="Last_Name" />
                <asp:BoundField DataField="Name" HeaderText="Team" SortExpression="Name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetSportRoster" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSports" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    

</asp:Content>