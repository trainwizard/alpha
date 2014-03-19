Imports System.Data
Imports System.Data.SqlClient

Partial Class Account_Login
    Dim connectionString As String = "Data Source=SIMON;Initial Catalog=AlphaSYS39414;Persist Security Info=True;User ID=sbolds;Password=ttpfrzeh"
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As System.EventArgs)
        
        Using connection As New SqlConnection(connectionString)
            Dim account As String
            Dim mypassword As String
            Dim returnedUsername As String
            Dim returnedPassword As String

            account = Username.Text
            mypassword = Password.Text

            Dim sqlCommand As New  _
                SqlCommand("SELECT * FROM User WHERE @account AND @password", connection)
            connection.Open()
            Dim reader As SqlDataReader = sqlCommand.ExecuteReader()
            While reader.Read()
                Dim returnedUsername As New String(reader("account"))
                Dim returnedPassword As New String(reader("mypassword"))
            End While

            If account == returnedUsername && mypassword == returnedPassword Then
                Response.Redirect("https://google.com")
            Else
                Response.Redirect("https://yahoo.com")
            End If

        End Using

    End Sub

End Class