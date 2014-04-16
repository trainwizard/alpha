<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="CreateWorkout.aspx.vb" Inherits="CreateWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Create a new workout:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Workout_ID" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                    ShowEditButton="True" />
                <asp:BoundField DataField="Workout_Name" HeaderText="Workout_Name" 
                    SortExpression="Workout_Name" />
                <asp:BoundField DataField="Team_ID" HeaderText="Team_ID" 
                    SortExpression="Team_ID" />
                <asp:BoundField DataField="Cycle_ID" HeaderText="Cycle_ID" 
                    SortExpression="Cycle_ID" />
                <asp:BoundField DataField="Pre_Training_Notes" HeaderText="Pre_Training_Notes" 
                    SortExpression="Pre_Training_Notes" />
                <asp:BoundField DataField="Post_Training_Notes" 
                    HeaderText="Post_Training_Notes" SortExpression="Post_Training_Notes" />
                <asp:BoundField DataField="Create_Date" HeaderText="Create_Date" 
                    SortExpression="Create_Date" />
                <asp:BoundField DataField="Assign_Date" HeaderText="Assign_Date" 
                    SortExpression="Assign_Date" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            DeleteCommand="DELETE FROM [Workout] WHERE [Workout_ID] = @Workout_ID" 
            InsertCommand="INSERT INTO [Workout] ([Workout_Name], [Team_ID], [Cycle_ID], [Pre_Training_Notes], [Post_Training_Notes], [Create_Date], [Assign_Date]) VALUES (@Workout_Name, @Team_ID, @Cycle_ID, @Pre_Training_Notes, @Post_Training_Notes, @Create_Date, @Assign_Date)" 
            SelectCommand="SELECT * FROM [Workout]" 
            UpdateCommand="UPDATE [Workout] SET [Workout_Name] = @Workout_Name, [Team_ID] = @Team_ID, [Cycle_ID] = @Cycle_ID, [Pre_Training_Notes] = @Pre_Training_Notes, [Post_Training_Notes] = @Post_Training_Notes, [Create_Date] = @Create_Date, [Assign_Date] = @Assign_Date WHERE [Workout_ID] = @Workout_ID">
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
                <asp:Parameter Name="Active" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Workout_Name" Type="String" />
                <asp:Parameter Name="Team_ID" Type="Int32" />
                <asp:Parameter Name="Cycle_ID" Type="Int32" />
                <asp:Parameter Name="Pre_Training_Notes" Type="String" />
                <asp:Parameter Name="Post_Training_Notes" Type="String" />
                <asp:Parameter DbType="Date" Name="Create_Date" />
                <asp:Parameter DbType="Date" Name="Assign_Date" />
                <asp:Parameter Name="Active" Type="Int32" />
                <asp:Parameter Name="Workout_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="SqlDataSource2" DefaultMode="Insert" 
            Height="50px" Width="125px">
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="CreateWorkout" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DetailsView1" Name="Workout_Name" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DetailsView1" Name="Team_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DetailsView1" Name="Cycle_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DetailsView1" Name="Pre_Training_Notes" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DetailsView1" Name="Post_Training_Notes" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DetailsView1" DbType="Date" Name="Create_Date" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DetailsView1" DbType="Date" Name="Assign_Date" 
                    PropertyName="SelectedValue" />
                <asp:Parameter Name="Active" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>

</asp:Content>

