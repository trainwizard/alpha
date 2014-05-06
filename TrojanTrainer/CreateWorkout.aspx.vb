
Partial Class CreateWorkout
    Inherits System.Web.UI.Page

    Sub CustomerDetail_ItemInserted(ByVal sender As Object, _
  ByVal e As DetailsViewInsertedEventArgs)
        ' Refresh the GridView control after a new record is inserted in 
        ' the DetailsView control.
        gvWorkouts.DataBind()
    End Sub

    Protected Sub btnWorkout_Click(sender As Object, e As System.EventArgs) Handles btnWorkout.Click
        lblWorkouts.Visible = True
        gvWorkouts.Visible = True
        lblAddWorkout.Visible = True
        dvInsertWorkout.Visible = True
        lblExercises.Visible = False
        gvExercises.Visible = False
        lblAddExercise.Visible = False
        dvInsertExercise.Visible = False
    End Sub

    Protected Sub btnExercise_Click(sender As Object, e As System.EventArgs) Handles btnExercise.Click
        lblExercises.Visible = True
        gvExercises.Visible = True
        lblAddExercise.Visible = True
        dvInsertExercise.Visible = True
        lblWorkouts.Visible = False
        gvWorkouts.Visible = False
        lblAddWorkout.Visible = False
        dvInsertWorkout.Visible = False
    End Sub
End Class
