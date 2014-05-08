<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Welcome.aspx.vb" Inherits="Welcome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

  * {
    background-image:url('foundation/img/backgroundSRS.png');
    background-repeat:no-repeat;
    color: black !important;
    box-shadow: none !important;
    text-shadow: none !important; }

  *,
*:before,
*:after {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box; }

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="datetime-local"],
input[type="month"],
input[type="week"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea {
  -webkit-appearance: none;
  background-color: white;
  font-family: inherit;
  border: 1px solid #cccccc;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
  color: rgba(0, 0, 0, 0.75);
  display: block;
  font-size: 0.875rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  transition: box-shadow 0.45s, border-color 0.45s ease-in-out; }
  input[type="file"],
input[type="checkbox"],
input[type="radio"],
select {
  margin-left: 108px;
    margin-bottom: 0px;
}

input[type="checkbox"] + label,
input[type="radio"] + label {
  display: inline-block;
  margin-left: 0.5rem;
  margin-right: 1rem;
  margin-bottom: 0;
  vertical-align: baseline; }

label {
  font-size: 0.875rem;
  color: #4d4d4d;
  cursor: pointer;
  display: block;
  font-weight: normal;
  line-height: 1.5;
  margin-bottom: 0;
  /* Styles for required inputs */ }
  
input[type="submit"] {
  -webkit-appearance: none; }

table {
  background: white;
  margin-bottom: 1.25rem;
  border: solid 1px #dddddd; }
  table thead tr th,
  table tfoot tr th,
  table tbody tr td,
  table tr td,
  table tfoot tr td {
    display: table-cell;
    line-height: 1.125rem; }

  table tr th,
  table tr td {
    padding: 0.5625rem 0.625rem;
    font-size: 0.875rem;
    color: #222222; }
        .style1 {
            margin-left: 0;
            margin-right: 0;
            margin-top: 5;
            margin-bottom: 0;
            padding: 0;
        }


    </style>
</head>
<body<%-- background="foundation/img/backgroundSRS.png"--%>>

    <form id="form1" runat="server">
    <div>
        
    <div>
    
        <asp:Label ID="msginvalidlogin" runat="server" ForeColor="Red" 
            Text="Incorrect login, please try again." Visible="False"></asp:Label>
        <br />
        <br />
    
        Login Here:<br />
        <br />
        Username:</div>
    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
    <br />
    <br />
    Password:<br />
    <asp:TextBox ID="txtpassword" TextMode="password" runat="server" ></asp:TextBox>
    <br />
    <br />
    <asp:CheckBox ID="ckbloggedin" runat="server" Text="Keep me logged in." />
    <br />
    <br />
    <asp:Button ID="btnlogin" runat="server" EnableTheming="True" Text="Login" CssClass="button tiny"/>


    </div>
</body>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>

    </form>

</html>
