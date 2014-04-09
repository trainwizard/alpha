Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class Roster
    Inherits System.Web.UI.Page

    Protected Sub ddlSports_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlSports.SelectedIndexChanged
        ddlTeams.Enabled = True
        'ddlTeams.Items.Insert(0, New ListItem("All", -1))
    End Sub

    Protected Sub ddlTeams_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlTeams.SelectedIndexChanged
        gvTeamRoster.Enabled = True
    End Sub

    Protected Sub btnShowAll_Click(sender As Object, e As System.EventArgs) Handles btnShowAll.Click
        gvSportRoster.Enabled = True
    End Sub
End Class
