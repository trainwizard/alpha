<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="AthleteSNW.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Calendar ID="SelectDate" runat="server" Font-Names="Verdana" 
        Font-Size="9pt" Height="190px" 
        NextPrevFormat="FullMonth" Width="350px" BackColor="White" 
        BorderColor="White" BorderWidth="1px" ForeColor="Black" 
        SelectedDate="04/28/2014 22:18:40">
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
    <br />
    <asp:Label ID="DateValidator" runat="server" ForeColor="Black" 
        Text="Please select a Date."></asp:Label>
    <br />
    <br />
    <asp:Label ID="SleepLabel" runat="server" Text="Sleep"></asp:Label>
    <br />
    <br />
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
    <asp:RadioButtonList ID="AMPMButtons" runat="server">
        <asp:ListItem>AM</asp:ListItem>
        <asp:ListItem>PM</asp:ListItem>
    </asp:RadioButtonList>
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
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem>13</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="NutritionLabel" runat="server" Text="Nutrition"></asp:Label>
    <br />
    <asp:TextBox ID="Calories" runat="server" MaxLength="4"></asp:TextBox>
    <br />
    <asp:TextBox ID="NutritionNote" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="WeightLabel" runat="server" Text="Weight"></asp:Label>
    <br />
    <asp:TextBox ID="PreWeight" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="SubmitInfo" runat="server" Text="Submit" />
</asp:Content>

