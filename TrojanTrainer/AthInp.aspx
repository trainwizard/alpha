﻿<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="AthInp.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                &nbsp;<asp:Label ID="Workout_NameLabel" runat="server" 
                    Text='<%# Eval("Workout_Name") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetWorkoutName" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Workout_ID" QueryStringField="ID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="ExDdl" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="Name" 
            DataValueField="Planned_Ex_ID" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="GetExercisesForAthlete" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Workout_ID" QueryStringField="ID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3">
            <EditItemTemplate>
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Intensity:
                <asp:TextBox ID="IntensityTextBox" runat="server" 
                    Text='<%# Bind("Intensity") %>' />
                <br />
                Note:
                <asp:TextBox ID="NoteTextBox" runat="server" Text='<%# Bind("Note") %>' />
                <br />
                Reps:
                <asp:TextBox ID="RepsTextBox" runat="server" Text='<%# Bind("Reps") %>' />
                <br />
                Sets:
                <asp:TextBox ID="SetsTextBox" runat="server" Text='<%# Bind("Sets") %>' />
                <br />
                Time:
                <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                <br />
                Weight:
                <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Intensity:
                <asp:TextBox ID="IntensityTextBox" runat="server" 
                    Text='<%# Bind("Intensity") %>' />
                <br />
                Note:
                <asp:TextBox ID="NoteTextBox" runat="server" Text='<%# Bind("Note") %>' />
                <br />
                Reps:
                <asp:TextBox ID="RepsTextBox" runat="server" Text='<%# Bind("Reps") %>' />
                <br />
                Sets:
                <asp:TextBox ID="SetsTextBox" runat="server" Text='<%# Bind("Sets") %>' />
                <br />
                Time:
                <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                <br />
                Weight:
                <asp:TextBox ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Intensity:
                <asp:Label ID="IntensityLabel" runat="server" Text='<%# Bind("Intensity") %>' />
                <br />
                Note:
                <asp:Label ID="NoteLabel" runat="server" Text='<%# Bind("Note") %>' />
                <br />
                Reps:
                <asp:Label ID="RepsLabel" runat="server" Text='<%# Bind("Reps") %>' />
                <br />
                Sets:
                <asp:Label ID="SetsLabel" runat="server" Text='<%# Bind("Sets") %>' />
                <br />
                Time:
                <asp:Label ID="TimeLabel" runat="server" Text='<%# Bind("Time") %>' />
                <br />
                Weight:
                <asp:Label ID="WeightLabel" runat="server" Text='<%# Bind("Weight") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataKeyNames="Actual_Ex_ID" DataSourceID="SqlDataSource4" Height="50px" 
            Width="125px">
            <Fields>
                <asp:BoundField DataField="Reps" HeaderText="Reps" 
                    SortExpression="Reps" />
                <asp:BoundField DataField="Sets" HeaderText="Sets" SortExpression="Sets" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" 
                    SortExpression="Weight" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Intensity" HeaderText="Intensity" 
                    SortExpression="Intensity" />
                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            </Fields>
            <EmptyDataTemplate>
                <asp:Button ID="InsertButton" runat="server" CommandName="New" Text="Complete Exercise" />
            </EmptyDataTemplate>
        </asp:DetailsView>

    </p>
    <p>
        <asp:Label ID="RepsLbl" runat="server" Text="Reps:"></asp:Label>
   
<asp:TextBox ID="RepsTxt" runat="server"></asp:TextBox>

        </p>

    <p>
        <asp:Label ID="SetsLbl" runat="server" Text="Sets:"></asp:Label>
    </p>
    <p>
   
<asp:TextBox ID="SetsTxt" runat="server"></asp:TextBox>

        <asp:Label ID="WeightLbl" runat="server" Text="Weight:"></asp:Label>
    </p>
    <p>
   
<asp:TextBox ID="WeightTxt" runat="server"></asp:TextBox>

        <asp:Label ID="TimeLbl" runat="server" Text="Time:"></asp:Label>
    </p>
    <p>
   
<asp:TextBox ID="TimeTxt" runat="server"></asp:TextBox>

    </p>
    <p>
        <asp:Label ID="IntensityLbl" runat="server" Text="Intensity:"></asp:Label>
    </p>
    <p>
   
<asp:TextBox ID="IntensityTxt" runat="server"></asp:TextBox>

    </p>
    <p>
        <asp:Label ID="NoteLbl" runat="server" Text="Note:"></asp:Label>
    </p>
    <p>
   
<asp:TextBox ID="NoteTxt" runat="server"></asp:TextBox>

    </p>
    <p>
        <asp:Button ID="AddExerciseDataBtn" runat="server" 
            Text="Add Exercise Results" />
    </p>
    <p>
        &nbsp;</p>
    <p>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            InsertCommand="AthleteInputWorkoutData" InsertCommandType="StoredProcedure" SelectCommand="SELECT *
FROM Actual_Exercise
WHERE TM_ID = @TM_ID AND Date = @Date">
            <InsertParameters>
                <asp:Parameter Name="TM_ID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Reps" Type="Int32" />
                <asp:Parameter Name="Sets" Type="Int32" />
                <asp:Parameter Name="Weight" Type="Double" />
                <asp:Parameter Name="Time" Type="String" />
                <asp:Parameter Name="Intensity" Type="Double" />
                <asp:Parameter Name="Note" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="TM_ID" SessionField="TM_ID" />
                <asp:SessionParameter Name="Date" SessionField="CurDate" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AlphaConnectionString %>" 
            SelectCommand="ViewCurrentExercise" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="Workout_ID" QueryStringField="ID" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="ExDdl" Name="Planned_Ex_ID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

