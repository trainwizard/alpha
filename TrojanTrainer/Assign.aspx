﻿<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Assign.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Current Sport:
        <asp:DropDownList ID="SportsDdl" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Sport_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" SelectCommand="SELECT Name, Sport_ID
FROM Sport
WHERE Active = 1"></asp:SqlDataSource>
    </p>
    <p>
        Select a cycle:
        <asp:DropDownList ID="CycleDdl" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Cycle_ID">
            <asp:ListItem Selected="True">--Choose--</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" SelectCommand="SELECT Name, Cycle_ID
FROM Cycle
WHERE Sport_ID = @Sport_ID AND End_Date &gt; (SELECT GETDATE())">
            <SelectParameters>
                <asp:ControlParameter ControlID="SportsDdl" Name="Sport_ID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="RetrieveCycleBtn" runat="server" Text="Get Cycle Dates" 
            CssClass="button small" />
    </p>
    <p>
        <asp:Calendar ID="CycleCalendar" runat="server" OnDayRender="CycleDayRender" 
            Visible="False">
            <SelectorStyle BackColor="#99FFCC" />
        </asp:Calendar>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewWorkout" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="SportsDdl" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" SelectCommand="SELECT Workout_Name, [Workout].Workout_ID, Sport.Name, Cycle_Workout.Cycle_Workout_ID
FROM Workout
INNER JOIN Cycle_Workout 
ON Cycle_Workout.Workout_ID = Workout.Workout_ID
INNER JOIN Cycle
ON Cycle.Cycle_ID = Cycle_Workout.Cycle_ID 
INNER Join Sport
ON Sport.Sport_ID = Cycle.Sport_ID
WHERE Cycle_Workout.Start_Date = @Start_Date AND Cycle_Workout.Cycle_ID  = @Cycle_ID" 
            DeleteCommand="DeleteActiveSportWorkout" DeleteCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Cycle_Workout_ID" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="CycleCalendar" Name="Start_Date" 
                    PropertyName="SelectedDate" />
                <asp:ControlParameter ControlID="CycleDdl" Name="Cycle_ID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="Workoutddl" runat="server" DataSourceID="SqlDataSource3" 
            DataTextField="Workout_Name" DataValueField="Workout_ID" Visible="False">
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="AssignementLbl" runat="server" Text="Assign to:" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="TeamDdl" runat="server" DataSourceID="SqlDataSource5" 
            DataTextField="Name" DataValueField="Team_ID" Visible="False">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" SelectCommand="SELECT Name, Team_ID
FROM Team
WHERE Sport_ID = @Sport_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="SportsDdl" Name="Sport_ID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="AssignTeamBtn" runat="server" Text="Team" 
            Visible="False" Width="85px" CssClass="button small" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AssignBtn" runat="server" Text="Sport" 
            Visible="False" Width="85px" CssClass="button small" />
    &nbsp;&nbsp;&nbsp;
        <asp:Label ID="DateValidator" runat="server" Text="Label" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:Label ID="CurrentLbl" runat="server" 
            Text="Currently Assigned for this day:" Visible="False"></asp:Label>
    </p>
    <asp:GridView ID="CurrentWorkoutssGv" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Cycle_Workout_ID" DataSourceID="SqlDataSource4" 
        Visible="False">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="Workout_Name" HeaderText="Workout Name" 
                SortExpression="Workout_Name" />
            <asp:BoundField DataField="Name" HeaderText="Sport" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <asp:GridView ID="CurrentWorkoutsGv" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Team_Workout_ID" DataSourceID="SqlDataSource6">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="Workout_Name" HeaderText="Workout Name" 
                SortExpression="Workout_Name" />
<asp:BoundField DataField="Name" HeaderText="Team" SortExpression="Name"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
        DeleteCommand="DeleteActiveTeamWorkout" SelectCommand="SELECT Workout_Name, [Workout].Workout_ID, [Team].Name, Team_Workout.Team_Workout_ID
FROM Workout
INNER JOIN Team_Workout
ON Team_Workout.Workout_ID = Workout.Workout_ID
INNER JOIN Team
ON Team.Team_ID = Team_Workout.Team_ID
WHERE Team_Workout.Start_Date = @Start_Date AND Team.Sport_ID = @Sport_ID" 
        DeleteCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Team_Workout_ID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CycleCalendar" Name="Start_Date" 
                PropertyName="SelectedDate" />
            <asp:ControlParameter ControlID="SportsDdl" Name="Sport_ID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

