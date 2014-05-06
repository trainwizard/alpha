<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="SystemsAdminAddAccount.aspx.vb" Inherits="SystemsAdminAddAccount" %>


<asp:Content ID="SystemsAdminAddAccountPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    
        Create New User.<br />
        <br />
        Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="NewUsername" runat="server"></asp:TextBox>
&nbsp;
        <%-- <asp:RequiredFieldValidator ID="lastnamevalidator" runat="server" 
            ControlToValidate="NewLastName" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>--%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="NewPassword"  runat="server"></asp:TextBox>
&nbsp;
        <%-- <asp:RequiredFieldValidator ID="lastnamevalidator" runat="server" 
            ControlToValidate="NewLastName" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>--%>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="ShowPasswordButton" runat="server" AutoPostBack="True" 
            Text="Show Password" />
        <br />
        <br />
        First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:TextBox ID="NewFirstName" runat="server"></asp:TextBox>
&nbsp;
       <%-- <asp:RequiredFieldValidator ID="firstnamevalidator" runat="server" 
            ControlToValidate="NewFirstName" ErrorMessage="First Name Required"></asp:RequiredFieldValidator>--%>
        <br />
        <br />
        Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="NewLastName" runat="server"></asp:TextBox>
&nbsp;
       <%-- <asp:RequiredFieldValidator ID="lastnamevalidator" runat="server" 
            ControlToValidate="NewLastName" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>--%>
        <br />
        <br />
        Email Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="NewEmail" runat="server"></asp:TextBox>
&nbsp;
       <%-- <asp:RequiredFieldValidator ID="lastnamevalidator" runat="server" 
            ControlToValidate="NewLastName" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>--%>
        <br />
        <br />
        Role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;
        <asp:DropDownList ID="RoleDropDown" runat="server">
            <asp:ListItem Value="5">Any User</asp:ListItem>
            <asp:ListItem Selected="True" Value="4">Athlete</asp:ListItem>
            <asp:ListItem Value="3">Athletic Trainer</asp:ListItem>
            <asp:ListItem Value="2">Coach</asp:ListItem>
            <asp:ListItem Value="1">Systems Admin</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btncreateuser" runat="server" Text="Create User" />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="msgvalidusername" runat="server" ForeColor="Red" Text="default" 
            Visible="False"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="User_ID" 
            DataSourceID="SqlDataSource1" AllowPaging="True" Height="113px" 
            Width="264px">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" 
                    SortExpression="Last_Name" />
                <asp:BoundField DataField="User_ID" HeaderText="Username" ReadOnly="True" 
                    SortExpression="User_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT [First_Name], [Last_Name], [User_ID] FROM [User]
                WHERE [User].Active = 1" DeleteCommand="UserInactive" 
            DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="First_Name" Type="String" />
                <asp:Parameter Name="Last_Name" Type="String" />
                <asp:Parameter Name="username" Type="String" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <br />
        Deactivate a User:<br />
        <br />

    </div>
   
    <asp:DropDownList ID="ActiveUsers" runat="server" DataSourceID="SqlDataSource2" 
        DataTextField="User_ID" DataValueField="User_ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="ActiveUsers" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="DeactivateUser" runat="server" Text="Deactivate User" />
    <br />

</asp:Content>
