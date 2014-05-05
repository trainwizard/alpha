Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        cycleGridview.DataBind()


    End Sub



    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Using connection As New SqlConnection("Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh")
            Dim createCycle As New SqlCommand("createCycle", connection)
            createCycle.CommandType = CommandType.StoredProcedure
            createCycle.Parameters.AddWithValue("@Name", CycleName.Text)
            Debug.Print(DropDownList1.SelectedValue)
            createCycle.Parameters.AddWithValue("@Sport_ID", DropDownList1.SelectedValue)
            createCycle.Parameters.AddWithValue("@Start_Date", StartDateCal.SelectedDate)
            createCycle.Parameters.AddWithValue("@End_Date", StopDateCal.SelectedDate)
            connection.Open()
            createCycle.ExecuteNonQuery()
        End Using
    End Sub

    Protected Sub StartDateCal_SelectionChanged(sender As Object, e As System.EventArgs) Handles StartDateCal.SelectionChanged
    End Sub
End Class
