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
            DataValueField="Sport_ID" Height="32px">
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
    
<%--        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetSportRoster" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSports" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
<%--        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetSportRoster" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSports" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
        <asp:GridView ID="gvRoster" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource4" AllowPaging="True" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" 
                    SortExpression="Last_Name" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="DataOutputSport" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" 
                    SortExpression="Last_Name" />
                <asp:BoundField DataField="Name" HeaderText="Team Name" SortExpression="Name" />
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
    <p>
    
        Add Member to the Team</p>
    <p>
    
        <asp:DropDownList ID="ddlAddTeamMember" runat="server" 
            DataSourceID="SqlDataSource6" DataTextField="User_ID" DataValueField="User_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="PullNonTeamMembers" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTeams" Name="Team_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlSports" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    
        <asp:Button ID="btnAddTeamMember" runat="server" Text="Add Team Member" />
    </p>
    <p>
    
        <asp:Label ID="lblConfirm" runat="server" ForeColor="#009933" 
            Text="Team Member was added!" Visible="False"></asp:Label>
    </p>
    

</asp:Content>