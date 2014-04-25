<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="CreateWorkout.aspx.vb" Inherits="CreateWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Current workouts:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                    ShowEditButton="True" />
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout_Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Pre_Training_Notes" 
                    HeaderText="Pre_Training_Notes" SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" HeaderText="Post_Training_Notes" 
                    SortExpression="Post_Training_Notes" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create_Date" 
                    SortExpression="Create_Date" />
                <asp:BoundField DataField="Assign_Date" HeaderText="Assign_Date" 
                    SortExpression="Assign_Date" />
                <asp:BoundField DataField="Name" HeaderText="Name" 
                    SortExpression="Name" ReadOnly="True" />
                <asp:BoundField DataField="Cycle_ID" HeaderText="Cycle_ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="Cycle_ID" />
                <asp:BoundField DataField="Name1" HeaderText="Name1" 
                    SortExpression="Name1" ReadOnly="True" />
                <asp:BoundField DataField="Team_ID" HeaderText="Team_ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Team_ID" />
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
            UpdateCommandType="StoredProcedure">
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
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="SqlDataSource2" Height="50px" Width="501px">
            <Fields>
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout_Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Pre_Training_Notes" HeaderText="Pre_Training_Notes" 
                    SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" 
                    HeaderText="Post_Training_Notes" SortExpression="Post_Training_Notes" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create_Date" 
                    SortExpression="Create_Date" />
                <asp:BoundField DataField="Assign_Date" HeaderText="Assign_Date" 
                    SortExpression="Assign_Date" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Name1" HeaderText="Name1" SortExpression="Name1" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            InsertCommand="CreateWorkout" InsertCommandType="StoredProcedure" 
            SelectCommand="ViewWorkout" SelectCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="Workout_Name" Type="String" />
                <asp:Parameter Name="Team_ID" Type="Int32" />
                <asp:Parameter Name="Cycle_ID" Type="Int32" />
                <asp:Parameter Name="Pre_Training_Notes" Type="String" />
                <asp:Parameter Name="Post_Training_Notes" Type="String" />
                <asp:Parameter DbType="Date" Name="Create_Date" />
                <asp:Parameter DbType="Date" Name="Assign_Date" />
            </InsertParameters>
        </asp:SqlDataSource>
    </p>

</asp:Content>

