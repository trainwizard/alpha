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

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        imgProfilePicture.ImageUrl = Session.Item("UserPicture")
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

        




        'Using connection2 As New SqlConnection(connectionString)
        'connection2.Open()
        'Dim cmdd As SqlCommand = New SqlCommand("GetUserImage", connection2)
        'cmdd.CommandType = CommandType.StoredProcedure
        'cmdd.Parameters.Add(New SqlParameter("@User_ID", Session("username")))
        'Dim reader2 As SqlDataReader = cmdd.ExecuteReader()
        'Dim values As New ArrayList()
        'While reader2.Read()
        'Dim role As New String(Str(reader2("User_Picture_Location")))
        'values.Add(role)
        'End While
        'CREATES SESSION ROLE
        'Session.Item("Role") = Str(values.Item(0))

        'connection2.Close()

        'End Using
    End Sub
End Class
