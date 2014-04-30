Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class Workouts
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") > 3 Then
            Response.Redirect("Permissions.aspx")
        End If
        'gvExercises.Visible = False
    End Sub

    Protected Sub btnCreateExercise_Click(sender As Object, e As System.EventArgs) Handles btnCreateExercise.Click
        Response.Redirect("CreateExercise.aspx")
    End Sub

    Protected Sub btnCreateWorkout_Click(sender As Object, e As System.EventArgs) Handles btnCreateWorkout.Click
        Response.Redirect("CreateWorkout.aspx")
    End Sub

    'Protected Sub btnAddExercisetoWorkout_Click(sender As Object, e As System.EventArgs) Handles btnAddExerciseToWorkout.Click
    'Response.Redirect("AddExerciseToWorkout.aspx")
    'End Sub

    'Protected Sub ddlWorkouts_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlWorkouts.SelectedIndexChanged
    '    ddlExercises.Visible = False
    '    gvExercises.Visible = False
    '    btnAddExercise.Visible = False
    '    lblExerciseAdd.Visible = False
    '    ddlExercises.DataBind()
    'End Sub

    'Protected Sub btnGetExercises_Click(sender As Object, e As System.EventArgs) Handles btnGetExercises.Click
    '    ddlExercises.Visible = True
    '    gvExercises.Visible = True
    '    lblExerciseAdd.Visible = True
    '    btnAddExercise.Visible = True
    '    gvExercises.DataBind()
    'End Sub

    'Protected Sub btnAddExercise_Click(sender As Object, e As System.EventArgs) Handles btnAddExercise.Click
    '    Using connection As New SqlConnection("Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh")
    '        Dim AddExercise As New SqlCommand("Add_Exorcise_to_Workout", connection)
    '        AddExercise.CommandType = CommandType.StoredProcedure
    '        AddExercise.Parameters.AddWithValue("@Workout_ID", ddlWorkouts.SelectedValue)
    '        AddExercise.Parameters.AddWithValue("@Planned_Ex_ID", ddlExercises.SelectedValue)
    '        connection.Open()
    '        Dim rowsAffected As Integer = AddExercise.ExecuteNonQuery()
    '        Debug.Print(String.Format("Affected {0}row(s)", rowsAffected))
    '    End Using
    'End Sub

    Protected Sub btnAddExerciseToWorkout_Click(sender As Object, e As System.EventArgs) Handles btnAddExerciseToWorkout.Click
        Response.Redirect("AddExerciseToWorkout.aspx")
    End Sub
End Class
