﻿Imports System.Data
Imports System.Data.SqlClient
Imports System.Diagnostics

Partial Class Roster
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session.Item("Role") > 3 Then
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


End Class
