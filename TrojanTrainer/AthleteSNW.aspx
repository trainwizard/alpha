<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="AthleteSNW.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Calendar ID="SelectDate" runat="server" BorderStyle="Solid" 
        CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" Height="250px" 
        NextPrevFormat="ShortMonth" Width="330px">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
            Height="8pt" />
        <DayStyle BackColor="#CCCCCC" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
            Font-Size="12pt" ForeColor="White" Height="12pt" />
        <TodayDayStyle BackColor="#999999" ForeColor="White" />
    </asp:Calendar>
    <br />
    Sleep<br />
    <br />
    <asp:DropDownList ID="BedTimeH" runat="server">
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
    </asp:DropDownList>
    <br />
    <br />
    <asp:DropDownList ID="BedTimeM" runat="server">
        <asp:ListItem>00</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>45</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
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
        <asp:ListItem>10+</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    Nutrition<br />
    <asp:TextBox ID="Calories" runat="server" MaxLength="4"></asp:TextBox>
    <br />
    <asp:TextBox ID="NutritionNote" runat="server"></asp:TextBox>
    <br />
    Weight<br />
    <asp:TextBox ID="PreWeight" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="PostWeight" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="SubmitInfo" runat="server" Text="Submit" />
</asp:Content>

