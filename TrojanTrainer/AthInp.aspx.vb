Imports System.Diagnostics
Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim WorkoutID As String = Request.QueryString("ID")

    End Sub



    Protected Sub ExDdl_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ExDdl.SelectedIndexChanged
        VerificationLbl.Visible = False
        RepsLbl.Visible = False
        RepsTxt.Visible = False
        SetsLbl.Visible = False
        SetsTxt.Visible = False
        WeightLbl.Visible = False
        WeightTxt.Visible = False
        TimeLbl.Visible = False
        TimeTxt.Visible = False
        NoteLbl.Visible = False
        NoteTxt.Visible = False
        AddExerciseDataBtn.Visible = False
        ViewBtn.Visible = True
        RepsLbl0 .Visible = False 
    End Sub

    Protected Sub AddExerciseDataBtn_Click(sender As Object, e As System.EventArgs) Handles AddExerciseDataBtn.Click
        If RepsTxt.Text.Length > 0 Or SetsTxt.Text.Length > 0 Or WeightTxt.Text.Length > 0 Or TimeTxt.Text.Length > 0 Or NoteTxt.Text.Length > 0 Then
            If RepsTxt.Text IsNot "" And Integer.TryParse(RepsTxt.Text, Nothing) = False Then
                VerificationLbl.Text = "Please correct datatype errors (Numbers are needed)."
                VerificationLbl.Visible = True
            ElseIf SetsTxt.Text IsNot "" And Integer.TryParse(SetsTxt.Text, Nothing) = False Then
                VerificationLbl.Text = "Please correct datatype errors (Numbers are needed)."
                VerificationLbl.Visible = True
            ElseIf WeightTxt.Text IsNot "" And Integer.TryParse(WeightTxt.Text, Nothing) = False Then
                VerificationLbl.Text = "Please correct datatype errors (Numbers are needed)."
                VerificationLbl.Visible = True
            Else
                Using connection As New SqlConnection(connectionString)
                    connection.Open()
                    Dim insrtcmd As SqlCommand = New SqlCommand("AthleteInputWorkoutData", connection)
                    insrtcmd.CommandType = CommandType.StoredProcedure
                    insrtcmd.Parameters.Add(New SqlParameter("@TM_ID", Session.Item("TM_ID")))
                    insrtcmd.Parameters.Add(New SqlParameter("@Date", Session.Item("CurDate")))
                    insrtcmd.Parameters.Add(New SqlParameter("@Reps", RepsTxt.Text))
                    insrtcmd.Parameters.Add(New SqlParameter("@Sets", SetsTxt.Text))
                    insrtcmd.Parameters.Add(New SqlParameter("@Weight", WeightTxt.Text))
                    insrtcmd.Parameters.Add(New SqlParameter("@Time", TimeTxt.Text))
                    insrtcmd.Parameters.Add(New SqlParameter("@Note", NoteTxt.Text))
                    insrtcmd.Parameters.Add(New SqlParameter("@Intensity", ""))
                    insrtcmd.Parameters.Add(New SqlParameter("@Planned_Ex_ID", ExDdl.SelectedValue))
                    insrtcmd.ExecuteNonQuery()
                    connection.Close()
                    VerificationLbl.Text = "Exercise has been submitted"
                    VerificationLbl.ForeColor = Drawing.Color.Green
                    VerificationLbl.Visible = True
                    RepsLbl.Visible = False
                    RepsTxt.Visible = False
                    SetsLbl.Visible = False
                    SetsTxt.Visible = False
                    WeightLbl.Visible = False
                    WeightTxt.Visible = False
                    TimeLbl.Visible = False
                    TimeTxt.Visible = False
                    NoteLbl.Visible = False
                    NoteTxt.Visible = False
                    AddExerciseDataBtn.Visible = False
                End Using
            End If

        Else
            VerificationLbl.Text = "Please input some data."
            VerificationLbl.Visible = True
        End If
    End Sub

    Protected Sub ViewBtn_Click(sender As Object, e As System.EventArgs) Handles ViewBtn.Click
        Using connection As New SqlConnection(connectionString)
            'connection is established
            connection.Open()
            Dim Exreader As SqlDataReader
            'checks for returned user if true prints error message
            Dim Viewcmd As SqlCommand = New SqlCommand("ViewExerciseResults", connection)
            Viewcmd.CommandType = CommandType.StoredProcedure
            Viewcmd.Parameters.Add(New SqlParameter("@TM_ID", Session.Item("TM_ID")))
            Viewcmd.Parameters.Add(New SqlParameter("@Date", Session.Item("CurDate")))
            Viewcmd.Parameters.Add(New SqlParameter("@Planned_Ex_ID", ExDdl.SelectedValue))
            Exreader = Viewcmd.ExecuteReader()
            If Exreader.HasRows() Then
                RepsLbl0.Visible = True
                Do While Exreader.Read()
                    If Str(Exreader("Reps")) <> "" Or Str(Exreader("Reps")) <> Str(0) Then
                        RepsLbl.Visible = True
                        RepsTxt.Visible = True
                        RepsTxt.Text = Exreader("Reps")
                        RepsTxt.ReadOnly = True
                    End If
                    If Str(Exreader("Sets")) <> "" Or Str(Exreader("Sets")) <> Str(0) Then
                        SetsLbl.Visible = True
                        SetsTxt.Visible = True
                        SetsTxt.Text = Exreader("Sets")
                        SetsTxt.ReadOnly = True
                    End If
                    If Str(Exreader("Weight")) <> "" Or Str(Exreader("Weight")) <> Str(0) Then
                        WeightLbl.Visible = True
                        WeightTxt.Visible = True
                        WeightTxt.Text = Exreader("Weight")
                        WeightTxt.ReadOnly = True
                    End If
                    If Exreader("Time") <> "" Then
                        TimeLbl.Visible = True
                        TimeTxt.Visible = True
                        TimeTxt.Text = Exreader("Time")
                        TimeTxt.ReadOnly = True
                    End If
                    If Exreader("Note") <> "" Then
                        NoteLbl.Visible = True
                        NoteTxt.Visible = True
                        NoteTxt.Text = Exreader("Note")
                        NoteTxt.ReadOnly = True
                        NoteTxt.TextMode = TextBoxMode.MultiLine
                    End If
                Loop
                AddExerciseDataBtn.Visible = False
            Else
                RepsLbl.Visible = True
                RepsTxt.Visible = True
                RepsTxt.ReadOnly = False
                RepsTxt.Text = ""
                SetsLbl.Visible = True
                SetsTxt.Visible = True
                SetsTxt.ReadOnly = False
                SetsTxt.Text = ""
                WeightLbl.Visible = True
                WeightTxt.Visible = True
                WeightTxt.ReadOnly = False
                WeightTxt.Text = ""
                TimeLbl.Visible = True
                TimeTxt.Visible = True
                TimeTxt.ReadOnly = False
                TimeTxt.Text = ""
                NoteLbl.Visible = True
                NoteTxt.Visible = True
                NoteTxt.ReadOnly = False
                NoteTxt.Text = ""
                AddExerciseDataBtn.Visible = True
            End If
            ViewBtn.Visible = False
        End Using
    End Sub
End Class
