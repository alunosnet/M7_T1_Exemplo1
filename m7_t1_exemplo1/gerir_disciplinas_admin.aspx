<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir_disciplinas_admin.aspx.cs" Inherits="m7_t1_exemplo1.gerir_disciplinas_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gerir disciplinas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir Disciplinas</h1>
    <!--SQLDataSource-->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" DeleteCommand="DELETE FROM disciplinas WHERE (id = @id)" InsertCommand="INSERT INTO disciplinas(nome, nrmodulos) VALUES (@nome, @nrmodulos)" SelectCommand="SELECT disciplinas.* FROM disciplinas" UpdateCommand="UPDATE disciplinas SET nome = @nome, nrmodulos = @nrmodulos WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="nrmodulos" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="nrmodulos" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!--Formview-->
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="214px">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            nrmodulos:
            <asp:TextBox ID="nrmodulosTextBox" runat="server" Text='<%# Bind("nrmodulos") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nomeTextBox" ErrorMessage="Indique o nome da disciplina"></asp:RequiredFieldValidator>
            <br />
            nrmodulos:
            <asp:TextBox ID="nrmodulosTextBox" runat="server" Text='<%# Bind("nrmodulos") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nrmodulosTextBox" ErrorMessage="Indique o número de módulos"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="nrmodulosTextBox" ErrorMessage="O número de módulos não é válido" MaximumValue="90" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            nome:
            <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            nrmodulos:
            <asp:Label ID="nrmodulosLabel" runat="server" Text='<%# Bind("nrmodulos") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <!--gridview-->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="nrmodulos" HeaderText="nrmodulos" SortExpression="nrmodulos" />
        </Columns>
    </asp:GridView>
</asp:Content>
