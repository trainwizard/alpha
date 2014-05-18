<%@ page language="VB" masterpagefile="~/main.master" autoeventwireup="false" codefile="SystemsAdminCreateSport.aspx.vb" inherits="SystemsAdminCreateSport" %>
<asp:content id="SystemsAdminCreateSportPage" contentplaceholderid="ContentPlaceHolder1" runat="server">
<div>
	
    <p>
        <asp:Label ID="lblCurrentSports" runat="server" Text="Sports Home Page" 
            Visible="False"></asp:Label>
    </p>
    
	<asp:gridview id="gvSports" runat="server" allowsorting="True" 
        autogeneratecolumns="False" datakeynames="Sport_ID" 
        datasourceid="SqlDataSource1" allowpaging="True" Visible="False">
	<columns>
	<asp:commandfield showdeletebutton="True" ButtonType="Button"/>
	<asp:boundfield datafield="Name" headertext="Name" sortexpression="Name"/>
	</columns>
	</asp:gridview>
	<asp:Label ID="lblNewSport" runat="server" Text="Add a New Sport:" 
        Visible="False"></asp:Label>
&nbsp;<asp:textbox id="NewSport" runat="server" Visible="False"></asp:textbox>
	<asp:checkbox id="HasTeamsChbx" runat="server" text="This sport has no teams" 
        Visible="False"/>
	
    <br />
	<asp:button id="addNewSport" runat="server" text="Add" cssclass="button small" 
        Visible="False"/>
	<asp:label id="msgvalidsport" runat="server" text="Label" visible="False"></asp:label>
	<br/>
	<asp:Label ID="lblTeamsHomePage" runat="server" Text="Teams Home Page" 
        Visible="False"></asp:Label>
    <br />
	
    <br />
    Select a Sport to Add Teams:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:dropdownlist id="ddlSportID" runat="server" datasourceid="SqlDataSource1" datatextfield="Name" datavaluefield="Sport_ID" autopostback="True">
	</asp:dropdownlist>
	<asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" datasourceid="SqlDataSource2" allowsorting="True" allowpaging="True">
	<columns>
	<asp:boundfield datafield="Name" headertext="Sport" sortexpression="Name"/>
	<asp:boundfield datafield="Name1" headertext="Team" sortexpression="Name1"/>
	</columns>
	</asp:gridview>
	Add a New Team: <asp:textbox id="NewTeam" runat="server"></asp:textbox>
	&nbsp; <asp:button id="addNewTeam" runat="server" text="Add" cssclass="button small"/>
	<asp:label id="msgvalidteam" runat="server" text="Label" visible="False"></asp:label>
	<br/>
	<asp:sqldatasource id="SqlDataSource2" runat="server" 
        connectionstring="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="SELECT Sport.Name, Team.Name FROM Sport INNER JOIN Team ON Sport.Sport_ID = Team.Sport_ID WHERE Team.Sport_ID = @Sport_ID" DeleteCommand="DELETE FROM Team_Workout
WHERE Team_ID = @Team_ID"> 
        <DeleteParameters>
            <asp:Parameter Name="Team_ID" />
        </DeleteParameters>
        <selectparameters>
	<asp:controlparameter controlid="ddlSportID" name="Sport_ID" propertyname="SelectedValue"/>
	</selectparameters>
	</asp:sqldatasource>
</div>
	<asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ connectionstrings:alphaconnectionstring %>" SelectCommand="SELECT [Sport_ID], [Name], [Active] FROM [Sport] WHERE Active = 1" DeleteCommand="UPDATE Sport SET Active = 0 WHERE Sport_ID = @Sport_ID"> <deleteparameters>
	<asp:parameter name="Sport_ID"/>
	</deleteparameters>
	</asp:sqldatasource>
<br/>
</asp:content>