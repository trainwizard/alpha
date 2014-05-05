<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="SportsManagement.aspx.vb" Inherits="_Default" %>

<script language="VB" runat="server">

        Sub DayRender(source As Object, e As DayRenderEventArgs)

            ' Change the background color of the days in the month
            ' to yellow.
            If Not e.Day.IsOtherMonth And Not e.Day.IsWeekend Then
                e.Cell.BackColor = System.Drawing.Color.Yellow
            End If 
            ' Add custom text to cell in the Calendar control.
            If e.Day.Date.Day = 18 Then
                e.Cell.Controls.Add(New LiteralControl(ChrW(60) & "br" & ChrW(62) & "Holiday"))
            End If 
        End Sub 'DayRender 

   </script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Select Sport:</p>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Sport_ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="SELECT * FROM [Sport] WHERE ([Active] = @Active)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Active" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Current Cycles:<asp:GridView ID="cycleGridview" runat="server" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Cycle_ID" 
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Cycle Name" 
                SortExpression="Name" />
            <asp:BoundField DataField="Start_Date" HeaderText="Start Date" 
                SortExpression="Start_Date" />
            <asp:BoundField DataField="End_Date" HeaderText="End Date" 
                SortExpression="End_Date" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="SELECT * FROM [Cycle] WHERE ([Sport_ID] = @Sport_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Sport_ID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    Add New Cycle:<br />
    <br />
    <asp:Label ID="DateLabel" runat="server" Text="Start Date."></asp:Label>
    <asp:Calendar ID="StartDateCal" runat="server"></asp:Calendar>
    <br />
    <asp:Label ID="DateLabel0" runat="server" Text="Stop Date."></asp:Label>
    <asp:Calendar ID="StopDateCal" runat="server"></asp:Calendar>
    <br />
    Cycle Name:<br />
    <asp:TextBox ID="CycleName" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add Cycle" />
    <br />
</asp:Content>

