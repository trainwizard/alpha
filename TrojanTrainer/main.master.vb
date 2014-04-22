Imports System.Data.SqlClient
Imports System.Data
Imports System.Diagnostics


Partial Class main
    Inherits System.Web.UI.MasterPage
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'No current user
        If Session("username") Is Nothing Then
            'Sends non-user back to homepage if they are trying to URL hack
            'Response.Redirect("Oops.aspx")
            Dim url As String = Request.RawUrl
            If url = "/TrojanTrainer/Login.aspx" Or url = "/TrojanTrainer/Oops.aspx" Or url = "/TrojanTrainer/Logout.aspx" Then
                CurrentUserTxt.Text = ""
                btnLogout.Visible = False
            Else
                Response.Redirect("Oops.aspx")
                CurrentUserTxt.Text = ""
                btnLogout.Visible = False
            End If
            'Makes buttons not visible is user is not logged in
            btnAccounts.Visible = False
            btnRoster.Visible = False
            btnInjury.Visible = False
            btnSports.Visible = False
            btnMyHome.Visible = False
            btnWorkouts.Visible = False
            btnViewData.Visible = False
            'valid current user
        Else
            'Greeting name is set to be the username
            CurrentUserTxt.Text = "Welcome, " + Session("username") + "."
            btnLogout.Visible = True

            'Removes buttons based on the user
            Debug.Print(Session.Item("Role"))
            If Session.Item("Role") = 5 Then
                'any user
                'accounts
                'workouts
                'roster
                'view data
                'injury
                'sports
                'add removal here

            ElseIf Session.Item("Role") = 4 Then
                'athlete
                btnAccounts.Visible = False
                btnRoster.Visible = False
                btnInjury.Visible = False
                btnSports.Visible = False

            ElseIf Session.Item("Role") = 3 Then
                'athletic trainer
                btnAccounts.Visible = False
                btnViewData.Visible = False
                btnSports.Visible = False

            ElseIf Session.Item("Role") = 2 Then
                'coach
                btnAccounts.Visible = False
                btnSports.Text = "Teams"

            ElseIf Session.Item("Role") = 1 Then
                'systems admin
                btnViewData.Visible = False

            End If

        End If


    End Sub



    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        'Executes stored procedure named userinactive
        Using connection As New SqlConnection(connectionString)
            Dim account As String = Session("username")
            Dim logoutSession As SqlCommand = New SqlCommand("UserInactive", connection)
            logoutSession.CommandType = CommandType.StoredProcedure
            logoutSession.Parameters.Add(New SqlParameter("@username", account))
            connection.Open()
            logoutSession.ExecuteNonQuery()
            'deletes session and redirects to login page
            Session.Clear()
            Response.Redirect("Logout.aspx")
        End Using
    End Sub



    'Home button click
    Protected Sub btnMyHome_Click(sender As Object, e As System.EventArgs) Handles btnMyHome.Click
        Response.Redirect("LoginHome.aspx")
        If Session.Item("Role") = 5 Then
            'any user
            Response.Redirect("LoginHome.aspx")
        ElseIf Session.Item("Role") = 4 Then
            'athlete
            Response.Redirect("AthleteHome.aspx")

        ElseIf Session.Item("Role") = 3 Then
            'athletic trainer
            Response.Redirect("AthleticTrainerHome.aspx")

        ElseIf Session.Item("Role") = 2 Then
            'coach
            Response.Redirect("CoachHome.aspx")

        ElseIf Session.Item("Role") = 1 Then
            'systems admin
            Response.Redirect("LoginHome.aspx")
        End If
    End Sub




    'Accounts button click
    Protected Sub btnAccounts_Click(sender As Object, e As System.EventArgs) Handles btnAccounts.Click
        'any user - hidden
        'athlete  - hidden
        'coach - hidden
        If Session.Item("Role") = 1 Then
            'systems admin
            Response.Redirect("SystemsAdminAddAccount.aspx")
        End If
    End Sub

    Protected Sub btnWorkouts_Click(sender As Object, e As System.EventArgs) Handles btnWorkouts.Click
        If Session.Item("Role") = 5 Then
            'any user

        ElseIf Session.Item("Role") = 4 Then
            'athlete


        ElseIf Session.Item("Role") = 3 Then
            'athletic trainer
            Response.Redirect("Workouts.aspx")

        ElseIf Session.Item("Role") = 2 Then
            'coach
            Response.Redirect("Workouts.aspx")

        ElseIf Session.Item("Role") = 1 Then
            'systems admin
            Response.Redirect("Workouts.aspx")

        End If
    End Sub

    Protected Sub btnRoster_Click(sender As Object, e As System.EventArgs) Handles btnRoster.Click
        Response.Redirect("Roster.aspx")
        'any user - hidden
        'athlete - hidden
        If Session.Item("Role") = 3 Then
            'athletic trainer
            Response.Redirect("Roster.aspx")

        ElseIf Session.Item("Role") = 2 Then
            'coach
            Response.Redirect("Roster.aspx")

        ElseIf Session.Item("Role") = 1 Then
            'systems admin
            Response.Redirect("Roster.aspx")

        End If
    End Sub

    Protected Sub btnViewData_Click(sender As Object, e As System.EventArgs) Handles btnViewData.Click
        Response.Redirect("ViewData.aspx")
        If Session.Item("Role") = 5 Then
            'any user

        ElseIf Session.Item("Role") = 4 Then
            'athlete


        ElseIf Session.Item("Role") = 3 Then
            'athletic trainer


        ElseIf Session.Item("Role") = 2 Then
            'coach


        ElseIf Session.Item("Role") = 1 Then
            'systems admin

        End If
    End Sub

    Protected Sub btnInjury_Click(sender As Object, e As System.EventArgs) Handles btnInjury.Click
        Response.Redirect("Injury.aspx")
        If Session.Item("Role") = 5 Then
            'any user

        ElseIf Session.Item("Role") = 4 Then
            'athlete


        ElseIf Session.Item("Role") = 3 Then
            'athletic trainer


        ElseIf Session.Item("Role") = 2 Then
            'coach


        ElseIf Session.Item("Role") = 1 Then
            'systems admin

        End If
    End Sub

    Protected Sub btnSports_Click(sender As Object, e As System.EventArgs) Handles btnSports.Click
        Response.Redirect("SystemsAdminCreateSport.aspx")
        If Session.Item("Role") = 5 Then
            'any user

        ElseIf Session.Item("Role") = 4 Then
            'athlete


        ElseIf Session.Item("Role") = 3 Then
            'athletic trainer


        ElseIf Session.Item("Role") = 2 Then
            'coach


        ElseIf Session.Item("Role") = 1 Then
            'systems admin
            Response.Redirect("SystemsAdminCreateSport.aspx")
        End If
    End Sub

End Class

