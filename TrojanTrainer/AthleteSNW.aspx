<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="AthleteSNW.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Calendar ID="SelectDate" runat="server" Font-Names="Verdana" 
        Font-Size="9pt" Height="190px" 
        NextPrevFormat="FullMonth" Width="268px" BackColor="White" 
        BorderColor="White" BorderWidth="1px" ForeColor="Black" 
        SelectedDate="2014-05-10">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
            VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="White" Font-Bold="True" 
            Font-Size="12pt" ForeColor="#333399" BorderColor="Black" 
            BorderWidth="4px" />
        <TodayDayStyle BackColor="#CCCCCC" />
    </asp:Calendar>
    <asp:Label ID="DateValidator" runat="server" ForeColor="Black" 
        Text="Please select a Date."></asp:Label>
    <br />
    <br />
    <asp:Button ID="Nutrition" runat="server" Text="View or Enter Nutrition" 
        Width="173px" CssClass="button small" />
    <asp:Button ID="WorkoutBtn" runat="server" Text="View or Enter Workout" 
        Width="173px" CssClass="button small" />
    <br />
    <br />
    <asp:Label ID="BedtimeOutput" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="HoursOutput" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="MealsOutput" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="NotesOutput" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="WeightOutput" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <asp:Label ID="SleepLabel" runat="server" Text="Bedtime:"></asp:Label>
    &nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="BedTimeH" runat="server">
        <asp:ListItem Value="01">1</asp:ListItem>
        <asp:ListItem Value="02">2</asp:ListItem>
        <asp:ListItem Value="03">3</asp:ListItem>
        <asp:ListItem Value="04">4</asp:ListItem>
        <asp:ListItem Value="05">5</asp:ListItem>
        <asp:ListItem Value="06">6</asp:ListItem>
        <asp:ListItem Value="07">7</asp:ListItem>
        <asp:ListItem Value="08">8</asp:ListItem>
        <asp:ListItem Value="09">9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
    </asp:DropDownList>
    &nbsp;
    <asp:DropDownList ID="BedTimeM" runat="server">
        <asp:ListItem>00</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>45</asp:ListItem>
    </asp:DropDownList>
    <asp:RadioButtonList ID="AMPMButtons" runat="server">
        <asp:ListItem>AM</asp:ListItem>
        <asp:ListItem>PM</asp:ListItem>
    </asp:RadioButtonList>
    <asp:Label ID="HoursSleptLabel" runat="server" Text="Hours Slept:"></asp:Label>
    &nbsp;&nbsp;
    <asp:DropDownList ID="NumHours" runat="server">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem>13</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Label ID="NutritionLabel" runat="server" Text="Meals Eaten:"></asp:Label>
    <br />
    <asp:CheckBoxList ID="Calories" runat="server">
        <asp:ListItem>Breakfast</asp:ListItem>
        <asp:ListItem>Lunch</asp:ListItem>
        <asp:ListItem>Dinner</asp:ListItem>
    </asp:CheckBoxList>
    <asp:Label ID="MealNoteLabel" runat="server" Text="Meal Notes:"></asp:Label>
    <br />
    <asp:TextBox ID="NutritionNote" runat="server"></asp:TextBox>
    <asp:Label ID="WeightLabel" runat="server" Text="Current Weight:"></asp:Label>
    <br />
    <asp:TextBox ID="PreWeight" runat="server"></asp:TextBox>
    <asp:Button ID="SubmitInfo" runat="server" Text="Submit" 
        CausesValidation="False" CssClass="button small" />
    <br />
    <asp:GridView ID="SportsGv" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource1" 
        GridLines="Horizontal" Visible="False">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Workout_Name" HeaderText="Workout Name" 
                SortExpression="Workout_Name" />
            <asp:BoundField DataField="Pre_Training_Notes" HeaderText="Pre Training Notes" 
                SortExpression="Pre_Training_Notes" />
            <asp:BoundField DataField="Post_Training_Notes" 
                HeaderText="Post Training Notes" SortExpression="Post_Training_Notes" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:GridView ID="TeamGv" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource2" 
        GridLines="Horizontal" Visible="False">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Workout_Name" HeaderText="Workout_Name" 
                SortExpression="Workout_Name" />
            <asp:BoundField DataField="Pre_Training_Notes" 
                HeaderText="Pre Training Notes" SortExpression="Pre_Training_Notes" />
            <asp:BoundField DataField="Post_Training_Notes" HeaderText="Post Training Notes" 
                SortExpression="Post_Training_Notes" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="GetSportWorkoutID" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="User_ID" SessionField="username" Type="String" />
            <asp:ControlParameter ControlID="SelectDate" DbType="Date" Name="Start_Date" 
                PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="GetTeamWorkoutID" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="User_ID" SessionField="username" Type="String" />
            <asp:ControlParameter ControlID="SelectDate" DbType="Date" Name="Start_Date" 
                PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

