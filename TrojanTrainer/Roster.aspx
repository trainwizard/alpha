<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Roster.aspx.vb" Inherits="Roster" %>

<asp:Content ID="RosterPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
    Roster page.
    </p>
    <p>
    
        Select a Sport:</p>
    <p>
    
        <asp:DropDownList ID="ddlSports" runat="server" AutoPostBack="True"
            DataSourceID="SqlDataSource1" DataTextField="Name" 
            DataValueField="Sport_ID" Height="21px">
            <asp:ListItem Selected="True">Choose a Sport</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT [Name], [Sport_ID] FROM [Sport] WHERE Active = 1">
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetSportRoster" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSports" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </p>
    <p>
    
        Select a Team:</p>
    <p>
    
        <asp:DropDownList ID="ddlTeams" runat="server" 
            DataSourceID="SqlDataSource2" Enabled="False" DataTextField="Name" 
            DataValueField="Team_ID" AutoPostBack="True">
            <asp:ListItem Selected="True">Choose a Team</asp:ListItem>
        </asp:DropDownList>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" Text="Get Team Members" />
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetSportTeams" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSports" DefaultValue="-----" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </p>
    <p>
    
<%--        <asp:GridView ID="gvSportRoster" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource3" AllowSorting="True" Enabled="False">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" 
                    SortExpression="Last_Name" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
        </asp:GridView>--%>
<%--        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetSportRoster" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSports" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
        <asp:GridView ID="gvRoster" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource4" Enabled="False" AllowPaging="True" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" 
                    SortExpression="Last_Name" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="DataOutputSport" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource5">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" 
                    SortExpression="Last_Name" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetTeamRosterNew" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTeams" Name="Team_ID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    

</asp:Content>