<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="m7_t1_exemplo1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>Página inicial</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Página inicial</h1>
    <div id="div_login" runat="server">
        Nome:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        Palavra passe:<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <!--submeter-->
        <br /><asp:Button ID="Button1" runat="server" Text="Login" />
        <!--mensagem-->
        <br /><asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <!--sqldatasource-->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" SelectCommand="SELECT nome, perfil, nprocesso FROM utilizadores WHERE (nome = @nome) AND (palavra_passe = @palavra_passe)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="nome" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="palavra_passe" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <!--Detailsview-->
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="nome" DataSourceID="SqlDataSource1" OnDataBound="DetailsView1_DataBound">
            <Fields>
                <asp:BoundField DataField="nome" HeaderText="nome" ReadOnly="True" SortExpression="nome" />
                <asp:BoundField DataField="perfil" HeaderText="perfil" SortExpression="perfil" />
                <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" SortExpression="nprocesso" />
            </Fields>
        </asp:DetailsView>
    </div>
</asp:Content>
