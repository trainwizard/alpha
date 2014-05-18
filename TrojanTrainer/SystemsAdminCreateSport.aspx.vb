Imports System.Data.SqlClient
Imports System.Data


Partial Class SystemsAdminCreateSport
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub addNewSport_Click(sender As Object, e As System.EventArgs) Handles addNewSport.Click
        If NewSport.Text <> "" Then
            Using connection As New SqlConnection(connectionString)
                'connection is established
                connection.Open()
                Dim checkSport As SqlCommand = New SqlCommand("CheckSport", connection)
                Dim reader As SqlDataReader
                'calls stored procedure to check user existance
                checkSport.CommandType = CommandType.StoredProcedure
                checkSport.Parameters.Add(New SqlParameter("@Name", NewSport.Text))
                reader = checkSport.ExecuteReader()
                'checks for returned user if true prints error message
                If reader.HasRows() Then
                    msgvalidsport.Text = "Sport already exists."
                    msgvalidsport.ForeColor = Drawing.Color.Red
                    msgvalidsport.Visible = True

                Else
                    'else user is added and information saved
                    reader.Close()
                    If HasTeamsChbx.Checked = False Then
                        Dim createSport As SqlCommand = New SqlCommand("CreateSport", connection)
                        createSport.CommandType = CommandType.StoredProcedure
                        createSport.Parameters.Add(New SqlParameter("@Name", NewSport.Text))
                        createSport.ExecuteNonQuery()
                        msgvalidsport.Text = "Sport has been added."
                        msgvalidsport.ForeColor = Drawing.Color.DarkGreen
                        msgvalidsport.Visible = True
                        Response.Redirect("SystemsAdminCreateSport.aspx")
                    Else
                        'sport
                        Dim createSport As SqlCommand = New SqlCommand("CreateSport", connection)
                        createSport.CommandType = CommandType.StoredProcedure
                        createSport.Parameters.Add(New SqlParameter("@Name", NewSport.Text))
                        createSport.ExecuteNonQuery()
                        'team
                        Dim createAllTeam As SqlCommand = New SqlCommand("CreateAllTeam", connection)
                        createAllTeam.CommandType = CommandType.StoredProcedure
                        createAllTeam.Parameters.Add(New SqlParameter("@Name", NewSport.Text))
                        createAllTeam.ExecuteNonQuery()
                        msgvalidsport.Text = "Sport has been added."
                        msgvalidsport.ForeColor = Drawing.Color.DarkGreen
                        msgvalidsport.Visible = True
                        Response.Redirect("SystemsAdminCreateSport.aspx")
                    End If
                End If

            End Using
        Else
            msgvalidsport.Text = "Please input a valid name"
            msgvalidsport.ForeColor = Drawing.Color.Red
            msgvalidsport.Visible = True
        End If
    End Sub


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") = 1 Then
            'systems admin
            lblCurrentSports.Visible = True
            gvSports.Visible = True
            lblNewSport.Visible = True
            NewSport.Visible = True
            HasTeamsChbx.Visible = True
            addNewSport.Visible = True
        ElseIf Session.Item("Role") = 2 Then
            lblTeamsHomePage.Visible = True
            ddlSportID.SelectedValue = Session.Item("Sport_ID")
        End If
    End Sub

    Protected Sub addNewTeam_Click(sender As Object, e As System.EventArgs) Handles addNewTeam.Click
        If NewTeam.Text <> "" Then
            Using connection As New SqlConnection(connectionString)
                'connection is established
                connection.Open()
                Dim checkTeam As SqlCommand = New SqlCommand("CheckTeam", connection)
                Dim reader As SqlDataReader
                'calls stored procedure to check user existance
                checkTeam.CommandType = CommandType.StoredProcedure
                checkTeam.Parameters.Add(New SqlParameter("@Name", NewSport.Text))
                reader = checkTeam.ExecuteReader()
                'checks for returned user if true prints error message
                If reader.HasRows() Then
                    msgvalidteam.Text = "Team already exists."
                    msgvalidteam.ForeColor = Drawing.Color.Red
                    msgvalidteam.Visible = True

                Else
                    'else user is added and information saved
                    reader.Close()
                    Dim createTeam As SqlCommand = New SqlCommand("CreateTeam", connection)
                    createTeam.CommandType = CommandType.StoredProcedure
                    createTeam.Parameters.Add(New SqlParameter("@Name", NewTeam.Text))
                    createTeam.Parameters.Add(New SqlParameter("@Sport_ID", ddlSportID.SelectedValue))
                    createTeam.ExecuteNonQuery()
                    msgvalidteam.Text = "Team has been added."
                    msgvalidteam.ForeColor = Drawing.Color.DarkGreen
                    msgvalidteam.Visible = True
                    Response.Redirect("SystemsAdminCreateSport.aspx")
                End If

            End Using
        Else
            msgvalidteam.Text = "Please input a valid name."
            msgvalidteam.ForeColor = Drawing.Color.Red
            msgvalidteam.Visible = True
        End If
    End Sub

    Protected Sub ddlSportID_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlSportID.SelectedIndexChanged
        GridView1.DataBind()
    End Sub

    Protected Sub gvSports_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles gvSports.SelectedIndexChanged

    End Sub
End Class
