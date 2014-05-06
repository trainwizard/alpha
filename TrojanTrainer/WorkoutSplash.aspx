<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="WorkoutSplash.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div _designerregion="0">
        <br />
        <br />
        Workout Home Page<br />
        <br />
        <br />
        <br />
        <asp:Button ID="btnCreate" runat="server" Text="Create" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <asp:Button ID="Button3" runat="server" Text="Button" />
        <br />
        <br />
        <br />
        Existing Workout Information<br />
        <br />
        Active Workouts:<br />
        <asp:ListBox ID="Exercise_Name_Listbox" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="Workout_Name" 
            DataValueField="Workout_ID" Height="150px" Width="350px">
        </asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewWorkout" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <br />
        <br />
        Current Exercises:<br />
        <asp:GridView ID="gvExercises" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            DataKeyNames="Workout_ID,Workout_ID1,Planned_Ex_ID,Planned_Ex_ID1" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                    ShowEditButton="True" />
                <asp:BoundField DataField="Workout_ID" HeaderText="Workout_ID" 
                    SortExpression="Workout_ID" InsertVisible="False" ReadOnly="True" 
                    Visible="False" />
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout_Name" 
                    SortExpression="Workout_Name" Visible="False" />
                <asp:BoundField DataField="Team_ID" HeaderText="Team_ID" 
                    SortExpression="Team_ID" Visible="False" />
                <asp:BoundField DataField="Cycle_ID" HeaderText="Cycle_ID" 
                    SortExpression="Cycle_ID" Visible="False" />
                <asp:BoundField DataField="Pre_Training_Notes" HeaderText="Pre_Training_Notes" 
                    SortExpression="Pre_Training_Notes" Visible="False" />
                <asp:BoundField DataField="Post_Training_Notes" 
                    HeaderText="Post_Training_Notes" SortExpression="Post_Training_Notes" 
                    Visible="False" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create_Date" 
                    SortExpression="Create_Date" Visible="False" />
                <asp:BoundField DataField="Assign_Date" HeaderText="Assign_Date" 
                    SortExpression="Assign_Date" Visible="False" />
                <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" 
                    Visible="False" />
                <asp:BoundField DataField="Workout_ID1" HeaderText="Workout_ID1" 
                    ReadOnly="True" SortExpression="Workout_ID1" Visible="False" />
                <asp:BoundField DataField="Planned_Ex_ID" HeaderText="Planned_Ex_ID" 
                    ReadOnly="True" SortExpression="Planned_Ex_ID" Visible="False" />
                <asp:BoundField DataField="Actual_Ex_ID" HeaderText="Actual_Ex_ID" 
                    SortExpression="Actual_Ex_ID" Visible="False" />
                <asp:BoundField DataField="Planned_Ex_ID1" HeaderText="Planned_Ex_ID1" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Planned_Ex_ID1" 
                    Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Sets" HeaderText="Sets" SortExpression="Sets" />
                <asp:BoundField DataField="Reps" HeaderText="Reps" 
                    SortExpression="Reps" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" 
                    SortExpression="Weight" />
                <asp:BoundField DataField="Time" HeaderText="Time" 
                    SortExpression="Time" />
                <asp:BoundField DataField="Intensity" HeaderText="Intensity" 
                    SortExpression="Intensity" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetExerciseInformation" SelectCommandType="StoredProcedure" 
            DeleteCommand="DELETE FROM [Planned_Exercise] WHERE [Planned_Ex_ID] = @Planned_Ex_ID AND FROM [Workout_Template] WHERE [Planned_Ex_ID] = @Planned_Ex_ID" 
            InsertCommand="INSERT INTO [Planned_Exercise] ([Name], [Sets], [Reps], [Weight], [Time], [Intensity], [Note]) VALUES (@Name, @Sets, @Reps, @Weight, @Time, @Intensity, @Note)" 
            UpdateCommand="UPDATE [Planned_Exercise] SET [Name] = @Name, [Sets] = @Sets, [Reps] = @Reps, [Weight] = @Weight, [Time] = @Time, [Intensity] = @Intensity, [Note] = @Note WHERE [Planned_Ex_ID] = @Planned_Ex_ID">
            <DeleteParameters>
                <asp:Parameter Name="Planned_Ex_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Sets" Type="Int32" />
                <asp:Parameter Name="Reps" Type="Int32" />
                <asp:Parameter Name="Weight" Type="Double" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="Intensity" Type="Double" />
                <asp:Parameter Name="Note" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="Exercise_Name_Listbox" Name="Workout_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Sets" Type="Int32" />
                <asp:Parameter Name="Reps" Type="Int32" />
                <asp:Parameter Name="Weight" Type="Double" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="Intensity" Type="Double" />
                <asp:Parameter Name="Note" Type="String" />
                <asp:Parameter Name="Planned_Ex_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        Add Exercise:<br />
        <asp:DropDownList ID="ddlExercises" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="Name" 
            DataValueField="Planned_Ex_ID">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewExercisesNotInWorkout" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="Exercise_Name_Listbox" Name="Workout_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnAddExercise" runat="server" Text="Add Exercise" />
    </div>
    <br />
    <br />
        <br />
        Assigned Athletes:<br />
</asp:Content>

