Imports System.Diagnostics

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim WorkoutID As String = Request.QueryString("ID")
        Debug.Print(Session.Item("TM_ID"))
        Debug.Print((DetailsView1.Rows.Count))
        'If DetailsView1.Rows.Count > 1 Then
        '    DetailsView1.ChangeMode(DetailsViewMode.ReadOnly)
        '    DetailsView1.AutoGenerateInsertButton = False
        'Else
        '    DetailsView1.ChangeMode(DetailsViewMode.Insert)
        'End If
    End Sub

    Protected Sub ExDdl_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ExDdl.SelectedIndexChanged
        CurrentExDv.DataBind()
    End Sub
End Class
