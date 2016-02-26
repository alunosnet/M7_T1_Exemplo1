<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir_utilizadores_admin.aspx.cs" Inherits="m7_t1_exemplo1.gerir_utilizadores_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Gerir utilizadores</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir utilizadores</h1>
    <!--Sqldatasource-->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" DeleteCommand="DELETE FROM utilizadores WHERE (nome = @nome)" InsertCommand="INSERT INTO utilizadores(nome, palavra_passe, perfil, nprocesso) VALUES (@nome, @palavra_passe, @perfil, @nprocesso)" SelectCommand="SELECT nome, palavra_passe, perfil, nprocesso FROM utilizadores" UpdateCommand="UPDATE utilizadores SET palavra_passe = @palavra_passe, perfil = @perfil, nprocesso = @nprocesso WHERE (nome = @nome)">
        <DeleteParameters>
            <asp:Parameter Name="nome" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nome" />
            <asp:Parameter Name="palavra_passe" />
            <asp:Parameter Name="perfil" />
            <asp:Parameter Name="nprocesso" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="palavra_passe" />
            <asp:Parameter Name="perfil" />
            <asp:Parameter Name="nprocesso" />
            <asp:Parameter Name="nome" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" SelectCommand="SELECT * FROM [alunos]"></asp:SqlDataSource>
    <!--formview-->
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="nome" DataSourceID="SqlDataSource1" Width="251px">
        <EditItemTemplate>
            nome:
            <asp:Label ID="nomeLabel1" runat="server" Text='<%# Eval("nome") %>' />
            <br />
            palavra_passe:
            <asp:TextBox ID="palavra_passeTextBox" runat="server" Text='<%# Bind("palavra_passe") %>' />
            <br />
            perfil:
            <asp:TextBox ID="perfilTextBox" runat="server" Text='<%# Bind("perfil") %>' />
            <br />
            nprocesso:
            <asp:TextBox ID="nprocessoTextBox" runat="server" Text='<%# Bind("nprocesso") %>' />
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nomeTextBox" ErrorMessage="Indique um nome"></asp:RequiredFieldValidator>
            <br />
            palavra_passe:
            <asp:TextBox ID="palavra_passeTextBox" runat="server" Text='<%# Bind("palavra_passe") %>' TextMode="Password" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="palavra_passeTextBox" ErrorMessage="Indique uma palavra passe"></asp:RequiredFieldValidator>
            <br />
            perfil:
            <asp:TextBox ID="perfilTextBox" runat="server" Text='<%# Bind("perfil") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="perfilTextBox" ErrorMessage="Indique o perfil"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="perfilTextBox" ErrorMessage="O perfil tem de ser 0 ou 1" MaximumValue="1" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            <br />
            nprocesso:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="nprocesso" SelectedValue='<%# Bind("nprocesso") %>'>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Escolha um aluno"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            nome:
            <asp:Label ID="nomeLabel" runat="server" Text='<%# Eval("nome") %>' />
            <br />
            perfil:
            <asp:Label ID="perfilLabel" runat="server" Text='<%# Bind("perfil") %>' />
            <br />
            nprocesso:
            <asp:Label ID="nprocessoLabel" runat="server" Text='<%# Bind("nprocesso") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
</asp:FormView>
    <!--gridview-->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="nome" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="nome" SortExpression="nome">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("nome") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="palavra_passe" SortExpression="palavra_passe">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("palavra_passe") %>' TextMode="Password"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="perfil" SortExpression="perfil">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("perfil") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("perfil") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nprocesso" SortExpression="nprocesso">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("nprocesso") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("nprocesso") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
</asp:Content>
