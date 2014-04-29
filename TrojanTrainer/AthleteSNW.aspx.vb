Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics


Partial Class _Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub SubmitInfo_Click(sender As Object, e As System.EventArgs) Handles SubmitInfo.Click

        'gets checkbox information for meals
        Dim breakfast As Integer = 0
        Dim lunch As Integer = 0
        Dim dinner As Integer = 0
        For Each li As ListItem In Calories.Items
            If li.Selected Then
                Debug.Print(li.Value)
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
            Debug.Print(SleepLeng)
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
                    Debug.Print(DateInput)
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

                Else
                    'Error: date already completed
                    Debug.Print("date already complete")
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
        End If
        Debug.Print(Session.Item("UserPicture"))
    End Sub

    Protected Sub SelectDate_SelectionChanged(sender As Object, e As System.EventArgs) Handles SelectDate.SelectionChanged
        Dim DateInput As String = ""
        DateInput = SelectDate.SelectedDate
        Using connection As New SqlConnection(connectionString)
            'retrieves text from textboxes
            connection.Open()
            Dim CheckDay As SqlCommand = New SqlCommand("GetSNWInfo", connection)
            Dim Dayreader As SqlDataReader
            'calls stored procedure to check user existance
            CheckDay.CommandType = CommandType.StoredProcedure
            CheckDay.Parameters.Add(New SqlParameter("@TM_ID", Session.Item("TM_ID")))
            CheckDay.Parameters.Add(New SqlParameter("@Date", DateInput))
            Dayreader = CheckDay.ExecuteReader()
            'If selected date is empty
            If Dayreader.HasRows() Then
                DateValidator.ForeColor = Drawing.Color.Red
                DateValidator.Text = "Selected date has already been entered. Please Select another."
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
            Else
                DateValidator.Visible = False
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

            End If

        End Using


    End Sub
End Class
