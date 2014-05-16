Imports System.Diagnostics

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim WorkoutID As String = Request.QueryString("ID")
        Debug.Print(WorkoutID)
    End Sub

    Protected Sub ExDdl_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ExDdl.SelectedIndexChanged
        CurrentExDv.DataBind()

    End Sub
End Class
