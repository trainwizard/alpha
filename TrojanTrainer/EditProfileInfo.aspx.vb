Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class EditProfileInfo
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub btnSubmitPassword_Click(sender As Object, e As System.EventArgs) Handles btnSubmitPassword.Click
        'compare value sets a variable so the while loop knows its ok to execute 
        Dim compareValue As Boolean = True
        If txtNewPassword.Text = "" Then
            lblAngryPassword.Text = "Please enter a valid Password"
            lblAngryPassword.ForeColor = Drawing.Color.Red
            lblAngryPassword.Visible = True
            compareValue = False
            'ElseIf txtNewPassword.Text = "" Then
            '    lblAngryPassword.Text = "Please Enter a Valid Password"
            '    lblAngryPassword.ForeColor = Drawing.Color.Red
            '    lblAngryPassword.Visible = True
        End If
        While compareValue = True
            Using connection As New SqlConnection(connectionString)

                'retrieves text from textboxes
                Dim newPassword As String = txtNewPassword.Text
                'finds the user whose logged in

                connection.Open()
                Dim cmd As SqlCommand = New SqlCommand("ChangePassword", connection)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New SqlParameter("@User_ID", Session("username")))
                cmd.Parameters.Add(New SqlParameter("@Password", newPassword))
                cmd.ExecuteNonQuery()
                lblAngryPassword.Visible = False
                lblPasswordSuc.Visible = True
                connection.Close()
               
            End Using
            
        End While
    End Sub
End Class
