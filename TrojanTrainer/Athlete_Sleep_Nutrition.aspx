<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Athlete_Sleep_Nutrition.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <p>
        Date<asp:Calendar ID="SleepCalender" runat="server" 
            SelectedDate="04/15/2014 20:39:23"></asp:Calendar>
        <asp:Label ID="testLabel" runat="server" Text="Date"></asp:Label>
    </p>
    <h3>
        Sleep Information</h3>

    <p>
        <asp:Label ID="Sleep_Start" runat="server" Text="Start Time"></asp:Label>
    </p>
    
    <p>
        <asp:Label ID="lblStartHour" runat="server" Text="Hour"></asp:Label>
        <asp:ListBox ID="listStartTime" runat="server" Height="21px">
            <asp:ListItem Value="01">1 am</asp:ListItem>
            <asp:ListItem Value="02">2 am</asp:ListItem>
            <asp:ListItem Value="03">3 am</asp:ListItem>
            <asp:ListItem Value="04">4 am</asp:ListItem>
            <asp:ListItem Value="05">5 am</asp:ListItem>
            <asp:ListItem Value="06">6 am</asp:ListItem>
            <asp:ListItem Value="07">7 am</asp:ListItem>
            <asp:ListItem Value="08">8 am</asp:ListItem>
            <asp:ListItem Value="09">9 am</asp:ListItem>
            <asp:ListItem Value="10">10 am</asp:ListItem>
            <asp:ListItem Value="11">11 am</asp:ListItem>
            <asp:ListItem Value="12">Noon</asp:ListItem>
            <asp:ListItem Value="13">1 pm</asp:ListItem>
            <asp:ListItem Value="14">2 pm</asp:ListItem>
            <asp:ListItem Value="15">3 pm</asp:ListItem>
            <asp:ListItem Value="16">4 pm</asp:ListItem>
            <asp:ListItem Value="17">5 pm</asp:ListItem>
            <asp:ListItem Value="18">6 pm</asp:ListItem>
            <asp:ListItem Value="19">7 pm</asp:ListItem>
            <asp:ListItem Value="20">8 pm</asp:ListItem>
            <asp:ListItem Value="21">9 pm</asp:ListItem>
            <asp:ListItem Value="22">10 pm</asp:ListItem>
            <asp:ListItem Value="23">11 pm</asp:ListItem>
            <asp:ListItem Value="24">Midnight</asp:ListItem>
        </asp:ListBox>
&nbsp;
        <asp:Label ID="lblStartMin" runat="server" Text="Minutes"></asp:Label>
        <asp:ListBox ID="ListBox1" runat="server" Height="21px" Width="45px">
            <asp:ListItem>00</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
        </asp:ListBox>
    </p>
    <p>
        <asp:Label ID="Sleep_Stop" runat="server" Text="Stop Time"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblStopHour" runat="server" Text="Hour"></asp:Label>
        <asp:ListBox ID="listStopTime" runat="server" Height="21px">
            <asp:ListItem Value="01">1 am</asp:ListItem>
            <asp:ListItem Value="02">2 am</asp:ListItem>
            <asp:ListItem Value="03">3 am</asp:ListItem>
            <asp:ListItem Value="04">4 am</asp:ListItem>
            <asp:ListItem Value="05">5 am</asp:ListItem>
            <asp:ListItem Value="06">6 am</asp:ListItem>
            <asp:ListItem Value="07">7 am</asp:ListItem>
            <asp:ListItem Value="08">8 am</asp:ListItem>
            <asp:ListItem Value="09">9 am</asp:ListItem>
            <asp:ListItem Value="10">10 am</asp:ListItem>
            <asp:ListItem Value="11">11 am</asp:ListItem>
            <asp:ListItem Value="12">Noon</asp:ListItem>
            <asp:ListItem Value="13">1 pm</asp:ListItem>
            <asp:ListItem Value="14">2 pm</asp:ListItem>
            <asp:ListItem Value="15">3 pm</asp:ListItem>
            <asp:ListItem Value="16">4 pm</asp:ListItem>
            <asp:ListItem Value="17">5 pm</asp:ListItem>
            <asp:ListItem Value="18">6 pm</asp:ListItem>
            <asp:ListItem Value="19">7 pm</asp:ListItem>
            <asp:ListItem Value="20">8 pm</asp:ListItem>
            <asp:ListItem Value="21">9 pm</asp:ListItem>
            <asp:ListItem Value="22">10 pm</asp:ListItem>
            <asp:ListItem Value="23">11 pm</asp:ListItem>
            <asp:ListItem Value="24">Midnight</asp:ListItem>
        </asp:ListBox>
        <asp:Label ID="lblStopMin" runat="server" Text="Minutes"></asp:Label>
        <asp:ListBox ID="ListBox2" runat="server" Height="21px" Width="45px">
            <asp:ListItem>00</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
        </asp:ListBox>
    </p>
    <p>
        <asp:Button ID="Submit_Sleep" runat="server" Text="Submit Sleep Information" />
    </p>
    <h3>Nutrition Information</h3>
    <p>
        <asp:Label ID="lblCalories" runat="server" Text="Calories"></asp:Label>
        <asp:TextBox ID="txtCalories" runat="server"></asp:TextBox>
        <asp:Label ID="testLabel2" runat="server" Text="Cal."></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
        <asp:TextBox ID="txtNotes" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="SubmitNutrition" runat="server" 
            Text="Submit Nutrition Information" Width="219px" />
    </p>
</asp:Content>
