<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="perfil_aluno.aspx.cs" Inherits="m7_t1_exemplo1.perfil_aluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Meu perfil</h1>
<!--sqldatasource -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" SelectCommand="SELECT nprocesso, nome, morada, cp, data_nascimento FROM alunos WHERE (nprocesso = @nprocesso)" UpdateCommand="UPDATE alunos SET nome = @nome, morada = @morada, cp = @cp, data_nascimento = @data_nascimento WHERE (nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:SessionParameter Name="nprocesso" SessionField="nprocesso" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="morada" />
            <asp:Parameter Name="cp" />
            <asp:Parameter Name="data_nascimento" />
            <asp:Parameter Name="nprocesso" />
        </UpdateParameters>
    </asp:SqlDataSource>
<!--Formview-->
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlDataSource1">
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
        <InsertItemTemplate>
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
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
