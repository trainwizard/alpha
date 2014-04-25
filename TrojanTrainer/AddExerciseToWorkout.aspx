<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="AddExerciseToWorkout.aspx.vb" Inherits="AddExerciseToWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;I want to show all exercises for a workout. And be able to choose which workout 
        I am looking at.</p>
    <p>
        &nbsp;</p>
    <p>
        Select a Workout:</p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="Workout_Name" 
            DataValueField="Workout_ID">
        </asp:DropDownList>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT [Workout_Name], [Workout_ID] FROM [Workout] WHERE Active = 1">
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btnGetExercises" runat="server" Text="Get Exercises" />
    </p>
    <p>
        <asp:GridView ID="gvExercises" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Exercise" SortExpression="Name" />
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout" 
                    SortExpression="Workout_Name" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewExercisesWithWorkout" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
    </p>

</asp:Content>

