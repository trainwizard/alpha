<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="EditProfileInfo.aspx.vb" Inherits="EditProfileInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:Image ID="imgProfilePicture" runat="server" 
            ImageUrl="~/images/blank_user_picture.jpg" Width="244px" />

        <br />
        <asp:Label ID="ChangePicture" runat="server" Text="Change your picture:" Font-Bold="True"></asp:Label>


        <asp:FileUpload ID="PictureUpload" runat="server" />

        
        <asp:Button ID="ChangePictureButton" runat="server" Text="Change Picture" 
            CssClass="button tiny" /><br/>
        <asp:Label ID="PictureLabel" runat="server" Text="Label" Visible="False"></asp:Label>

        
        <br />
        
        <asp:Label ID="lblDialogChangePassword" runat="server" Text="Change your password:" Font-Bold="True"></asp:Label><br /> 
        <asp:Label ID="Label1" runat="server" Text="New Password."></asp:Label>
        <asp:TextBox ID="txtNewPassword" TextMode="password" runat="server"></asp:TextBox>
        <asp:Label ID="lblAngryPassword" runat="server" Visible="False"></asp:Label>
        <p>
        <asp:Label ID="Label2" runat="server" Text="Confirm Password:"></asp:Label>  
        <asp:TextBox ID="txtConfirmPassword" TextMode="password" runat="server"></asp:TextBox>
        
 
        <asp:Button ID="btnSubmitPassword" runat="server" Text="Change Password" 
                CssClass="button tiny" />


        
        <asp:Label ID="lblPasswordSuc" runat="server" 
            Text="Password Successfully Changed!" Visible="False"></asp:Label>
 
 
        <br />
        <br />
        <asp:Label ID="lblChangeEmail" runat="server" Text="Change your email:" Font-Bold="True"></asp:Label>
        <asp:Label ID="lblCurrentEmail" runat="server" Text="Current email:"></asp:Label>
        <br /> 
        <asp:Label ID="Label4" runat="server" Text="New Email."></asp:Label>
        <asp:TextBox ID="txtNewEmail" runat="server"></asp:TextBox>
        <asp:Label ID="lblAngryEmail" runat="server" Visible="False"></asp:Label>
        <p>
        <asp:Label ID="Label6" runat="server" Text="Confirm Email:"></asp:Label>  
        <asp:TextBox ID="txtConfirmEmail" runat="server"></asp:TextBox>
        
 
        <asp:Button ID="btnSubmitEmail" runat="server" Text="Change Email" 
                CssClass="button tiny" />

        
        <asp:Label ID="lblEmailSuc" runat="server" 
            Text="Email Successfully Changed!" Visible="False"></asp:Label>
 
 
        <p/>
</asp:Content>