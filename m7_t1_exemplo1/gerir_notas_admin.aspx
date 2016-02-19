<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir_notas_admin.aspx.cs" Inherits="m7_t1_exemplo1.gerir_notas_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--SQLNotas-->
    <asp:SqlDataSource ID="SQLNotas" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" DeleteCommand="DELETE FROM notas WHERE (id = @id)" InsertCommand="INSERT INTO notas(id_disciplina, nprocesso, valor, data, nrmodulo) VALUES (@id_disciplina, @nprocesso, @valor, @data, @nrmodulo)" SelectCommand="SELECT id, id_disciplina, nprocesso, valor, data, nrmodulo FROM notas" UpdateCommand="UPDATE notas SET id_disciplina = @id_disciplina, nprocesso = @nprocesso, valor = @valor, data = @data, nrmodulo = @nrmodulo WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_disciplina" />
            <asp:Parameter Name="nprocesso" />
            <asp:Parameter Name="valor" />
            <asp:Parameter Name="data" />
            <asp:Parameter Name="nrmodulo" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_disciplina" />
            <asp:Parameter Name="nprocesso" />
            <asp:Parameter Name="valor" />
            <asp:Parameter Name="data" />
            <asp:Parameter Name="nrmodulo" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!--SQLAlunos-->
    <asp:SqlDataSource ID="SQLAlunos" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" SelectCommand="SELECT * FROM [alunos]"></asp:SqlDataSource>
    <!--SQLDisciplinas-->
    <asp:SqlDataSource ID="SQLDisciplinas" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" SelectCommand="SELECT * FROM [disciplinas]"></asp:SqlDataSource>
    <!--FormView-->
    <asp:FormView ID="FormView1" runat="server"></asp:FormView>
    <!--Gridview-->
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
</asp:Content>
