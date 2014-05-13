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
    <br />
    <p>
        <asp:Button ID="btnWorkout" runat="server" Text="Manage Workouts" 
            CssClass="button small" />
        <asp:Button ID="btnExercise" runat="server" Text="Manage Exercises" 
            CssClass="button small" />
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
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Pre_Training_Notes" 
                    HeaderText="Pre Training Notes" SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" HeaderText="Post Training Notes" 
                    SortExpression="Post_Training_Notes" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewWorkout" 
            
            UpdateCommand="UpdateWorkout" SelectCommandType="StoredProcedure" 
            UpdateCommandType="StoredProcedure" DeleteCommand="UPDATE Workout 
SET Active = '0'
WHERE Workout.Workout_ID = @Workout_ID " InsertCommand="CreateWorkout" 
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
                <asp:Parameter Name="Pre_Training_Notes" Type="String" />
                <asp:Parameter Name="Post_Training_Notes" Type="String" />
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
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Pre_Training_Notes" 
                    HeaderText="Pre Training Notes" SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" 
                    HeaderText="Post Training Notes" SortExpression="Post_Training_Notes" />
                <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            InsertCommand="CreateWorkout" InsertCommandType="StoredProcedure" 
            SelectCommand="ViewWorkout" SelectCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="Workout_Name" Type="String" />
                <asp:Parameter Name="Pre_Training_Notes" Type="String" />
                <asp:Parameter Name="Post_Training_Notes" Type="String" />
                <asp:ControlParameter Name="Sport_ID" ControlID="Sportsddl" PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="Sport_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="lblExercises" runat="server" Text="Current exercises:" 
            Visible="False"></asp:Label>
    </p>
        <asp:GridView ID="gvExercises" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Planned_Ex_ID" 
            DataSourceID="SqlDataSource2" Visible="False">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Reps" HeaderText="Reps" SortExpression="Reps" />
                <asp:BoundField DataField="Sets" HeaderText="Sets" 
                    SortExpression="Sets" />
                <asp:BoundField DataField="Time" HeaderText="Time" 
                    SortExpression="Time" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" 
                    SortExpression="Weight" />
                <asp:BoundField DataField="Planned_Ex_ID" HeaderText="Planned_Ex_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Planned_Ex_ID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            DeleteCommand="UPDATE [Planned_Exercise] 
SET Active = 0
WHERE [Planned_Ex_ID] = @Planned_Ex_ID" 
            InsertCommand="CreateExercise" 
            SelectCommand="ViewExercise" 
            
        UpdateCommand="UPDATE [Planned_Exercise] 
SET [Name] = @Name, [Reps] = @Reps, [Sets] = @Sets, [Weight] = @Weight, [Time] = @Time, [Intensity] = @Intensity, [Note] = @Note, [Active]=1
WHERE [Planned_Ex_ID] = @Planned_Ex_ID" SelectCommandType="StoredProcedure" 
        InsertCommandType="StoredProcedure">
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
                <asp:ControlParameter Name="Sport_ID" ControlID="SportsDdl" PropertyName="SelectedValue" />
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
        <asp:DetailsView ID="dvInsertExercise" runat="server" AutoGenerateRows="False" 
            DataKeyNames="Planned_Ex_ID" 
        DataSourceID="SqlDataSource2" DefaultMode="Insert" 
            Height="50px" Width="643px" Visible="False">
            <Fields>
                <asp:BoundField DataField="Name" HeaderText="Name" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                <asp:BoundField DataField="Reps" HeaderText="Reps" SortExpression="Reps" />
                <asp:BoundField DataField="Sets" HeaderText="Sets" 
                    SortExpression="Sets" />
                <asp:BoundField DataField="Time" HeaderText="Time" 
                    SortExpression="Time" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" 
                    SortExpression="Weight" />
                <asp:BoundField DataField="Planned_Ex_ID" HeaderText="Planned_Ex_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Planned_Ex_ID" />
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    
    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>--%>
    
    <br />
    <asp:Button ID="Button1" runat="server" Text="Workout Home" 
        CssClass="button small" />
    
</asp:Content>

