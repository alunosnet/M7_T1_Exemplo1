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
            <asp:Parameter Name="data" DbType="Date" />
            <asp:Parameter Name="nrmodulo" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_disciplina" />
            <asp:Parameter Name="nprocesso" />
            <asp:Parameter Name="valor" />
            <asp:Parameter Name="data" DbType="Date"/>
            <asp:Parameter Name="nrmodulo" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <!--SQLAlunos-->
    <asp:SqlDataSource ID="SQLAlunos" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" SelectCommand="SELECT * FROM [alunos]"></asp:SqlDataSource>
    <!--SQLDisciplinas-->
    <asp:SqlDataSource ID="SQLDisciplinas" runat="server" ConnectionString="<%$ ConnectionStrings:m7_t1_exemplo1ConnectionString %>" SelectCommand="SELECT * FROM [disciplinas]"></asp:SqlDataSource>
    <!--FormView-->
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SQLNotas" Width="406px">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            id_disciplina:
            <asp:TextBox ID="id_disciplinaTextBox" runat="server" Text='<%# Bind("id_disciplina") %>' />
            <br />
            nprocesso:
            <asp:TextBox ID="nprocessoTextBox" runat="server" Text='<%# Bind("nprocesso") %>' />
            <br />
            valor:
            <asp:TextBox ID="valorTextBox" runat="server" Text='<%# Bind("valor") %>' />
            <br />
            data:
            <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
            <br />
            nrmodulo:
            <asp:TextBox ID="nrmoduloTextBox" runat="server" Text='<%# Bind("nrmodulo") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <InsertItemTemplate>
            Disciplina:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SQLDisciplinas" DataTextField="nome" DataValueField="id" SelectedValue='<%# Bind("id_disciplina") %>'>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Deve indicar uma disciplina"></asp:RequiredFieldValidator>
            <br />
            Aluno:
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SQLAlunos" DataTextField="nome" DataValueField="nprocesso" SelectedValue='<%# Bind("nprocesso") %>'>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Deve indicar um aluno"></asp:RequiredFieldValidator>
            <br />
            valor:
            <asp:TextBox ID="valorTextBox" runat="server" Text='<%# Bind("valor") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="valorTextBox" ErrorMessage="Tem de indicar uma nota"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="valorTextBox" ErrorMessage="A nota não é válida" MaximumValue="20" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <br />
            data:
            <asp:TextBox ID="dataTextBox" runat="server" Text='<%# Bind("data") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dataTextBox" ErrorMessage="Tem de indicar uma data"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="dataTextBox" ErrorMessage="A data não é válida" MaximumValue="01-01-2100" MinimumValue="01-01-1900" Type="Date"></asp:RangeValidator>
            <br />
            nrmodulo:
            <asp:TextBox ID="nrmoduloTextBox" runat="server" Text='<%# Bind("nrmodulo") %>' />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="nrmoduloTextBox" ErrorMessage="Tem de indicar o número do módulo"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="nrmoduloTextBox" ErrorMessage="O número do módulo não é válido" MaximumValue="99" MinimumValue="1" Type="Integer"></asp:RangeValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            id_disciplina:
            <asp:Label ID="id_disciplinaLabel" runat="server" Text='<%# Bind("id_disciplina") %>' />
            <br />
            nprocesso:
            <asp:Label ID="nprocessoLabel" runat="server" Text='<%# Bind("nprocesso") %>' />
            <br />
            valor:
            <asp:Label ID="valorLabel" runat="server" Text='<%# Bind("valor") %>' />
            <br />
            data:
            <asp:Label ID="dataLabel" runat="server" Text='<%# Bind("data") %>' />
            <br />
            nrmodulo:
            <asp:Label ID="nrmoduloLabel" runat="server" Text='<%# Bind("nrmodulo") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <!--Gridview-->
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLNotas">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="id_disciplina" SortExpression="id_disciplina">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SQLDisciplinas" DataTextField="nome" DataValueField="id" SelectedValue='<%# Bind("id_disciplina") %>'>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Tem de indicar uma disciplina"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_disciplina") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nprocesso" SortExpression="nprocesso">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SQLAlunos" DataTextField="nome" DataValueField="nprocesso" SelectedValue='<%# Bind("nprocesso") %>'>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList4" ErrorMessage="Tem de indicar o aluno"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("nprocesso") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="valor" SortExpression="valor">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("valor") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox3" ErrorMessage="Tem de indicar a nota"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="A nota não é válida" MaximumValue="20" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("valor") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="data" SortExpression="data">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("data") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox4" ErrorMessage="Deve indicar uma data"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="A data não é válida" MaximumValue="01-01-2100" MinimumValue="01-01-1900" Type="Date"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("data") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nrmodulo" SortExpression="nrmodulo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nrmodulo") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox5" ErrorMessage="Tem de indicar o número módulo"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="O número indicado não é válido" MaximumValue="99" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("nrmodulo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
