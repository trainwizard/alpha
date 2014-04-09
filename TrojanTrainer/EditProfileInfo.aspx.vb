
Partial Class EditProfileInfo
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub btnSubmitPassword_Click(sender As Object, e As System.EventArgs) Handles btnSubmitPassword.Click
        Using connection As New SqlConnection(connectionString)
            'retrieves text from textboxes
            Dim newPassword As String = txtNewPassword.Text

            connection.Open()
            Dim cmd As SqlCommand = New SqlCommand("ChangePassword", connection)
            Dim reader As SqlDataReader

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlParameter("@newPassword"))

            reader = cmd.ExecuteReader()


            connection.Close()
        End Using
    End Sub
End Class
