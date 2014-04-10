Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class EditProfileInfo
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub btnSubmitPassword_Click(sender As Object, e As System.EventArgs) Handles btnSubmitPassword.Click
        Using connection As New SqlConnection(connectionString)
            'retrieves text from textboxes
            Dim newPassword As String = txtNewPassword.Text
            'finds the user whose logged in
            Dim User_ID As String = Session("username")
            connection.Open()
            Dim cmd As SqlCommand = New SqlCommand("ChangePassword", connection)
            Dim reader As SqlDataReader
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlParameter("@User_ID", "@newPassword"))

            reader = cmd.ExecuteReader()


            connection.Close()
        End Using
    End Sub
End Class
