Imports System.Data.SqlClient
Imports System.Data

Partial Class LoginHome
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Greeting name is set to be the username
        crnuser.Text = Session("username")
        'Sends non-user back to homepage if they are trying to URL hack
        If Session("username") = False Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        'Executes stored procedure named userinactive
        Using connection As New SqlConnection(connectionString)
            Dim account As String = Session("username")
            Dim logoutSession As SqlCommand = New SqlCommand("UserInactive", connection)
            logoutSession.CommandType = CommandType.StoredProcedure
            logoutSession.Parameters.Add(New SqlParameter("@username", account))
            connection.Open()
            logoutSession.ExecuteNonQuery()
            'deletes session and redirects to login page
            Session.Clear()
            Response.Redirect("Login.aspx")
        End Using
    End Sub
End Class
