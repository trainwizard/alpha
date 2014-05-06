﻿<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="SportsManagement.aspx.vb" Inherits="_Default" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script language="VB" runat="server">

        Sub DayRender(source As Object, e As DayRenderEventArgs)

            ' Change the background color of the days in the month
            ' to yellow.
            If e.Day.Date < DateTime.Now Then
                e.Day.IsSelectable = False
                e.Cell.BackColor = Drawing.Color.DimGray
            ElseIf GlobalVariables.CalCount > 1 Then
                If e.Day.Date <= GlobalVariables.StopDate Then
                    If e.Day.Date >= GlobalVariables.StartDate Then
                        e.Day.IsSelectable = False
                        e.Cell.BackColor = Drawing.Color.LightGreen
                    End If
                End If
                e.Day.IsSelectable = False 
            End If
            
        End Sub 'DayRender 
        

   </script>
    
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
    <strong>Add New Cycle:</strong><br />
    <br />
    Cycle Name:<br />
    <asp:TextBox ID="CycleName" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="DateLabel" runat="server" 
        Text="Please select a start date for the cycle." style="font-weight: 700"></asp:Label>
    <br />
    <asp:Calendar ID="StartDateCal" runat="server" OnDayRender="DayRender"></asp:Calendar>
    <br />
    <br />
    <asp:Button ID="ClearCalBtn" runat="server" Text="Cancel" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Add Cycle" />
    <br />
</asp:Content>

