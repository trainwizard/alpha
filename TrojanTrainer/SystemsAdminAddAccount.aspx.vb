Imports System.Data.SqlClient
Imports System.Data

Partial Class SystemsAdminAddAccount
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

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
                If NewFirstName.Text = "" Or NewLastName.Text = "" Or NewPassword.Text = "" Or NewUsername.Text = "" Then
                    msgvalidusername.Text = "Please complete all fields."
                    msgvalidusername.ForeColor = Drawing.Color.Red
                    msgvalidusername.Visible = True
                Else
                    'else user is added and information saved
                    reader.Close()
                    Dim createUser As SqlCommand = New SqlCommand("CreateAccount", connection)
                    createUser.CommandType = CommandType.StoredProcedure
                    createUser.Parameters.Add(New SqlParameter("@username", NewUsername.Text))
                    createUser.Parameters.Add(New SqlParameter("@password", NewPassword.Text))
                    createUser.Parameters.Add(New SqlParameter("@firstname", NewFirstName.Text))
                    createUser.Parameters.Add(New SqlParameter("@lastname", NewLastName.Text))
                    createUser.Parameters.Add(New SqlParameter("@roleid", RoleDropDown.SelectedValue))
                    createUser.ExecuteNonQuery()
                    msgvalidusername.Text = "User has been added."
                    msgvalidusername.ForeColor = Drawing.Color.DarkGreen
                    msgvalidusername.Visible = True
                End If
                
            End If
        End Using

    End Sub
End Class
