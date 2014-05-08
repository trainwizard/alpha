<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="CreateWorkout.aspx.vb" Inherits="CreateWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Current Sport:&nbsp;&nbsp;
        <asp:DropDownList ID="Sportsddl" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource3" DataTextField="Name" 
            DataValueField="Sport_ID">
        </asp:DropDownList>
        </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT * 
FROM [Sport] 
WHERE [Active] = 1">
        </asp:SqlDataSource>
    </p>
    <p>
        Create Workout or Exercise</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="btnWorkout" runat="server" Text="Modify Workouts" />
        <asp:Button ID="btnExercise" runat="server" Text="Create Exercise" />
    </p>
    <p>
        <asp:Label ID="lblWorkouts" runat="server" Text="Current workouts:" 
            Visible="False"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="gvWorkouts" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" DataKeyNames="Workout_ID" Visible="False">
            <Columns>
                <asp:BoundField DataField="Workout_ID" HeaderText="Workout_ID" 
                    SortExpression="Workout_ID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="Workout_Name" 
                    HeaderText="Workout_Name" SortExpression="Workout_Name" />
                <asp:BoundField DataField="Pre_Training_Notes" HeaderText="Pre_Training_Notes" 
                    SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" HeaderText="Post_Training_Notes" 
                    SortExpression="Post_Training_Notes" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create_Date" 
                    SortExpression="Create_Date" />
                <asp:BoundField DataField="Assign_Date" HeaderText="Assign_Date" 
                    SortExpression="Assign_Date" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Cycle_ID" HeaderText="Cycle_ID" 
                    SortExpression="Cycle_ID" />
                <asp:BoundField DataField="Name1" HeaderText="Name1" SortExpression="Name1" />
                <asp:BoundField DataField="Team_ID" HeaderText="Team_ID" 
                    SortExpression="Team_ID" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewWorkout" 
            
            UpdateCommand="UpdateWorkout" SelectCommandType="StoredProcedure" 
            UpdateCommandType="StoredProcedure" DeleteCommand="DeleteWorkout" 
            DeleteCommandType="StoredProcedure" InsertCommand="CreateWorkout" 
            InsertCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Workout_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Workout_Name" Type="String" />
                <asp:Parameter Name="Pre_Training_Notes" Type="String" />
                <asp:Parameter Name="Post_Training_Notes" Type="String" />
                <asp:Parameter Name="Sport_ID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="Sportsddl" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Workout_ID" Type="Int32" />
                <asp:Parameter Name="Workout_Name" Type="String" />
                <asp:Parameter Name="Team_ID" Type="Int32" />
                <asp:Parameter Name="Cycle_ID" Type="Int32" />
                <asp:Parameter Name="Pre_Training_Notes" Type="String" />
                <asp:Parameter Name="Post_Training_Notes" Type="String" />
                <asp:Parameter DbType="Date" Name="Create_Date" />
                <asp:Parameter DbType="Date" Name="Assign_Date" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="lblAddWorkout" runat="server" Text="Add a workout:" 
            Visible="False"></asp:Label>
    </p>
    <p>
        <asp:DetailsView ID="dvInsertWorkout" runat="server" AutoGenerateRows="False" 
            DataSourceID="SqlDataSource4" Height="209px" Width="501px" 
            DataKeyNames="Workout_ID" DefaultMode="Insert" Visible="False">
            <Fields>
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout_Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Pre_Training_Notes" 
                    HeaderText="Pre_Training_Notes" SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" 
                    HeaderText="Post_Training_Notes" SortExpression="Post_Training_Notes" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            InsertCommand="CreateWorkout" InsertCommandType="StoredProcedure" 
            SelectCommand="ViewWorkout" SelectCommandType="StoredProcedure" 
            <InsertParameters>
                <asp:Parameter Name="Workout_Name" Type="String" />
                <asp:Parameter Name="Pre_Training_Notes" Type="String" />
                <asp:Parameter Name="Post_Training_Notes" Type="String" />
                <asp:ControlParameter Name="Sport_ID" ControlID="Sportsddl" PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="Sportsddl" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="lblExercises" runat="server" Text="Current exercises:" 
            Visible="False"></asp:Label>
    </p>
        <asp:GridView ID="gvExercises" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Planned_Ex_ID" 
            DataSourceID="SqlDataSource2" Visible="False">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Reps" HeaderText="Reps" SortExpression="Reps" />
                <asp:BoundField DataField="Sets" HeaderText="Sets" SortExpression="Sets" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" 
                    SortExpression="Weight" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Intensity" HeaderText="Intensity" 
                    SortExpression="Intensity" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            DeleteCommand="UPDATE [Planned_Exercise] 
SET Active = 0
WHERE [Planned_Ex_ID] = @Planned_Ex_ID" 
            InsertCommand="INSERT INTO [Planned_Exercise] ([Name], [Reps], [Sets], [Weight], [Time], [Intensity], [Note], [Active]) VALUES (@Name, @Reps, @Sets, @Weight, @Time, @Intensity, @Note, 1)" 
            SelectCommand="SELECT [Name], [Reps], [Sets], [Weight], [Time], [Intensity], [Note], [Planned_Exercise].Planned_Ex_ID
FROM [Planned_Exercise]
INNER JOIN Sport_Planned_Exercise 
ON Planned_Exercise.Planned_Ex_ID = Sport_Planned_Exercise.Planned_Ex_ID 
WHERE Sport_Planned_Exercise.Sport_ID = @Sport_ID" 
            
        UpdateCommand="UPDATE [Planned_Exercise] 
SET [Name] = @Name, [Reps] = @Reps, [Sets] = @Sets, [Weight] = @Weight, [Time] = @Time, [Intensity] = @Intensity, [Note] = @Note 
WHERE [Planned_Ex_ID] = @Planned_Ex_ID">
            <DeleteParameters>
                <asp:Parameter Name="Planned_Ex_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Reps" Type="Int32" />
                <asp:Parameter Name="Sets" Type="Int32" />
                <asp:Parameter Name="Weight" Type="Double" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="Intensity" Type="Double" />
                <asp:Parameter Name="Note" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="Sportsddl" Name="Sport_ID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Reps" Type="Int32" />
                <asp:Parameter Name="Sets" Type="Int32" />
                <asp:Parameter Name="Weight" Type="Double" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="Intensity" Type="Double" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="Planned_Ex_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    <asp:Label ID="lblAddExercise" runat="server" Text="Add an exercise:" 
        Visible="False"></asp:Label>
    <br />
    <br />
        <asp:DetailsView ID="dvInsertExercise" runat="server" AutoGenerateRows="False" 
            DataKeyNames="Planned_Ex_ID" DataSourceID="SqlDataSource2" DefaultMode="Insert" 
            Height="50px" Width="643px" Visible="False">
            <Fields>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Reps" HeaderText="Reps" SortExpression="Reps" />
                <asp:BoundField DataField="Sets" HeaderText="Sets" SortExpression="Sets" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" 
                    SortExpression="Weight" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Intensity" HeaderText="Intensity" 
                    SortExpression="Intensity" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Planned_Ex_ID" HeaderText="Planned_Ex_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Planned_Ex_ID" />
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    
</asp:Content>

