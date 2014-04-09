<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="EditProfileInfo.aspx.vb" Inherits="EditProfileInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        



        <asp:Image ID="imgProfilePicture" runat="server" 
            ImageUrl="~/images/blank_user_picture.jpg" Width="244px" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        
        <asp:Label ID="lblDialogChangePassword" runat="server" Text="Change your password:"></asp:Label><br />
        <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox><br />    
        <asp:Button ID="btnSubmitPassword" runat="server" Text="Change Password" />
    </p>
</asp:Content>

