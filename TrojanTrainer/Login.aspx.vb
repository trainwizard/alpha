Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Public Class Login
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnlogin_Click(sender As Object, e As EventArgs) Handles btnlogin.Click
        Using connection As New SqlConnection(connectionString)
            Dim account As String = txtusername.Text
            Dim mypassword As String = txtpassword.Text

            connection.Open()
            Dim cmd As SqlCommand = New SqlCommand("UserLogin", connection)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlParameter("@username", account))
            cmd.Parameters.Add(New SqlParameter("@password", mypassword))
            'add reader

            If reader.HasRows() Then
                Response.Redirect("https://google.com")
            Else
                Response.Redirect("https://yahoo.com")
            End If
        End Using

    End Sub
End Class
