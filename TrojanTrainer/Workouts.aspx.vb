Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class Workouts
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") > 3 Then
            Response.Redirect("Permissions.aspx")
        End If
        gvExercises.Visible = False

        'Gets workouts in a dictionary of dictionaries



        Using connection As New SqlConnection(connectionString)
            'retrieves text from textboxes
            connection.Open()
            Dim CurrentWorkouts As SqlCommand = New SqlCommand("ViewWorkout", connection)
            Dim CurrentWorkoutReader As SqlDataReader
            'calls stored procedure to check user existance
            CurrentWorkouts.CommandType = CommandType.StoredProcedure
            'Input -- TM_ID, date
            CurrentWorkoutReader = CurrentWorkouts.ExecuteReader()
            'If selected date is empty
            If CurrentWorkoutReader.HasRows() Then
                Dim WorkoutList As New ArrayList()
                Dim WorkoutsDict As New Dictionary(Of String, String)
                Do While CurrentWorkoutReader.Read()
                    'Debug.Print(CurrentWorkoutReader("Workout_Name"))
                    WorkoutsDict.Add("Workout_ID", CurrentWorkoutReader("Workout_ID"))
                    WorkoutsDict.Add("Workout_Name", CurrentWorkoutReader("Workout_Name"))
                    WorkoutsDict.Clear()
                Loop
                For Each pair In WorkoutsDict
                    ' Display Key and Value.
                    Debug.Print("{0}, {1}", pair.Key, pair.Value)
                Next
            End If

            End Using 







    End Sub

    'Protected Sub btnCreateExercise_Click(sender As Object, e As System.EventArgs) Handles btnCreateExercise.Click
    '    Response.Redirect("CreateExercise.aspx")
    'End Sub

    'Protected Sub btnCreateWorkout_Click(sender As Object, e As System.EventArgs) Handles btnCreateWorkout.Click
    '    Response.Redirect("CreateWorkout.aspx")
    'End Sub

    'Protected Sub btnAddExercisetoWorkout_Click(sender As Object, e As System.EventArgs) Handles btnAddExerciseToWorkout.Click
    '    Response.Redirect("AddExerciseToWorkout.aspx")
    'End Sub

    Protected Sub ddlWorkouts_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlWorkouts.SelectedIndexChanged
        ddlExercises.Visible = True
        gvExercises.Visible = True
        lblExerciseAdd.Visible = True
        btnAddExercise.Visible = True
        gvExercises.DataBind()
    End Sub


    Protected Sub btnAddExercise_Click(sender As Object, e As System.EventArgs) Handles btnAddExercise.Click
        Using connection As New SqlConnection("Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh")
            Dim AddExercise As New SqlCommand("Add_Exorcise_to_Workout", connection)
            AddExercise.CommandType = CommandType.StoredProcedure
            AddExercise.Parameters.AddWithValue("@Workout_ID", ddlWorkouts.SelectedValue)
            AddExercise.Parameters.AddWithValue("@Planned_Ex_ID", ddlExercises.SelectedValue)
            connection.Open()
            Dim rowsAffected As Integer = AddExercise.ExecuteNonQuery()
            Debug.Print(String.Format("Affected {0}row(s)", rowsAffected))
        End Using
        gvExercises.DataBind()
        ddlExercises.DataBind()
    End Sub


End Class
