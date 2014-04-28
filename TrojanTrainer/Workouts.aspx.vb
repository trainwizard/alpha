
Partial Class Workouts
    Inherits System.Web.UI.Page

    Protected Sub btnCreateExercise_Click(sender As Object, e As System.EventArgs) Handles btnCreateExercise.Click
        Response.Redirect("CreateExercise.aspx")
    End Sub

    Protected Sub btnCreateWorkout_Click(sender As Object, e As System.EventArgs) Handles btnCreateWorkout.Click
        Response.Redirect("CreateWorkout.aspx")
    End Sub

    Protected Sub btnAddExercisetoWorkout_Click(sender As Object, e As System.EventArgs) Handles btnAddExerciseToWorkout.Click
        Response.Redirect("AddExerciseToWorkout.aspx")
    End Sub
End Class
