﻿Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics


Partial Class _Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") > 3 Then
            Response.Redirect("Permissions.aspx")
        End If

        ''Gets workouts in a dictionary of dictionaries
        'Using connection As New SqlConnection(connectionString)
        '    Dim HasDone As Boolean = False
        '    If Page.IsPostBack Then
        '        HasDone = True
        '    End If
        '    'retrieves text from textboxes
        '    connection.Open()
        '    Dim CurrentWorkouts As SqlCommand = New SqlCommand("ViewWorkout", connection)
        '    Dim CurrentWorkoutReader As SqlDataReader
        '    'calls stored procedure to check user existance
        '    CurrentWorkouts.CommandType = CommandType.StoredProcedure
        '    'Input -- TM_ID, date
        '    CurrentWorkoutReader = CurrentWorkouts.ExecuteReader()
        '    'If selected date is empty
        '    If CurrentWorkoutReader.HasRows() Then
        '        Dim WorkoutsList = New List(Of Dictionary(Of String, String))()
        '        Do While CurrentWorkoutReader.Read()
        '            'Debug.Print(CurrentWorkoutReader("Workout_Name"))
        '            Dim WorkoutsDict As New Dictionary(Of String, String)
        '            WorkoutsDict.Add("Workout_ID", CurrentWorkoutReader("Workout_ID"))
        '            WorkoutsDict.Add("Workout_Name", CurrentWorkoutReader("Workout_Name"))
        '            WorkoutsDict.Add("Pre_Training_Notes", CurrentWorkoutReader("Pre_Training_Notes"))
        '            WorkoutsDict.Add("Post_Training_Notes", CurrentWorkoutReader("Post_Training_Notes"))
        '            WorkoutsDict.Add("Create_Date", CurrentWorkoutReader("Create_Date"))
        '            WorkoutsDict.Add("Assign_Date", CurrentWorkoutReader("Assign_Date"))
        '            WorkoutsDict.Add("Name", CurrentWorkoutReader("Name"))
        '            WorkoutsDict.Add("Cycle_ID", CurrentWorkoutReader("Cycle_ID"))
        '            WorkoutsDict.Add("Team_ID", CurrentWorkoutReader("Team_ID"))
        '            WorkoutsList.Add(WorkoutsDict)
        '        Loop
        '        For Each dictionaryy As Dictionary(Of String, String) In WorkoutsList
        '            For Each Pair In dictionaryy
        '                If Pair.Key = "Workout_Name" And HasDone = False Then

        '                    'Exercise_Name_Listbox.Items.Add(Pair.Value)

        '                    'Dim lbl1 As Label = New Label()
        '                    'lbl1.ForeColor = System.Drawing.Color.Black
        '                    'lbl1.ID = Pair.Value
        '                    'lbl1.CssClass = "Exercise"
        '                    'lbl1.Text = Pair.Value
        '                    'Me.Controls.Add(lbl1)

        '                End If
        '            Next

        '        Next
        '    End If

        'End Using







    End Sub

End Class