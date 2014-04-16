<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Workouts.aspx.vb" Inherits="Workouts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Current Workout Information:</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout_Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Name" HeaderText="Cycle" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Name1" HeaderText="Team" 
                    SortExpression="Name1" />
                <asp:BoundField DataField="Pre_Training_Notes" HeaderText="Pre_Training_Notes" 
                    SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" HeaderText="Post_Training_Notes" 
                    SortExpression="Post_Training_Notes" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create_Date" 
                    SortExpression="Create_Date" />
                <asp:BoundField DataField="Assign_Date" 
                    HeaderText="Assign_Date" SortExpression="Assign_Date" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewWorkout" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="btnCreateWorkout" runat="server" Text="Create Workout" />
        <asp:Button ID="btnCreateExercise" runat="server" Text="Create Exercise" />
    </p>
</asp:Content>

