Imports System.Data.SqlClient
Imports System.Data

Partial Class main
    Inherits System.Web.UI.MasterPage
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("username") Is Nothing Then
            'Sends non-user back to homepage if they are trying to URL hack
            'Response.Redirect("Oops.aspx")

            CurrentUserTxt.Text = ""
            logoutButton.Visible = False
        Else
            'Greeting name is set to be the username
            CurrentUserTxt.Text = Session("username")
        End If




    End Sub



    Protected Sub logoutButton_Click(sender As Object, e As System.EventArgs) Handles logoutButton.Click
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
            Response.Redirect("Logout.aspx")
        End Using
    End Sub


End Class

