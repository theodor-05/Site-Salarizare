<%@ Page Title="Adăugare angajați" Language="C#" AutoEventWireup="true" CodeFile="AdaugareAngajati.aspx.cs" Inherits="AdaugareAngajati" MasterPageFile="~/Site.master"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Adăugare Angajați</h2>

    <p>
        Nume:
        <asp:TextBox ID="Text1" runat="server"/>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator1"
            runat="server"
            ControlToValidate="Text1"
            ErrorMessage="Angajatul trebuie să aibă un nume!"
            ForeColor="Red" />
        <asp:RegularExpressionValidator
            ID="NameValidator"
            runat="server"
            ControlToValidate="Text1"
            ValidationExpression="^[a-zA-ZăâîșțĂÂÎȘȚ' -]{1,40}$"
            ErrorMessage="Introdu un nume valid."
            ForeColor="Red" />
    </p>

    <p>
        Prenume:
        <asp:TextBox ID="Text2" runat="server" />
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="Text2"
            ErrorMessage="Angajatul trebuie să aibă un prenume!"
            ForeColor="Red" />
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator1"
            runat="server"
            ControlToValidate="Text2"
            ValidationExpression="^[a-zA-ZăâîșțĂÂÎȘȚ' -]{1,40}$"
            ErrorMessage="Introdu un prenume valid."
            ForeColor="Red" />
    </p>

    <p>
        Funcție:
        <asp:TextBox ID="Text3" runat="server" />
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator3"
            runat="server"
            ControlToValidate="Text3"
            ErrorMessage="Angajatul trebuie să aibă o funcție!"
            ForeColor="Red" />
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator3"
            runat="server"
            ControlToValidate="Text3"
            ValidationExpression="^[a-zA-ZăâîșțĂÂÎȘȚ' -]{1,40}$"
            ErrorMessage="Introdu o funcție validă."
            ForeColor="Red" />
    </p>

    <p>
        Salariu de bază:
        <asp:TextBox ID="Text4" runat="server" AutoPostBack="true" OnTextChanged="Text4_TextChanged"/>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator4"
            runat="server"
            ControlToValidate="Text4"
            ErrorMessage="Introdu salariul de bază!"
            ForeColor="Red" />
        <asp:RegularExpressionValidator
            ID="SalaryValidator"
            runat="server"
            ControlToValidate="Text4"
            ValidationExpression="^\d+(\.\d{1,2})?$"
            ErrorMessage="Introdu un salariu valid."
            ForeColor="Red" />
    </p>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="37px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" RowStyle-Height="45px">
        <Columns>
            <asp:BoundField DataField="Total brut" HeaderText="Total brut" ReadOnly="True" />
            <asp:BoundField DataField="Brut impozitabil" HeaderText="Brut impozitabil" ReadOnly="True" />
            <asp:BoundField DataField="Impozit" HeaderText="Impozit" ReadOnly="True" />
            <asp:BoundField DataField="CAS" HeaderText="CAS" ReadOnly="True" />
            <asp:BoundField DataField="CASS" HeaderText="CASS" ReadOnly="True" />
            <asp:BoundField DataField="Virat card" HeaderText="Virat card" ReadOnly="True" />
        </Columns>
    </asp:GridView>

    <asp:Button ID="Button1"
        runat="server"
        OnClick="Button1_Click"
        Text="Adăugare angajat" CssClass="auto-style1" />

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            margin-top: 2px;
        }
    </style>
</asp:Content>

