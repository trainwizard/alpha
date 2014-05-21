Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics



Partial Class _Default

    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") = 2 Then
            DropDownList1.SelectedValue = Session.Item("Sport_ID")
        ElseIf Session.Item("Role") > 3 Then
            Response.Redirect("Permissions.aspx")
        End If
        If Page.IsPostBack = False Then
            GlobalVariables.CalCount = 0
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        cycleGridview.DataBind()
    End Sub

    Public Class GlobalVariables
        Public Shared CalCount As Integer = 0
        Public Shared StopDate As New Date
        Public Shared StartDate As New Date
    End Class


    Sub DayRender(source As Object, e As DayRenderEventArgs)

        ' Change the background color of the days in the month
        ' to yellow.
        If e.Day.Date < DateTime.Now Then
            e.Day.IsSelectable = False
            e.Cell.BackColor = Drawing.Color.DimGray
        ElseIf GlobalVariables.CalCount > 1 Then
            If e.Day.Date <= GlobalVariables.StopDate Then
                If e.Day.Date >= GlobalVariables.StartDate Then
                    e.Day.IsSelectable = False
                    e.Cell.BackColor = Drawing.Color.LightGreen
                End If
            End If
            e.Day.IsSelectable = False
            'ElseIf GlobalVariables.CalCount = 0 Then
        End If

    End Sub 'DayRender 



    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        If GlobalVariables.StartDate <> Nothing And GlobalVariables.StopDate <> Nothing And CycleName.Text <> "" Then
            Using connection As New SqlConnection("Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh")
                Dim createCycle As New SqlCommand("createCycle", connection)
                createCycle.CommandType = CommandType.StoredProcedure
                createCycle.Parameters.AddWithValue("@Name", CycleName.Text)
                Debug.Print(DropDownList1.SelectedValue)
                createCycle.Parameters.AddWithValue("@Sport_ID", DropDownList1.SelectedValue)
                createCycle.Parameters.AddWithValue("@Start_Date", GlobalVariables.StartDate)
                createCycle.Parameters.AddWithValue("@End_Date", GlobalVariables.StopDate)
                connection.Open()
                createCycle.ExecuteNonQuery()
                connection.Close()
            End Using
            DateLabel.ForeColor = Drawing.Color.Black
            DateLabel.Text = "Please select a start date."
            GlobalVariables.StartDate = Nothing
            GlobalVariables.StopDate = Nothing
            GlobalVariables.CalCount = 0
            cycleGridview.DataBind()
            CycleName.Text = ""

        ElseIf GlobalVariables.StartDate = Nothing Or GlobalVariables.StopDate = Nothing Then
            DateLabel.ForeColor = Drawing.Color.Red
            DateLabel.Text = "Please select a start date."
            GlobalVariables.StartDate = Nothing
            GlobalVariables.StopDate = Nothing
            GlobalVariables.CalCount = 0
            StartDateCal.SelectedDates.Clear()
        ElseIf CycleName.Text = "" Then
            DateLabel.ForeColor = Drawing.Color.Red
            DateLabel.Text = "Please enter a name."
        End If
    End Sub

    Protected Sub StartDateCal_SelectionChanged(sender As Object, e As System.EventArgs) Handles StartDateCal.SelectionChanged
        If GlobalVariables.CalCount = 0 Then
            GlobalVariables.CalCount += 1
            GlobalVariables.StartDate = StartDateCal.SelectedDate
            DateLabel.ForeColor = Drawing.Color.Black
            DateLabel.Text = "Please select a cycle end date."
            Debug.Print(GlobalVariables.StartDate)
        ElseIf GlobalVariables.CalCount = 1 Then
            If StartDateCal.SelectedDate > GlobalVariables.StartDate Then
                GlobalVariables.CalCount += 1
                GlobalVariables.StopDate = StartDateCal.SelectedDate
                Debug.Print(GlobalVariables.StopDate)
                DateLabel.ForeColor = Drawing.Color.Black
                DateLabel.Text = "Please submit information."
            Else
                DateLabel.ForeColor = Drawing.Color.Red
                DateLabel.Text = "Your stop date wasn't after your start date, please select another start date."
                GlobalVariables.CalCount = 0
            End If
        End If
    End Sub

    Protected Sub ClearCalBtn_Click(sender As Object, e As System.EventArgs) Handles ClearCalBtn.Click
        GlobalVariables.StartDate = Nothing
        GlobalVariables.StopDate = Nothing
        GlobalVariables.CalCount = 0
        DateLabel.ForeColor = Drawing.Color.Black
        DateLabel.Text = "Please select a start date."
    End Sub

End Class
