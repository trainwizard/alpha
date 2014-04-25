
Partial Class AddExerciseToWorkout
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") > 3 Then
            Response.Redirect("Permissions.aspx")
        End If
        'ddlTeams.Enabled = False
        'btnSubmit.Visible = False
        'gvRoster.EnableViewState = False
        gvExercises.Visible = False
    End Sub


    Protected Sub btnGetExercises_Click(sender As Object, e As System.EventArgs) Handles btnGetExercises.Click

    End Sub
End Class
