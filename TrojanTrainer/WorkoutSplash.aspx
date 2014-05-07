<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="WorkoutSplash.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div _designerregion="0">
        Current Sport:&nbsp;&nbsp;
        <asp:DropDownList ID="Sportsddl" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="Sport_ID">
        </asp:DropDownList>
        <br />
        <br />
        Workout Home Page<br />
        <br />
        <asp:Button ID="btnCreate" runat="server" Text="Create Workout or Exercise" />
        <asp:Button ID="Button2" runat="server" Text="Button" />
        <asp:Button ID="Button3" runat="server" Text="Button" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="SELECT * FROM [Sport]"></asp:SqlDataSource>
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
            <SelectParameters>
                <asp:ControlParameter ControlID="Sportsddl" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="CurrentExercisesLbl" runat="server" Text="Current Exercises:" 
            Visible="False"></asp:Label>
        <br />
        <asp:GridView ID="gvExercises" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Planned_Ex_ID" 
            DataSourceID="SqlDataSource1" Visible="False">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Exercise Name" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Sets" HeaderText="Sets" SortExpression="Sets" />
                <asp:BoundField DataField="Reps" HeaderText="Reps" SortExpression="Reps" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" 
                    SortExpression="Weight" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Intensity" HeaderText="Intensity" 
                    SortExpression="Intensity" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetExerciseInformation" SelectCommandType="StoredProcedure" 
            DeleteCommand="DELETE FROM Workout_Template 
WHERE Planned_Ex_ID =  @Planned_Ex_ID " 
            InsertCommand="INSERT INTO [Planned_Exercise] ([Name], [Sets], [Reps], [Weight], [Time], [Intensity], [Note]) VALUES (@Name, @Sets, @Reps, @Weight, @Time, @Intensity, @Note)" 
            
            UpdateCommand="UPDATE [Planned_Exercise] SET [Name] = @Name, [Sets] = @Sets, [Reps] = @Reps, [Weight] = @Weight, [Time] = @Time, [Intensity] = @Intensity, [Note] = @Note WHERE [Planned_Ex_ID] = @Planned_Ex_ID">
            <DeleteParameters>
                <asp:Parameter Name="Planned_Ex_ID" />
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
                <asp:ControlParameter ControlID="Sportsddl" Name="Sport_ID" 
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
        <asp:Label ID="AddExercisesLbl" runat="server" Text="Add Exercises:" 
            Visible="False"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlExercises" runat="server" 
            DataSourceID="SqlDataSource3" DataTextField="Name" 
            DataValueField="Planned_Ex_ID" Visible="False">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewExercisesNotInWorkout" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="Exercise_Name_Listbox" Name="Workout_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="Sportsddl" Name="Sport_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnAddExercise" runat="server" Text="Add Exercise" 
            Visible="False" />
    </div>
    <br />
    <br />
        <br />
        Assigned Athletes:<br />
</asp:Content>

