Imports System.Data
Imports System.Data.SqlClient
Partial Class Account_Login
    Inherits System.Web.UI.Page
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs)
        Using connection As New SqlConnection(connectionString)
            Dim account As String = Username.Text
            Dim mypassword As String = Password.Text
            'Dim returnedPassword As String

            Dim sqlCommand As New  _
                SqlCommand("SELECT * FROM User WHERE @account AND @password", connection)
            connection.Open()
            Dim reader As SqlDataReader = sqlCommand.ExecuteReader()
            If reader.Read() Then
                Response.Redirect("https://google.com")
                'Dim returnedUsername As New String(reader("account"))
                'Dim returnedPassword As New String(reader("mypassword"))
            Else
                Response.Redirect("https://yahoo.com")
            End If

            'If account == returnedUsername && mypassword == returnedPassword Then
            'Response.Redirect("https://google.com")
            'Else
            'Response.Redirect("https://yahoo.com")
            'End If

        End Using

    End Sub

End Class