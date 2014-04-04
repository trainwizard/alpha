Imports System.Data.SqlClient
Imports System.Data

Partial Class main
    Inherits System.Web.UI.MasterPage
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("username") Is Nothing Then
            'Sends non-user back to homepage if they are trying to URL hack
            'Response.Redirect("Oops.aspx")

            CurrentUserTxt.Text = ""
            btnLogout.Visible = False
        Else
            'Greeting name is set to be the username
            CurrentUserTxt.Text = Session("username")
            btnLogout.Visible = True
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

    Protected Sub btnMyHome_Click(sender As Object, e As System.EventArgs) Handles btnMyHome.Click
        Response.Redirect("LoginHome.aspx")
    End Sub

    Protected Sub btnAccounts_Click(sender As Object, e As System.EventArgs) Handles btnAccounts.Click
        Response.Redirect("SystemsAdminAddAccount.aspx")
    End Sub

    Protected Sub btnWorkouts_Click(sender As Object, e As System.EventArgs) Handles btnWorkouts.Click
        Response.Redirect("Workouts.aspx")
    End Sub

    Protected Sub btnRoster_Click(sender As Object, e As System.EventArgs) Handles btnRoster.Click
        Response.Redirect("Roster.aspx")
    End Sub

    Protected Sub btnViewData_Click(sender As Object, e As System.EventArgs) Handles btnViewData.Click
        Response.Redirect("ViewData.aspx")
    End Sub

    Protected Sub btnInjury_Click(sender As Object, e As System.EventArgs) Handles btnInjury.Click
        Response.Redirect("Injury.aspx")
    End Sub

    Protected Sub btnSports_Click(sender As Object, e As System.EventArgs) Handles btnSports.Click
        Response.Redirect("SystemsAdminCreateSport.aspx")
    End Sub
End Class

