<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir_alunos_admin.aspx.cs" Inherits="m7_t1_exemplo1.gerir_alunos_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gerir Alunos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir Alunos</h1>
<!--SqlDataSource-->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" DeleteCommand="DELETE FROM alunos WHERE (nprocesso = @nprocesso)" InsertCommand="INSERT INTO alunos(nome, morada, cp, data_nascimento) VALUES (@nome, @morada, @cp, @data_nascimento)" SelectCommand="SELECT alunos.* FROM alunos" UpdateCommand="UPDATE alunos SET nome = @nome, morada = @morada, cp = @cp, data_nascimento = @data_nascimento WHERE (nprocesso = @nprocesso)">
        <DeleteParameters>
            <asp:Parameter Name="nprocesso" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="morada" />
            <asp:Parameter Name="cp" />
            <asp:Parameter Name="data_nascimento" DbType="Date"/>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="morada" />
            <asp:Parameter Name="cp" />
            <asp:Parameter Name="data_nascimento" DbType="Date"/>
            <asp:Parameter Name="nprocesso" />
        </UpdateParameters>
    </asp:SqlDataSource>
<!--FormView-->
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlDataSource1" Width="455px">
        <EditItemTemplate>
            nprocesso:
            <asp:Label ID="nprocessoLabel1" runat="server" Text='<%# Eval("nprocesso") %>' />
            <br />
            nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            morada:
            <asp:TextBox ID="moradaTextBox" runat="server" Text='<%# Bind("morada") %>' />
            <br />
            cp:
            <asp:TextBox ID="cpTextBox" runat="server" Text='<%# Bind("cp") %>' />
            <br />
            data_nascimento:
            <asp:TextBox ID="data_nascimentoTextBox" runat="server" Text='<%# Bind("data_nascimento") %>' />
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nomeTextBox" ErrorMessage="O nome é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <br />
            morada:
            <asp:TextBox ID="moradaTextBox" runat="server" Text='<%# Bind("morada") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="moradaTextBox" ErrorMessage="A morada é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <br />
            cp:
            <asp:TextBox ID="cpTextBox" runat="server" Text='<%# Bind("cp") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cpTextBox" ErrorMessage="O código postal é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <br />
            data_nascimento:
            <asp:TextBox ID="data_nascimentoTextBox" runat="server" Text='<%# Bind("data_nascimento") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="data_nascimentoTextBox" ErrorMessage="A data de nascimento é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="data_nascimentoTextBox" ErrorMessage="A data não é válida" MaximumValue="01-01-2100" MinimumValue="01-01-1900" Type="Date"></asp:RangeValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            nprocesso:
            <asp:Label ID="nprocessoLabel" runat="server" Text='<%# Eval("nprocesso") %>' />
            <br />
            nome:
            <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            morada:
            <asp:Label ID="moradaLabel" runat="server" Text='<%# Bind("morada") %>' />
            <br />
            cp:
            <asp:Label ID="cpLabel" runat="server" Text='<%# Bind("cp") %>' />
            <br />
            data_nascimento:
            <asp:Label ID="data_nascimentoLabel" runat="server" Text='<%# Bind("data_nascimento") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
</asp:FormView>
<!--GridView-->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="nprocesso" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" InsertVisible="False" ReadOnly="True" SortExpression="nprocesso" />
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="morada" HeaderText="morada" SortExpression="morada" />
            <asp:BoundField DataField="cp" HeaderText="cp" SortExpression="cp" />
            <asp:BoundField DataField="data_nascimento" HeaderText="data_nascimento" SortExpression="data_nascimento" />
        </Columns>
</asp:GridView>
</asp:Content>
