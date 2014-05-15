Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class Roster
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") = 2 Then
            ddlSports.SelectedValue = Session.Item("Sport_ID")
        ElseIf Session.Item("Role") > 3 Then
            Response.Redirect("Permissions.aspx")
        End If
        'ddlTeams.Enabled = False
        'btnSubmit.Visible = False
        'gvRoster.EnableViewState = False
        gvRoster.Visible = False
        ddlTeams.Enabled = True
    End Sub

    Protected Sub ddlSports_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlSports.SelectedIndexChanged
        DataOutputSport.Visible = True
        gvRoster.Visible = False
        'ddlTeams.Items.Insert(0, New ListItem("All", -1
    End Sub

    Protected Sub ddlTeams_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlTeams.SelectedIndexChanged
        gvRoster.Visible = False
        'btnSubmit.Visible = True
    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click
        '    'gvRoster.EnableViewState = True
        gvRoster.Visible = True
        DataOutputSport.Visible = False
        gvRoster.DataBind()
    End Sub


    Protected Sub btnAddTeamMember_Click(sender As Object, e As System.EventArgs) Handles btnAddTeamMember.Click
        If ddlAddTeamMember.Attributes.Count <> 0 Then
            Using connection As New SqlConnection("Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh")
                Dim AddTeamMember As New SqlCommand("AddToTeam", connection)
                AddTeamMember.CommandType = CommandType.StoredProcedure
                AddTeamMember.Parameters.AddWithValue("@User_ID", ddlAddTeamMember.SelectedValue)
                AddTeamMember.Parameters.AddWithValue("@Team_ID", ddlTeams.SelectedValue)
                connection.Open()
                Dim rowsAffected As Integer = AddTeamMember.ExecuteNonQuery()
                Debug.Print(String.Format("Affected {0}row(s)", rowsAffected))
                connection.Close()
            End Using
            lblConfirm.Visible = True
        End If
    End Sub
End Class
