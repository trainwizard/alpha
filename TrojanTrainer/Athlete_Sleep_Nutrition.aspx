<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Athlete_Sleep_Nutrition.aspx.vb" Inherits="Athlete_Sleep_Nutrition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <p>
        <asp:Calendar ID="Calender" runat="server" 
            SelectedDate="04/15/2014 20:39:23"></asp:Calendar>
    </p>
    <p>
        &nbsp;</p>
    <h3>
        Sleep</h3>

    <p>
        <asp:Label ID="Sleep_Start" runat="server" Text="Time I fell asleep:"></asp:Label>
    </p>
    
    <p>
&nbsp;&nbsp;
        &nbsp;<asp:RadioButtonList ID="RB_Start" runat="server" Width="172px">
            <asp:ListItem>AM</asp:ListItem>
            <asp:ListItem>PM</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <p>
        <asp:Label ID="Sleep_Stop" runat="server" Text="Time I woke up:"></asp:Label>
    </p>
    <p>
        s</p>
    <asp:RadioButtonList ID="RB_Stop" runat="server" Width="172px">
        <asp:ListItem>AM</asp:ListItem>
        <asp:ListItem>PM</asp:ListItem>
    </asp:RadioButtonList>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Submit_Sleep" runat="server" Text="Submit Sleep Information" />
        <asp:Label ID="ErrorMsg" runat="server" ForeColor="#990000" 
            Text="An error occurred. You sure screwed up something badly." Visble="False"></asp:Label>
    </p>
    <h3>&nbsp;</h3>
    <h3>Nutrition</h3>
    <p>
        &nbsp;<asp:TextBox ID="txtCalories" runat="server" Width="219px"></asp:TextBox>
        <asp:Label ID="lblCalories" runat="server" Text="Calories"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
        <asp:TextBox ID="txtNotes" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="SubmitNutrition" runat="server" 
            Text="Submit Nutrition Information" Width="219px" />
    </p>
</asp:Content>
