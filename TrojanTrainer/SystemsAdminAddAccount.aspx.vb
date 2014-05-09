Imports System.Data.SqlClient
Imports System.Data
Imports System.Char
Imports System.Diagnostics



Partial Class SystemsAdminAddAccount
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") > 1 Then
            Response.Redirect("Permissions.aspx")
        End If
        'Makes password text hidden by default
        NewPassword.TextMode = TextBoxMode.Password
    End Sub

    Private Sub ShowPasswordButton_CheckedChanged(sender As Object, e As EventArgs) Handles ShowPasswordButton.CheckedChanged
        If ShowPasswordButton.Checked Then
            NewPassword.TextMode = TextBoxMode.SingleLine
        Else
            NewPassword.TextMode = TextBoxMode.Password
        End If
    End Sub


    Protected Sub btncreateuser_Click(sender As Object, e As System.EventArgs) Handles btncreateuser.Click
        Using connection As New SqlConnection(connectionString)
            'connection is established
            connection.Open()
            Dim cmd As SqlCommand = New SqlCommand("ValidUsername", connection)
            Dim reader As SqlDataReader
            'calls stored procedure to check user existance
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New SqlParameter("@username", NewUsername.Text))
            reader = cmd.ExecuteReader()
            'checks for returned user if true prints error message
            If reader.HasRows() Then
                msgvalidusername.Text = "Username is taken."
                msgvalidusername.ForeColor = Drawing.Color.Red
                msgvalidusername.Visible = True

            Else
                If NewFirstName.Text = "" Or NewLastName.Text = "" Or NewPassword.Text = "" Or NewUsername.Text = "" Or NewEmail.Text = "" Then
                    'msgvalidusername.Text = "Please complete all fields."
                    msgvalidusername.ForeColor = Drawing.Color.Red
                    msgvalidusername.Visible = True
                    'ElseIf NewPassword.Text IsNot NewPassword2.Text Then
                    'msgvalidusername.Text = "Passwords do not match."
                    'msgvalidusername.ForeColor = Drawing.Color.Red
                    'msgvalidusername.Visible = True
                Else
                    'else user is added and information saved
                    reader.Close()
                    Dim createUser As SqlCommand = New SqlCommand("CreateAccount", connection)
                    createUser.CommandType = CommandType.StoredProcedure
                    createUser.Parameters.Add(New SqlParameter("@username", NewUsername.Text))
                    createUser.Parameters.Add(New SqlParameter("@password", NewPassword.Text))
                    createUser.Parameters.Add(New SqlParameter("@firstname", NewFirstName.Text))
                    createUser.Parameters.Add(New SqlParameter("@lastname", NewLastName.Text))
                    createUser.Parameters.Add(New SqlParameter("@email", NewEmail.Text))
                    createUser.Parameters.Add(New SqlParameter("@roleid", RoleDropDown.SelectedValue))
                    createUser.ExecuteNonQuery()
                    If RoleDropDown.SelectedValue = 4 Or RoleDropDown.SelectedValue = 2 Then
                        Dim UserSport As SqlCommand = New SqlCommand("UserSport", connection)
                        UserSport.CommandType = CommandType.StoredProcedure
                        UserSport.Parameters.Add(New SqlParameter("@User_ID", NewUsername.Text))
                        UserSport.Parameters.Add(New SqlParameter("@Sport_ID", SportSelection.SelectedValue))
                        UserSport.ExecuteNonQuery()
                    End If
                    Response.Redirect("SystemsAdminAddAccount.aspx")
                End If

            End If
        End Using

    End Sub

    Protected Sub RoleDropDown_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RoleDropDown.SelectedIndexChanged
        If RoleDropDown.SelectedValue = 2 Or RoleDropDown.SelectedValue = 4 Then
            SportAddLabel.Visible = True
            SportSelection.Visible = True
        Else
            SportAddLabel.Visible = False
            SportSelection.Visible = False
        End If
    End Sub
End Class
