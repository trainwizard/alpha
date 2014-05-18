Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics


Partial Class _Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Public Class AthleteCurrentDate
        Public Shared AthDate As New Date
    End Class

    Protected Sub SubmitInfo_Click(sender As Object, e As System.EventArgs) Handles SubmitInfo.Click
        'gets checkbox information for meals
        Dim breakfast As Integer = 0
        Dim lunch As Integer = 0
        Dim dinner As Integer = 0
        For Each li As ListItem In Calories.Items
            If li.Selected Then
                If li.Value = "Breakfast" Then
                    breakfast = 1
                ElseIf li.Value = "Lunch" Then
                    lunch = 1
                ElseIf li.Value = "Dinner" Then
                    dinner = 1
                End If
            End If
        Next

        If AMPMButtons.SelectedValue = "" Or PreWeight.Text = "" Then
            DateValidator.Text = "Please Complete all fields."
            DateValidator.ForeColor = Drawing.Color.Red
            DateValidator.Visible = True
            SubmitInfo.Visible = True
            SleepLabel.Visible = True
            NutritionLabel.Visible = True
            WeightLabel.Visible = True
            BedTimeH.Visible = True
            BedTimeM.Visible = True
            AMPMButtons.Visible = True
            NumHours.Visible = True
            Calories.Visible = True
            NutritionNote.Visible = True
            PreWeight.Visible = True
        Else
            'Gets INfo from the page and puts it into ready variables
            'Gets specified date
            Dim DateInput As String = ""
            DateInput = SelectDate.SelectedDate
            'Gets the time the athlete fell asleep
            Dim SleepTime As String = ""
            Dim SleepHourNum As Integer = BedTimeH.SelectedValue
            Dim SleepHourStr As String = ""
            Dim SleepMin As Integer = BedTimeM.SelectedValue
            'converts selected time to military format
            If AMPMButtons.SelectedValue = "PM" Then
                SleepHourNum = SleepHourNum + 12
                SleepHourStr = CStr(SleepHourNum)
            ElseIf SleepHourNum < 10 Then
                SleepHourStr = "0" + CStr(SleepHourNum)
            Else
                SleepHourStr = CStr(SleepHourNum)
            End If
            'adds on the selected hour and minute to sleeptime
            If SleepMin = 0 Then
                SleepTime = SleepHourStr + ":00"
            Else
                SleepTime = SleepHourStr + ":" + CStr(SleepMin)
            End If
            'adds hours to a variable
            Dim SleepLeng As Integer
            SleepLeng = NumHours.SelectedValue
            'adds nutrition info to a variable
            Dim NutritionNotes As String = NutritionNote.Text
            'adds weight info into variable
            Dim CurWeight As Integer = PreWeight.Text

            'checks the current date
            Using connection As New SqlConnection(connectionString)
                'retrieves text from textboxes
                connection.Open()
                Dim cmd As SqlCommand = New SqlCommand("GetSNWInfo", connection)
                Dim reader As SqlDataReader
                'calls stored procedure to check user existance
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New SqlParameter("@TM_ID", Session.Item("TM_ID")))
                cmd.Parameters.Add(New SqlParameter("@Date", DateInput))
                reader = cmd.ExecuteReader()
                'If selected date is empty
                If reader.HasRows() = False Then
                    reader.Close()
                    reader = Nothing
                    'uses stored procedure called UserActive to set Active to be equal to 1
                    Dim inputSNW As SqlCommand = New SqlCommand("InputSNWInfo", connection)
                    inputSNW.CommandType = CommandType.StoredProcedure
                    inputSNW.Parameters.Add(New SqlParameter("@TM_ID", Int(Session.Item("TM_ID"))))
                    inputSNW.Parameters.Add(New SqlParameter("@date", DateInput))
                    inputSNW.Parameters.Add(New SqlParameter("@bedtime", SleepTime))
                    inputSNW.Parameters.Add(New SqlParameter("@hours", SleepLeng))
                    inputSNW.Parameters.Add(New SqlParameter("@breakfast", breakfast))
                    inputSNW.Parameters.Add(New SqlParameter("@lunch", lunch))
                    inputSNW.Parameters.Add(New SqlParameter("@dinner", dinner))
                    inputSNW.Parameters.Add(New SqlParameter("@note", NutritionNotes))
                    inputSNW.Parameters.Add(New SqlParameter("@weight", CurWeight))
                    inputSNW.ExecuteNonQuery()
                    DateValidator.ForeColor = Drawing.Color.Green
                    DateValidator.Text = "Information has been saved."
                    DateValidator.Visible = True
                    SubmitInfo.Visible = False
                    SleepLabel.Visible = False
                    NutritionLabel.Visible = False
                    WeightLabel.Visible = False
                    BedTimeH.Visible = False
                    BedTimeM.Visible = False
                    AMPMButtons.Visible = False
                    NumHours.Visible = False
                    Calories.Visible = False
                    NutritionNote.Visible = False
                    PreWeight.Visible = False
                    HoursSleptLabel.Visible = False
                    MealNoteLabel.Visible = False
                Else
                    'Error: date already completed

                End If

            End Using


        End If


    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") <> 4 Then
            Response.Redirect("Permissions.aspx")
        Else
            DateValidator.ForeColor = Drawing.Color.Black
            SubmitInfo.Visible = False
            SleepLabel.Visible = False
            NutritionLabel.Visible = False
            WeightLabel.Visible = False
            BedTimeH.Visible = False
            BedTimeM.Visible = False
            AMPMButtons.Visible = False
            NumHours.Visible = False
            Calories.Visible = False
            NutritionNote.Visible = False
            PreWeight.Visible = False
            HoursSleptLabel.Visible = False
            MealNoteLabel.Visible = False
        End If
    End Sub

    Protected Sub SelectDate_SelectionChanged(sender As Object, e As System.EventArgs) Handles SelectDate.SelectionChanged
        DateValidator.Text = "Please select an option below."
        DateValidator.Visible = True
        SubmitInfo.Visible = False
        SleepLabel.Visible = False
        NutritionLabel.Visible = False
        WeightLabel.Visible = False
        BedTimeH.Visible = False
        BedTimeM.Visible = False
        AMPMButtons.Visible = False
        NumHours.Visible = False
        Calories.Visible = False
        NutritionNote.Visible = False
        PreWeight.Visible = False
        BedtimeOutput.Visible = False
        HoursOutput.Visible = False
        MealsOutput.Visible = False
        NutritionLabel.Visible = False
        NotesOutput.Visible = False
        WeightOutput.Visible = False
        dvTeams.Visible = False
        dvSports.Visible = False
        btnBeginWorkout.Visible = False
        'TeamGv.Visible = False
        'SportsGv.Visible = False
    End Sub

    Protected Sub Nutrition_Click(sender As Object, e As System.EventArgs) Handles Nutrition.Click


        dvTeams.Visible = False
        dvSports.Visible = False
        btnBeginWorkout.Visible = False
        'TeamGv.Visible = False
        'SportsGv.Visible = False

        Dim DateInput As String = ""
        DateInput = SelectDate.SelectedDate
        Using connection As New SqlConnection(connectionString)
            'retrieves text from textboxes
            connection.Open()
            Dim CheckDay As SqlCommand = New SqlCommand("GetSNWInfo", connection)
            Dim Dayreader As SqlDataReader
            'calls stored procedure to check user existance
            CheckDay.CommandType = CommandType.StoredProcedure
            'Input -- TM_ID, date
            CheckDay.Parameters.Add(New SqlParameter("@TM_ID", Session.Item("TM_ID")))
            CheckDay.Parameters.Add(New SqlParameter("@Date", DateInput))
            Dayreader = CheckDay.ExecuteReader()
            'If selected date is empty
            If Dayreader.HasRows() Then

                'Error: date already completed

                DateValidator.ForeColor = Drawing.Color.Black
                DateValidator.Text = "Selected date has already been entered."

                DateValidator.Visible = True
                SubmitInfo.Visible = False
                SleepLabel.Visible = False
                NutritionLabel.Visible = False
                WeightLabel.Visible = False
                BedTimeH.Visible = False
                BedTimeM.Visible = False
                AMPMButtons.Visible = False
                NumHours.Visible = False
                Calories.Visible = False
                NutritionNote.Visible = False
                PreWeight.Visible = False


                'Output -- Bedtime, Hours, Breakfast, Lunch, Dinner, Note, Weight
                Dim previousData As New ArrayList()
                Do While Dayreader.Read()
                    previousData.Add(Dayreader("bedtime"))
                    previousData.Add(Dayreader("Hours"))
                    previousData.Add(Dayreader("Breakfast"))
                    previousData.Add(Dayreader("Lunch"))
                    previousData.Add(Dayreader("Dinner"))
                    previousData.Add(Dayreader("Note"))
                    previousData.Add(Dayreader("Weight"))
                Loop

                For Each item As String In previousData
                    Debug.Print(item)
                Next

                'Shows the results
                BedtimeOutput.Text = "Here is your information: <br/><br/>" + "Bedtime: " + previousData(0)
                BedtimeOutput.Visible = True
                HoursOutput.Text = "<br/>Number of hours slept:" + Str(previousData(1))
                HoursOutput.Visible = True
                Dim Meals As String = ""
                If previousData(2) + previousData(3) + previousData(4) > 0 Then
                    If previousData(2) > 0 Then
                        Meals = Meals + "Breakfast"
                    End If
                    'lunch
                    If previousData(3) > 0 And Meals = "" Then
                        Meals = Meals + "Lunch"
                    ElseIf previousData(3) > 0 Then
                        Meals = Meals + ", " + "Lunch"
                    End If
                    'dinner
                    If previousData(4) > 0 And Meals = "" Then
                        Meals = Meals + "Dinner"
                    ElseIf previousData(4) > 0 Then
                        Meals = Meals + ", " + "Dinner"
                    End If
                Else
                    Meals = "none"
                End If
                MealsOutput.Text = "<br/>Meals eaten: " + Meals
                MealsOutput.Visible = True
                If previousData(5) = "" Then
                    NotesOutput.Text = "<br/>Nutrition notes: " + "none"
                Else
                    NotesOutput.Text = "<br/>Nutrition notes: " + previousData(5)
                End If
                NotesOutput.Visible = True
                WeightOutput.Text = "<br/>Weight: " + Str(previousData(6)) + " lbs."
                WeightOutput.Visible = True
            Else
                DateValidator.Text = "Please enter data for this day."
                DateValidator.Visible = True

                SubmitInfo.Visible = True
                SleepLabel.Visible = True
                NutritionLabel.Visible = True
                WeightLabel.Visible = True
                BedTimeH.Visible = True
                BedTimeM.Visible = True
                AMPMButtons.Visible = True
                NumHours.Visible = True
                Calories.Visible = True
                NutritionNote.Visible = True
                PreWeight.Visible = True
                HoursSleptLabel.Visible = True
                MealNoteLabel.Visible = True
                BedtimeOutput.Visible = False
                HoursOutput.Visible = False
                MealsOutput.Visible = False
                NutritionLabel.Visible = False
                NotesOutput.Visible = False
                WeightOutput.Visible = False
            End If
        End Using
    End Sub

    Protected Sub WorkoutBtn_Click(sender As Object, e As System.EventArgs) Handles WorkoutBtn.Click
        Session.Item("CurDate") = SelectDate.SelectedDate
        Debug.Print(Session.Item("CurDate"))
        Debug.Print("Devin is as cool as Rassi")
        dvTeams.DataBind()
        dvSports.DataBind()
        SubmitInfo.Visible = False
        SleepLabel.Visible = False
        NutritionLabel.Visible = False
        WeightLabel.Visible = False
        BedTimeH.Visible = False
        BedTimeM.Visible = False
        AMPMButtons.Visible = False
        NumHours.Visible = False
        Calories.Visible = False
        NutritionNote.Visible = False
        PreWeight.Visible = False
        BedtimeOutput.Visible = False
        HoursOutput.Visible = False
        MealsOutput.Visible = False
        NutritionLabel.Visible = False
        NotesOutput.Visible = False
        WeightOutput.Visible = False

        dvTeams.Visible = True
        dvSports.Visible = True
        btnBeginWorkout.Visible = True

        Dim TeamCount As Integer = dvTeams.Rows.Count
        Dim SportCount As Integer = dvSports.Rows.Count
        If TeamCount > 0 Then
            dvSports.Visible = False
            dvTeams.Visible = True
        ElseIf SportCount > 0 Then
            dvTeams.Visible = False
            dvSports.Visible = True
        ElseIf SportCount = 0 And TeamCount = 0 Then
            Debug.Print("there aint nothin today")
            dvSports.Visible = False
            dvTeams.Visible = False
            btnBeginWorkout.Visible = False
            DateValidator.Text = "There is no workout for this day."
        End If
    End Sub


    Protected Sub btnBeginWorkout_Click(sender As Object, e As System.EventArgs) Handles btnBeginWorkout.Click

        If dvTeams.Visible = True Then
            '    Dim WorkID As Label = dvTeams.FindControl("Workout_ID")
            '    Dim StringWorkID As String = WorkID.Text
            '    Debug.Print(StringWorkID).
            Dim currentID As String = ""
            Using connection As New SqlConnection(connectionString)
                connection.Open()
                Dim getWorkoutID As SqlCommand = New SqlCommand("GetTeamWorkoutID", connection)
                Dim IDReader As SqlDataReader
                'calls stored procedure to check user existance
                getWorkoutID.CommandType = CommandType.StoredProcedure
                'Input -- TM_ID, date
                getWorkoutID.Parameters.Add(New SqlParameter("@User_ID", Session.Item("username")))
                getWorkoutID.Parameters.Add(New SqlParameter("@Start_Date", SelectDate.SelectedDate))
                IDReader = getWorkoutID.ExecuteReader()
                Do While IDReader.Read()
                    currentID = IDReader("Workout_ID")
                Loop
                connection.Close()
            End Using
            Debug.Print("Why this no work?")
            Debug.Print(currentID)
            Response.Redirect("AthInp.aspx" + "?ID=" + currentID)
        ElseIf dvSports.Visible = True Then
            '    Dim WorkID As Label = dvTeams.FindControl("Workout_ID")
            '    Dim StringWorkID As String = WorkID.Text
            '    Debug.Print(StringWorkID)
            Dim currentID As String = ""
            Using connection As New SqlConnection(connectionString)
                connection.Open()
                Dim getWorkoutID As SqlCommand = New SqlCommand("GetSportWorkoutID", connection)
                Dim IDReader As SqlDataReader
                'calls stored procedure to check user existance
                getWorkoutID.CommandType = CommandType.StoredProcedure
                'Input -- TM_ID, date
                getWorkoutID.Parameters.Add(New SqlParameter("@User_ID", Session.Item("username")))
                getWorkoutID.Parameters.Add(New SqlParameter("@Start_Date", SelectDate.SelectedDate))
                IDReader = getWorkoutID.ExecuteReader()
                Do While IDReader.Read()
                    currentID = IDReader("Workout_ID")
                Loop
                connection.Close()
            End Using
            Debug.Print(currentID)
            Response.Redirect("AthInp.aspx" + "?ID=" + currentID)
        End If

    End Sub
End Class
