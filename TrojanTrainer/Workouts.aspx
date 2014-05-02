<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Workouts.aspx.vb" Inherits="Workouts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Current Workouts:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Name" HeaderText="Cycle" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Name1" HeaderText="Team" 
                    SortExpression="Name1" />
                <asp:BoundField DataField="Pre_Training_Notes" HeaderText="Pre Training Notes" 
                    SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" HeaderText="Post Training Notes" 
                    SortExpression="Post_Training_Notes" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create Date" 
                    SortExpression="Create_Date" />
                <asp:BoundField DataField="Assign_Date" 
                    HeaderText="Assign Date" SortExpression="Assign_Date" />
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
        Select a Workout to view or add Exercies:</p>
    <p>
        <asp:DropDownList ID="ddlWorkouts" runat="server" 
            DataSourceID="SqlDataSource2" DataTextField="Workout_Name" 
            DataValueField="Workout_ID" AutoPostBack="True" EnableViewState="False">
        </asp:DropDownList>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT [Workout_Name], [Workout_ID] FROM [Workout] WHERE Active = 1">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="gvExercises" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource4" 
            AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Exercise" SortExpression="Name" />
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout" 
                    SortExpression="Workout_Name" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewExercisesWithWorkout" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlWorkouts" Name="Workout_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </p>
    <p>
        <asp:Label ID="lblExerciseAdd" runat="server" Text="Select an Exercise to add" 
            Visible="False"></asp:Label>
    </p>

    <p>
        <asp:DropDownList ID="ddlExercises" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="Name" 
            DataValueField="Planned_Ex_ID" AutoPostBack="True" Visible="False">
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
        <asp:Button ID="btnAddExercise" runat="server" Text="Add Exercise" 
            Visible="False" />
   <%-- </p>

    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btnCreateWorkout" runat="server" Text="Create Workout" />
        <asp:Button ID="btnCreateExercise" runat="server" Text="Create Exercise" />
        <asp:Button ID="btnAddExerciseToWorkout" runat="server" 
            Text="Add Exercise to Workout" />
    </p>--%>
</asp:Content>

