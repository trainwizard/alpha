Imports System.Data.SqlClient
Imports System.Data

Partial Class LoginHome
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        UserImage.ImageUrl = Session.Item("UserPicture")
    End Sub

    Protected Sub UserImage_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles UserImage.Click

    End Sub
End Class
