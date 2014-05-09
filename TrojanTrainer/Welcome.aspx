<%@ page language="VB" autoeventwireup="false" codefile="Welcome.aspx.vb" inherits="Welcome" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Trojan Trainer</title>
    <link href="foundation/css/foundation.css" rel="stylesheet" type="text/css" />
    <link href="foundation/css/foundation.min.css" rel="stylesheet" type="text/css" />

<style type="text/css">
body{
    background-image:url('foundation/img/backgroundSRS.png');
    background-repeat:no-repeat;
}   

  * {

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

<form id="form1" runat="server">
<body>

	<asp:label id="msginvalidlogin" runat="server" forecolor="Red" text="Incorrect login, please try again." visible="False">
        <div data-alert class="alert-box alert radius">
            Incorrect Login, please try again
            <a href="Welcome.aspx" class="close">&times;</a>
        </div>
    </asp:label>
		<br/>
		<br/>
		<p>Login Here:</p><br/>
		<br/>
		<p>Username:</p>
	<asp:textbox id="txtusername" runat="server" style="margin-left: 200px; margin-top:200px;">Username</asp:textbox>
	    <br/>
	    <br/>
	    <p>Password:</p><br/>
	<asp:textbox id="txtpassword" textmode="password" runat="server" style="margin-left: 200px; margin-top:200px;"></asp:textbox>
	    <br/>
	    <br/>
	<asp:checkbox id="ckbloggedin" runat="server" style="margin-left: 200px; margin-top:200px;" text="Keep me logged in."/>
	    <br/>
	    <br/>
	<asp:button id="btnlogin" runat="server" enabletheming="True" text="Login" cssclass="button tiny" style="margin-left: 200px; margin-top:200px;"/>

	
	<asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ connectionstrings:alphaconnectionstring %>" SelectCommand="SELECT * FROM [User]"></asp:sqldatasource>
</body>
</form>
</html>