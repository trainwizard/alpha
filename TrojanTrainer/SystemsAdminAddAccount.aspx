<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="SystemsAdminAddAccount.aspx.vb" Inherits="SystemsAdminAddAccount" %>


<asp:Content ID="SystemsAdminAddAccountPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    
        Create New User.<br />
        <br />
        Username:
        <asp:TextBox ID="NewUsername" runat="server"></asp:TextBox>
&nbsp;
        <%--<asp:RequiredFieldValidator ID="usernamevalidator" runat="server" 
            ControlToValidate="NewUsername" ErrorMessage="Username Required"></asp:RequiredFieldValidator>--%>
        <br />
        <br />
        Password:
        <asp:TextBox ID="NewPassword" runat="server"></asp:TextBox>
&nbsp;
        <%--<asp:RequiredFieldValidator ID="passwordvalidator" runat="server" 
            ControlToValidate="NewPassword" ErrorMessage="Password Required"></asp:RequiredFieldValidator>--%>
        <br />
        <br />
        First Name:
        <asp:TextBox ID="NewFirstName" runat="server"></asp:TextBox>
&nbsp;
       <%-- <asp:RequiredFieldValidator ID="firstnamevalidator" runat="server" 
            ControlToValidate="NewFirstName" ErrorMessage="First Name Required"></asp:RequiredFieldValidator>--%>
        <br />
        <br />
        Last Name:
        <asp:TextBox ID="NewLastName" runat="server"></asp:TextBox>
&nbsp;
       <%-- <asp:RequiredFieldValidator ID="lastnamevalidator" runat="server" 
            ControlToValidate="NewLastName" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>--%>
        <br />
        <br />
        Role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        <br />
        <br />
        <asp:Label ID="msgvalidusername" runat="server" ForeColor="Red" Text="default" 
            Visible="False"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" DataKeyNames="User_ID" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="First_Name" HeaderText="First Name" 
                    SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" 
                    SortExpression="Last_Name" />
                <asp:BoundField DataField="User_ID" HeaderText="User ID" ReadOnly="True" 
                    SortExpression="User_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT [First_Name], [Last_Name], [User_ID] FROM [User]">
        </asp:SqlDataSource>
        <br />
    
    </div>

</asp:Content>
