<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="notas_aluno.aspx.cs" Inherits="m7_t1_exemplo1.notas_aluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Minhas notas</h1>
    <!--Sqldatasource-->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" SelectCommand="SELECT disciplinas.nome, notas.valor, notas.data, notas.nrmodulo FROM disciplinas INNER JOIN notas ON disciplinas.id = notas.id_disciplina WHERE (notas.nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:SessionParameter Name="nprocesso" SessionField="nprocesso" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!--Gridview-->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
            <asp:BoundField DataField="nrmodulo" HeaderText="nrmodulo" SortExpression="nrmodulo" />
        </Columns>
    </asp:GridView>
</asp:Content>
