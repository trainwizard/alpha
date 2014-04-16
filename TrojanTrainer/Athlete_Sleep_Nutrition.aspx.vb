Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Submit_Sleep_Click(sender As Object, e As System.EventArgs) Handles Submit_Sleep.Click
        'Using connection As New SqlConnection(connectionString)

        'End Using
        'Dim myDate As Date =
        testLabel.Text = SleepCalender.SelectedDate
    End Sub

    Protected Sub SubmitNutrition_Click(sender As Object, e As System.EventArgs) Handles SubmitNutrition.Click
        Dim Calories As Integer = Convert.ToInt32(txtCalories.Text)
        testLabel2.Text = CStr(Calories)
    End Sub
End Class
