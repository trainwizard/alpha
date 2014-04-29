Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class Welcome
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btnlogin_Click(sender As Object, e As System.EventArgs) Handles btnlogin.Click
        Using connection As New SqlConnection(connectionString)
            'retrieves text from textboxes
            Dim account As String = txtusername.Text
            account = account.ToLower()
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
                reader = Nothing
                'uses stored procedure called UserActive to set Active to be equal to 1
                Dim sessionUpdate As SqlCommand = New SqlCommand("UserActive", connection)
                sessionUpdate.CommandType = CommandType.StoredProcedure
                sessionUpdate.Parameters.Add(New SqlParameter("@usernameActive", account))
                sessionUpdate.Parameters.Add(New SqlParameter("@passwordActive", mypassword))
                sessionUpdate.ExecuteNonQuery()

                'starts user session and check for checked checkbox
                Session("username") = account
                If ckbloggedin.Checked = True Then
                    Session.Timeout() = 20160
                End If

                'find user role
                Dim findRole As SqlCommand = New SqlCommand("GetUserRole", connection)
                findRole.CommandType = CommandType.StoredProcedure
                findRole.Parameters.Add(New SqlParameter("@User_ID", account))
                Dim reader2 As SqlDataReader = findRole.ExecuteReader()
                Dim values As New ArrayList()
                While reader2.Read()
                    Dim role As New String(Str(reader2("Role_ID")))
                    values.Add(role)
                End While
                'CREATES SESSION ROLE
                Session.Item("Role") = Str(values.Item(0))
                reader2.Close()
                reader2 = Nothing
                'GRABS USER PICTURE

                Dim getPicture As SqlCommand = New SqlCommand("GetUserImage", connection)
                getPicture.CommandType = CommandType.StoredProcedure
                getPicture.Parameters.Add(New SqlParameter("@User_ID", Session("username")))
                Dim readerPic As SqlDataReader = getPicture.ExecuteReader()
                Dim picLocation As New List(Of String)
                If readerPic.HasRows() Then
                    While readerPic.Read()
                        Session.Item("UserPicture") = "~/UserImages/" + readerPic("User_Photo_ID")
                        'picLocation.Add(readerPic("User_Photo_ID"))
                    End While
                    'CREATES SESSION ROLE
                    'Session.Item("UserPicture") = picLocation.Item("User_Photo_ID")
                End If
                readerPic.Close()
                readerPic = Nothing
                'redirect to correct home page
                If Session.Item("Role") = 5 Then
                    Response.Redirect("LoginHome.aspx")
                ElseIf Session.Item("Role") = 4 Then
                    'adds an session item called tmid
                    Dim getTMID As SqlCommand = New SqlCommand("GetTMID", connection)
                    getTMID.CommandType = CommandType.StoredProcedure
                    getTMID.Parameters.Add(New SqlParameter("@User_ID", Session("username")))
                    Dim readerTMID As SqlDataReader = getTMID.ExecuteReader()
                    If readerTMID.HasRows() Then
                        While readerTMID.Read()
                            Session.Item("TM_ID") = readerTMID("TM_ID")
                        End While
                    End If
                    readerTMID.Close()
                    readerTMID = Nothing
                    Debug.Print(Session.Item("TM_ID"))
                    Response.Redirect("AthleteHome.aspx")
                ElseIf Session.Item("Role") = 3 Then
                    Response.Redirect("AthleticTrainerHome.aspx")
                ElseIf Session.Item("Role") = 2 Then
                    Response.Redirect("CoachHome.aspx")
                ElseIf Session.Item("Role") = 1 Then
                    Response.Redirect("LoginHome.aspx")
                End If
            Else
                msginvalidlogin.Visible = True
            End If
            connection.Close()
        End Using
    End Sub

    



End Class
