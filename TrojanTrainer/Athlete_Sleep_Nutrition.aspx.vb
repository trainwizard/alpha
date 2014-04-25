Imports System.Data.SqlClient
Imports System.Data
Imports System.Diagnostics

Partial Class Athlete_Sleep_Nutrition
    Inherits System.Web.UI.Page
    'Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    'Protected Sub Submit_Sleep_Click(sender As Object, e As System.EventArgs) Handles Submit_Sleep.Click


    Protected Sub SubmitNutrition_Click(sender As Object, e As System.EventArgs) Handles SubmitNutrition.Click
        'Using connection As New SqlConnection(connectionString)
        '    'connection is established
        '    connection.Open()

        '    Dim getTM_ID As SqlCommand = New SqlCommand("GetTM_ID", connection)
        '    'get current user's TM_ID for use in stored procedure
        '    getTM_ID.CommandType = CommandType.StoredProcedure
        '    getTM_ID.Parameters.Add(New SqlParameter("@current_user", Session("username")))

        '    'get specified date from the user
        '    Dim myDate As Date
        '    myDate = Calender.SelectedDate

        '    'get start / stop times
        '    'Dim startTime As ""


        '    'inserts nutrition information into the database
        '    Dim inputNutrition As SqlCommand = New SqlCommand("InputNutrition", connection)
        '    inputNutrition.Parameters.Add(New SqlParameter("TM_ID", getTM_ID))
        '    inputNutrition.Parameters.Add(New SqlParameter("Date", myDate))
        '    inputNutrition.Parameters.Add(New SqlParameter("Calories", txtCalories.Text))
        '    inputNutrition.Parameters.Add(New SqlParameter("Note", txtNotes.Text))
        '    inputNutrition.ExecuteNonQuery()



        'End Using
    End Sub


End Class
