Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Public Class GlobalVariables
    Public Shared CalCount As Integer = 0
    Public Shared StopDate As New Date
    Public Shared StartDate As New Date
End Class

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        cycleGridview.DataBind()


    End Sub



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
            DateLabel.Text = "Please select a start date."
            GlobalVariables.StartDate = Nothing
            GlobalVariables.StopDate = Nothing
            GlobalVariables.CalCount = 0
            cycleGridview.DataBind()
            CycleName.Text = ""

        ElseIf GlobalVariables.StartDate = Nothing Or GlobalVariables.StopDate = Nothing Then
            DateLabel.Text = "Please select a start date."
            GlobalVariables.StartDate = Nothing
            GlobalVariables.StopDate = Nothing
            GlobalVariables.CalCount = 0
        ElseIf CycleName.Text = "" Then
            DateLabel.Text = "Please enter a name."
        End If
    End Sub

    Protected Sub StartDateCal_SelectionChanged(sender As Object, e As System.EventArgs) Handles StartDateCal.SelectionChanged
        If GlobalVariables.CalCount = 0 Then
            GlobalVariables.CalCount += 1
            GlobalVariables.StartDate = StartDateCal.SelectedDate
            DateLabel.Text = "Please select a cycle end date."
            Debug.Print(GlobalVariables.StartDate)
        ElseIf GlobalVariables.CalCount = 1 Then
            If StartDateCal.SelectedDate > GlobalVariables.StartDate Then
                GlobalVariables.CalCount += 1
                GlobalVariables.StopDate = StartDateCal.SelectedDate
                Debug.Print(GlobalVariables.StopDate)
                DateLabel.Text = "Please submit information."
            Else
                DateLabel.Text = "Your stop date wasn't after your start date, please select another start date."
                GlobalVariables.CalCount = 0
            End If
        End If
    End Sub

    Protected Sub ClearCalBtn_Click(sender As Object, e As System.EventArgs) Handles ClearCalBtn.Click
        GlobalVariables.StartDate = Nothing
        GlobalVariables.StopDate = Nothing
        GlobalVariables.CalCount = 0
        DateLabel.Text = "Please select a start date."
    End Sub
End Class
