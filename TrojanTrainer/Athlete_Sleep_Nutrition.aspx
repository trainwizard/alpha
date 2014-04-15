<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Athlete_Sleep_Nutrition.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>
        Sleep Information</h3>
    <p>
        <asp:Label ID="Sleep_Start" runat="server" Text="Start Time"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Sleep_Stop" runat="server" Text="Stop Time"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Submit_Sleep" runat="server" Text="Submit Sleep Information" />
    </p>
</asp:Content>
