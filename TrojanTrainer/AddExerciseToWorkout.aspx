<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="AddExerciseToWorkout.aspx.vb" Inherits="AddExerciseToWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        I want to be able to add exercises to the selected workout.</p>
    <p>
        &nbsp;</p>
    <p>
        Select a Workout:</p>
    <p>
        <asp:DropDownList ID="ddlWorkouts" runat="server" 
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
        <asp:Button ID="btnGetExercises" runat="server" Text="Get Exercises" />
    </p>
    <p>
        <asp:GridView ID="gvExercises" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            AllowSorting="True">
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
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlWorkouts" Name="Workout_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        Choose an exercise to add to the workout:</p>
    <p>
        <asp:DropDownList ID="ddlExercises" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="Name" 
            DataValueField="Planned_Ex_ID">
        </asp:DropDownList>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewExercisesNotInWorkout" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlWorkouts" Name="Workout_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="btnAddExercise" runat="server" Text="Add Exercise" />
    </p>

</asp:Content>

