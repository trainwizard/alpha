<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="AthInp.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Label ID="lblWorkoutName" runat="server" 
            Text="This should be the workout name"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        <br />
    </p>
</asp:Content>

