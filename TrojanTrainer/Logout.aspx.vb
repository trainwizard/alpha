
Partial Class Logout
    Inherits System.Web.UI.Page

    Protected Sub btnloginpage_Click(sender As Object, e As System.EventArgs) Handles btnloginpage.Click
        Response.Redirect("Welcome.aspx")
    End Sub
End Class
