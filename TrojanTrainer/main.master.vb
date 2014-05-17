Imports System.Data.SqlClient
Imports System.Data
Imports System.Diagnostics


Partial Class main
    Inherits System.Web.UI.MasterPage
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Gets user picture
        UserImage.ImageUrl = Session.Item("UserPicture")
        'No current user
        If Session("username") Is Nothing Then
            'Sends non-user back to homepage if they are trying to URL hack
            'Response.Redirect("Oops.aspx")
            Dim url As String = Request.RawUrl
            If url = "/TrojanTrainer/Login.aspx" Or url = "/TrojanTrainer/Oops.aspx" Or url = "/TrojanTrainer/Logout.aspx" Or url = "/TrojanTrainer/Welcome.aspx" Then
                CurrentUserTxt.Text = ""
                btnLogout.Visible = False
            Else
                Response.Redirect("Oops.aspx")
                CurrentUserTxt.Text = ""
                btnLogout.Visible = False
            End If
            'Makes buttons not visible is user is not logged in
            UserImage.Visible = False
            btnAccounts.Visible = False
            btnAccountsOffCanvas.Visible = False
            btnRoster.Visible = False
            btnRosterOffCanvas.Visible = False
            btnCycleMng.Visible = False
            btnCycleMngOffCanvas.Visible = False
            btnSports.Visible = False
            btnSportsOffCanvas.Visible = False
            btnMyHome.Visible = False
            btnMyHomeOffCanvas.Visible = False
            btnWorkouts.Visible = False
            btnWorkoutsOffCanvas.Visible = False
            btnViewData.Visible = False
            btnViewDataOffCanvas.Visible = False
            'valid current user 
        Else
            'Greeting name is set to be the username
            'CurrentUserTxt.ForeColor = Drawing.Color.White
            UserImage.Visible = True
            CurrentUserTxt.Text = "Welcome, " + Session("username") + "."
            btnLogout.Visible = True
            btnLogoutOffCanvas.Visible = True

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
                btnCycleMng.Visible = False
                btnSports.Visible = False
                btnAccountsOffCanvas.Visible = False
                btnRosterOffCanvas.Visible = False
                btnCycleMngOffCanvas.Visible = False
                btnSportsOffCanvas.Visible = False

            ElseIf Session.Item("Role") = 3 Then
                'athletic trainer
                btnAccounts.Visible = False
                btnViewData.Visible = False
                btnSports.Visible = False
                btnAccountsOffCanvas.Visible = False
                btnViewDataOffCanvas.Visible = False
                btnSportsOffCanvas.Visible = False

            ElseIf Session.Item("Role") = 2 Then
                'coach
                btnAccounts.Visible = False
                btnSports.Text = "Teams"
                btnAccountsOffCanvas.Visible = False
                btnSportsOffCanvas.Text = "Teams"
                btnCycleMng.Text = "Cycle Mgt."
                btnCycleMngOffCanvas.Text = "Cycle Mgt."

            ElseIf Session.Item("Role") = 1 Then
                'systems admin
                btnViewData.Visible = False
                btnViewDataOffCanvas.Visible = False
                btnCycleMng.Text = "Cycle Mgt."
                btnCycleMngOffCanvas.Text = "Cycle Mgt."
            End If

        End If


    End Sub



    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        'deletes session and redirects to login page
        Session.Clear()
        Response.Redirect("Logout.aspx")
    End Sub



    'Home button click
    Protected Sub btnMyHome_Click(sender As Object, e As System.EventArgs) Handles btnMyHome.Click
        'Response.Redirect("LoginHome.aspx")
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
            Response.Redirect("AthleteSNW.aspx")

        ElseIf Session.Item("Role") = 3 Then
            'athletic trainer
            Response.Redirect("WorkoutSplash.aspx")

        ElseIf Session.Item("Role") = 2 Then
            'coach
            Response.Redirect("WorkoutSplash.aspx")

        ElseIf Session.Item("Role") = 1 Then
            'systems admin
            Response.Redirect("WorkoutSplash.aspx")

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

    Protected Sub btnCycleMng_Click(sender As Object, e As System.EventArgs) Handles btnCycleMng.Click
        Response.Redirect("SportsManagement.aspx")
        'any user-hidden
        'athlete-hidden

            If Session.Item("Role") = 3 Then
                'athletic trainer
                Response.Redirect("SportsManagement.aspx")

            ElseIf Session.Item("Role") = 2 Then
                'coach
                Response.Redirect("SportsManagement.aspx")

            ElseIf Session.Item("Role") = 1 Then
                'systems admin
                Response.Redirect("SportsManagement.aspx")
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

    Protected Sub UserImage_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles UserImage.Click
        Response.Redirect("EditProfileInfo.aspx")
    End Sub

    Protected Sub btnMyHomeOffCanvas_Click(sender As Object, e As System.EventArgs) Handles btnMyHomeOffCanvas.Click
        btnMyHome_Click(sender, e)
    End Sub

    Protected Sub btnAccountsOffCanvas_Click(sender As Object, e As System.EventArgs) Handles btnAccountsOffCanvas.Click
        btnAccounts_Click(sender, e)
    End Sub

    Protected Sub btnWorkoutsOffCanvas_Click(sender As Object, e As System.EventArgs) Handles btnWorkoutsOffCanvas.Click
        btnWorkouts_Click(sender, e)
    End Sub

    Protected Sub btnRosterOffCanvas_Click(sender As Object, e As System.EventArgs) Handles btnRosterOffCanvas.Click
        btnRoster_Click(sender, e)
    End Sub

    Protected Sub btnViewDataOffCanvas_Click(sender As Object, e As System.EventArgs) Handles btnViewDataOffCanvas.Click
        btnViewData_Click(sender, e)
    End Sub

    Protected Sub btnCycleMngOffCanvas_Click(sender As Object, e As System.EventArgs) Handles btnCycleMngOffCanvas.Click
        btnCycleMng_Click(sender, e)
    End Sub

    Protected Sub btnSportsOffCanvas_Click(sender As Object, e As System.EventArgs) Handles btnSportsOffCanvas.Click
        btnSports_Click(sender, e)
    End Sub

    Protected Sub btnLogoutOffCanvas_Click(sender As Object, e As System.EventArgs) Handles btnLogoutOffCanvas.Click
        btnLogout_Click(sender, e)
    End Sub
End Class

