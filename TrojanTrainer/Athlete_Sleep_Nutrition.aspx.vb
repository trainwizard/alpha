Imports System.Data.SqlClient
Imports System.Data

Partial Class Athlete_Sleep_Nutrition
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    'Protected Sub Submit_Sleep_Click(sender As Object, e As System.EventArgs) Handles Submit_Sleep.Click

    'Using connection As New SqlConnection(connectionString)
    '    'conection is established
    '    connection.Open()

    '    Dim getTM_ID As SqlCommand = New SqlCommand("GetTM_ID", connection)
    '    Dim reader As SqlDataReader
    '    'get current user's TM_ID for use in stored procedure
    '    getTM_ID.CommandType = CommandType.StoredProcedure
    '    getTM_ID.Parameters.Add(New SqlParameter("@current_user", Session("username")))
    '    reader = getTM_ID.ExecuteReader()
    '    'get specified date from the user
    '    '//code goes here

    '    'inserts information into the database
    '    'Dim inputSleep As SqlCommand = New SqlCommand("InputSleep", connection)
    '    'inputSleep.Parameters.Add(New SqlParameter("TM_ID", reader))
    '    'inputSleep.Parameters.Add(New SqlParameter("date", myDate))
    '    'inputSleep.Parameters.Add(New SqlParameter("start_time", start_time))
    '    'inputSleep.Parameters.Add(NewSqlParameter("end_Time", end_time))

        End Using
    End Sub

    Protected Sub SubmitNutrition_Click(sender As Object, e As System.EventArgs) Handles Submit_Nutrition.Click
        
    End Sub
End Class
