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
            'retrieves text from textboxes
            Dim account As String = txtusername.Text
            Dim mypassword As String = txtpassword.Text
            connection.Open()
            Dim cmd As SqlCommand = New SqlCommand("UserLogin", connection)
            Dim reader As SqlDataReader
            'calls stored procedure to check user existance
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlParameter("@username", account))
            cmd.Parameters.Add(New SqlParameter("@password", mypassword))
            reader = cmd.ExecuteReader()

            If reader.HasRows() Then
                reader.Close()
                'uses stored procedure called sessoinUpdate to set Active to be equal to 1
                Dim sessionUpdate As SqlCommand = New SqlCommand("UserActive", connection)
                sessionUpdate.CommandType = CommandType.StoredProcedure
                sessionUpdate.Parameters.Add(New SqlParameter("@usernameActive", account))
                sessionUpdate.Parameters.Add(New SqlParameter("@passwordActive", mypassword))
                sessionUpdate.ExecuteNonQuery()
                Response.Redirect("https://google.com")
            Else
                Response.Redirect("https://yahoo.com")
            End If
        End Using

    End Sub
End Class
