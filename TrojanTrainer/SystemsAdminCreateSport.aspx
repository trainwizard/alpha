<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="SystemsAdminCreateSport.aspx.vb" Inherits="SystemsAdminCreateSport" %>


<asp:Content ID="SystemsAdminCreateSportPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
     Create Sports and Teams.<br />
        <br />
        Add a New Sport:
        <asp:TextBox ID="NewSport" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="addNewSport" runat="server" Text="Add" CssClass="button small" />
        <asp:Label ID="msgvalidsport" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:CheckBox ID="HasTeamsChbx" runat="server" Text="This sport has no teams" />
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="Sport_ID" 
            DataSourceID="SqlDataSource1" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            
            SelectCommand="SELECT [Sport_ID], [Name], [Active] FROM [Sport] WHERE Active = 1" DeleteCommand="UPDATE Sport
SET Active = 0
WHERE Sport_ID = @Sport_ID">
            <DeleteParameters>
                <asp:Parameter Name="Sport_ID" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        Select a Sport:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlSportID" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="Name" DataValueField="Sport_ID" AutoPostBack="True">
        </asp:DropDownList>
        <br />
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
            AllowSorting="True" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Sport" SortExpression="Name" />
                <asp:BoundField DataField="Name1" HeaderText="Team" SortExpression="Name1" />
            </Columns>
        </asp:GridView>
         Add a New Team:
         <asp:TextBox ID="NewTeam" runat="server"></asp:TextBox>
        &nbsp;
        <asp:Button ID="addNewTeam" runat="server" Text="Add" CssClass="button small" />
        <asp:Label ID="msgvalidteam" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT Sport.Name, Team.Name
FROM Sport
INNER JOIN Team
ON Sport.Sport_ID = Team.Sport_ID
WHERE Team.Sport_ID = @Sport_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSportID" Name="Sport_ID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />

</asp:Content>