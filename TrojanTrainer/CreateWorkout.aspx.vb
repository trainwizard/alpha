
Partial Class CreateWorkout
    Inherits System.Web.UI.Page

    Sub CustomerDetail_ItemInserted(ByVal sender As Object, _
  ByVal e As DetailsViewInsertedEventArgs)
        ' Refresh the GridView control after a new record is inserted in 
        ' the DetailsView control.
        gvWorkouts.DataBind()
    End Sub

End Class
