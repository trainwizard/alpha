Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class AddExerciseToWorkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") > 3 Then
            Response.Redirect("Permissions.aspx")
        End If
        gvExercises.Visible = False
        ddlWorkouts.Enabled = True
        'ddlExercises.Enabled = False
    End Sub

    Protected Sub ddlWorkouts_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlWorkouts.SelectedIndexChanged
        gvExercises.Visible = False
        ddlExercises.Enabled = True
    End Sub

    Protected Sub btnGetExercises_Click(sender As Object, e As System.EventArgs) Handles btnGetExercises.Click
        gvExercises.Visible = True
        gvExercises.DataBind()
    End Sub

End Class
