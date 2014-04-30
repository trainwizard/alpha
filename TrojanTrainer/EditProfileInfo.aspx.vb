Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class EditProfileInfo
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub btnSubmitPassword_Click(sender As Object, e As System.EventArgs) Handles btnSubmitPassword.Click
        'compare value sets a variable so the while loop knows its ok to execute 
        Dim compareValue As Boolean = True
        If txtNewPassword.Text = "" Or txtConfirmPassword.Text = "" Then
            lblAngryPassword.Text = "Please enter a valid Password into both fields."
            lblAngryPassword.ForeColor = Drawing.Color.Red
            lblAngryPassword.Visible = True
            compareValue = False
            'ElseIf txtNewPassword.Text = "" Then
            '    lblAngryPassword.Text = "Please Enter a Valid Password"
            '    lblAngryPassword.ForeColor = Drawing.Color.Red
            '    lblAngryPassword.Visible = True
        ElseIf txtNewPassword.Text <> txtConfirmPassword.Text Then
            lblAngryPassword.Text = "Your passwords do not match."
            lblAngryPassword.ForeColor = Drawing.Color.Red
            lblAngryPassword.Visible = True
            compareValue = False
        End If
        If compareValue = True Then
            Using connection As New SqlConnection(connectionString)
                lblAngryPassword.Visible = False
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
                lblPasswordSuc.ForeColor = Drawing.Color.Green
                connection.Close()

            End Using

        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        imgProfilePicture.ImageUrl = Session.Item("UserPicture")
        Using connection As New SqlConnection(connectionString)
            connection.Open()
            Dim getEmail As SqlCommand = New SqlCommand("GetUserEmail", connection)
            getEmail.CommandType = CommandType.StoredProcedure
            getEmail.Parameters.Add(New SqlParameter("@User_ID", Session("username")))
            Dim reader As SqlDataReader = getEmail.ExecuteReader()
            Dim values As New ArrayList()
            If reader.HasRows() Then
                Do While reader.Read()
                    values.Add(reader("email"))
                Loop
                lblCurrentEmail.Text = "<br />Current Email: " + values.Item(0)
            End If
            connection.Close()
            imgProfilePicture.ImageUrl = Session.Item("UserPicture")
        End Using
    End Sub

    Protected Sub ChangePictureButton_Click(sender As Object, e As System.EventArgs) Handles ChangePictureButton.Click
        'upload jpg
        If PictureUpload.HasFile Then
            Dim path As String = Server.MapPath("~/UserImages/")
            Dim fileOK As Boolean = False
            If PictureUpload.HasFile Then
                Dim fileExtension As String
                fileExtension = System.IO.Path. _
                    GetExtension(PictureUpload.FileName).ToLower()
                Dim allowedExtensions As String() = _
                    {".jpg", ".jpeg"}
                For i As Integer = 0 To allowedExtensions.Length - 1
                    If fileExtension = allowedExtensions(i) Then
                        fileOK = True
                    End If
                Next
                If fileOK Then
                    Try
                        Dim dateTimeStampedFileName As String = Session("username") + DateTime.Now.ToString("hmtMMddyyyy") + ".jpg"
                        PictureUpload.PostedFile.SaveAs(path & _
                             dateTimeStampedFileName)
                        PictureLabel.Visible = True
                        PictureLabel.Text = "File uploaded!"
                        'set user picture in database
                        Using connection2 As New SqlConnection(connectionString)
                            connection2.Open()
                            Dim cmdd As SqlCommand = New SqlCommand("UpdateImage", connection2)
                            cmdd.CommandType = CommandType.StoredProcedure
                            cmdd.Parameters.Add(New SqlParameter("@User_ID", Session("username")))
                            cmdd.Parameters.Add(New SqlParameter("@user_photo_ID", dateTimeStampedFileName))
                            cmdd.ExecuteNonQuery()
                            Session.Item("UserPicture") = "~/UserImages/" + dateTimeStampedFileName
                            connection2.Close()
                            imgProfilePicture.ImageUrl = Session.Item("UserPicture")
                        End Using
                    Catch ex As Exception
                        PictureLabel.Visible = True
                        PictureLabel.Text = "File could not be uploaded."
                    End Try
                Else
                    PictureLabel.Visible = True
                    PictureLabel.Text = "Cannot accept files of this type."
                End If
            End If
        End If

    End Sub

    Protected Sub btnSubmitEmail_Click(sender As Object, e As System.EventArgs) Handles btnSubmitEmail.Click
        'compare value sets a variable so the while loop knows its ok to execute 
        Dim compareEmailValue As Boolean = True
        Dim email As String = txtNewEmail.Text
        Debug.Print(email.Substring(email.Length - 4))
        If txtNewEmail.Text = "" Or txtConfirmEmail.Text = "" Then
            lblEmailSuc.Visible = False
            lblAngryEmail.Text = "Please enter a valid Email into both fields."
            lblAngryEmail.ForeColor = Drawing.Color.Red
            lblAngryEmail.Visible = True
            compareEmailValue = False
            'ElseIf txtNewPassword.Text = "" Then
            '    lblAngryPassword.Text = "Please Enter a Valid Password"
            '    lblAngryPassword.ForeColor = Drawing.Color.Red
            '    lblAngryPassword.Visible = True
        ElseIf txtNewEmail.Text <> txtConfirmEmail.Text Then
            lblEmailSuc.Visible = False
            lblAngryEmail.Text = "Your Emails do not match."
            lblAngryEmail.ForeColor = Drawing.Color.Red
            lblAngryEmail.Visible = True
            compareEmailValue = False

        ElseIf email.Substring(email.Length - 4) <> ".com" And email.Substring(email.Length - 4) <> ".net" And email.Substring(email.Length - 4) <> ".edu" And email.Substring(email.Length - 4) <> ".org" And email.Substring(email.Length - 4) <> ".gov" Then
            lblEmailSuc.Visible = False
            lblAngryEmail.Text = "Please enter a valid email."
            lblAngryEmail.ForeColor = Drawing.Color.Red
            lblAngryEmail.Visible = True
            compareEmailValue = False
        ElseIf Not email.Contains("@") Then
            lblEmailSuc.Visible = False
            lblAngryEmail.Text = "Please enter a valid email."
            lblAngryEmail.ForeColor = Drawing.Color.Red
            lblAngryEmail.Visible = True
            compareEmailValue = False
        End If
        If compareEmailValue = True Then
            Using connection As New SqlConnection(connectionString)
                lblAngryEmail.Visible = False
                'retrieves text from textboxes
                Dim newEmail As String = txtNewEmail.Text
                'finds the user whose logged in

                connection.Open()
                Dim cmd As SqlCommand = New SqlCommand("ChangeEmail", connection)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New SqlParameter("@User_ID", Session("username")))
                cmd.Parameters.Add(New SqlParameter("@email", newEmail))
                cmd.ExecuteNonQuery()
                lblAngryEmail.Visible = False
                lblEmailSuc.Visible = True
                lblEmailSuc.ForeColor = Drawing.Color.Green
                connection.Close()
                txtConfirmEmail.Text = ""
                txtNewEmail.Text = ""
                lblCurrentEmail.Text = "<br />Current email: " + newEmail
            End Using

        End If
    End Sub
End Class