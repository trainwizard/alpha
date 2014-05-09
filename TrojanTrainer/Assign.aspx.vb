Imports System.Data.SqlClient
Imports System.Data
Imports System.Diagnostics

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Public Class assignVariables
        Public Shared CalendarCount As Integer = 0
        Public Shared StopDate As New Date
        Public Shared StartDate As New Date
    End Class

    Sub CycleDayRender(source As Object, e As DayRenderEventArgs)

        ' Change the background color of the days in the month
        ' to yellow.
        If e.Day.Date < DateTime.Now Then
            e.Cell.BackColor = Drawing.Color.DimGray
            e.Day.IsSelectable = False
        ElseIf assignVariables.CalendarCount > 0 Then
            If e.Day.Date <= assignVariables.StopDate And e.Day.Date >= assignVariables.StartDate Then
                e.Day.IsSelectable = True
                e.Cell.BackColor = Drawing.Color.PaleGreen
            Else
                e.Day.IsSelectable = False
            End If
        Else
            e.Day.IsSelectable = False
        End If

    End Sub 'DayRender

    Protected Sub SportsDdl_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles SportsDdl.SelectedIndexChanged
        CycleDdl.DataBind()
        assignVariables.CalendarCount = 0
    End Sub

    Protected Sub CycleDdl_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles CycleDdl.SelectedIndexChanged
        assignVariables.CalendarCount = 0
    End Sub

    Protected Sub RetrieveCycleBtn_Click(sender As Object, e As System.EventArgs) Handles RetrieveCycleBtn.Click
        Using connection As New SqlConnection(connectionString)
            'retrieves text from textboxes
            connection.Open()
            Dim CycleDates As SqlCommand = New SqlCommand("ViewCycleDays", connection)
            CycleDates.Parameters.Add(New SqlParameter("@Cycle_ID", CycleDdl.SelectedValue))
            Dim CycleDayReader As SqlDataReader
            'calls stored procedure to check user existance
            CycleDates.CommandType = CommandType.StoredProcedure
            'Input -- TM_ID, date
            CycleDayReader = CycleDates.ExecuteReader()
            'If selected date is empty
            If CycleDayReader.HasRows() Then
                Do While CycleDayReader.Read()
                    assignVariables.StartDate = CycleDayReader("Start_Date")
                    assignVariables.StopDate = CycleDayReader("End_Date")
                Loop
                assignVariables.CalendarCount += 1
            End If
            connection.Close()
        End Using
    End Sub

    Protected Sub CycleCalendar_SelectionChanged(sender As Object, e As System.EventArgs) Handles CycleCalendar.SelectionChanged
        CurrentWorkoutsGv.DataBind()
    End Sub

    Protected Sub AssignBtn_Click(sender As Object, e As System.EventArgs) Handles AssignBtn.Click
        Using connection As New SqlConnection(connectionString)
            Dim AssignWorkoutSport As SqlCommand = New SqlCommand("AssignWorkoutSport", connection)
            AssignWorkoutSport.CommandType = CommandType.StoredProcedure
            AssignWorkoutSport.Parameters.Add(New SqlParameter("@Cycle_ID", CycleDdl.SelectedValue))
            AssignWorkoutSport.Parameters.Add(New SqlParameter("@Workout_ID", Workoutddl.SelectedValue))
            AssignWorkoutSport.Parameters.Add(New SqlParameter("@Start_Date", CycleCalendar.SelectedDate))
            AssignWorkoutSport.Parameters.Add(New SqlParameter("@End_Date", CycleCalendar.SelectedDate))
            connection.Open()
            AssignWorkoutSport.ExecuteNonQuery()
            connection.Close()

        End Using
    End Sub
End Class
