<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="CreateWorkout.aspx.vb" Inherits="CreateWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        Current workouts:</p>
    <p>
        <asp:GridView ID="gvWorkouts" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" DataKeyNames="Workout_ID">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                    ShowEditButton="True" />
                <asp:BoundField DataField="Workout_ID" HeaderText="Workout_ID" 
                    SortExpression="Workout_ID" InsertVisible="False" ReadOnly="True" 
                    Visible="False" />
                <asp:BoundField DataField="Workout_Name" 
                    HeaderText="Workout Name" SortExpression="Workout_Name" />
                <asp:BoundField DataField="Pre_Training_Notes" HeaderText="Pre Training Notes" 
                    SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" HeaderText="Post Training Notes" 
                    SortExpression="Post_Training_Notes" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create Date" 
                    SortExpression="Create_Date" />
                <asp:BoundField DataField="Assign_Date" HeaderText="Assign Date" 
                    SortExpression="Assign_Date" />
                <asp:BoundField DataField="Name" HeaderText="Cycle" ReadOnly="True" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Cycle_ID" HeaderText="Cycle ID" 
                    SortExpression="Cycle_ID" />
                <asp:BoundField DataField="Name1" HeaderText="Team" ReadOnly="True" 
                    SortExpression="Name1" />
                <asp:BoundField DataField="Team_ID" HeaderText="Team ID" 
                    SortExpression="Team_ID" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
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
                <asp:Parameter Name="Team_ID" Type="Int32" />
                <asp:Parameter Name="Cycle_ID" Type="Int32" />
                <asp:Parameter Name="Pre_Training_Notes" Type="String" />
                <asp:Parameter Name="Post_Training_Notes" Type="String" />
                <asp:Parameter DbType="Date" Name="Create_Date" />
                <asp:Parameter DbType="Date" Name="Assign_Date" />
            </InsertParameters>
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
        Add a workout:</p>
    <p>
        <asp:DetailsView ID="dvInsertWorkout" runat="server" AutoGenerateRows="False" 
            DataSourceID="SqlDataSource1" Height="50px" Width="501px" 
            DataKeyNames="Workout_ID" DefaultMode="Insert">
            <Fields>
                <asp:BoundField DataField="Workout_ID" HeaderText="Workout_ID" 
                    SortExpression="Workout_ID" InsertVisible="False" ReadOnly="True" 
                    Visible="False" />
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Pre_Training_Notes" 
                    HeaderText="Pre Training Notes" SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" HeaderText="Post Training Notes" 
                    SortExpression="Post_Training_Notes" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create Date" 
                    SortExpression="Create_Date" />
                <asp:BoundField DataField="Assign_Date" HeaderText="Assign Date" 
                    SortExpression="Assign_Date" />
                <asp:BoundField DataField="Cycle_ID" HeaderText="Cycle ID" 
                    SortExpression="Cycle_ID" />
                <asp:BoundField DataField="Team_ID" HeaderText="Team ID" 
                    SortExpression="Team_ID" />
                <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p>
        &nbsp;</p>

</asp:Content>

