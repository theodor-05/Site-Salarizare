<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModificareProcente.aspx.cs" Inherits="ModificareProcente" MasterPageFile="~/Site.master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Modificare procente</h2>
    <div>
        <p>
            Procent CAS:
            <asp:TextBox ID="Text1" runat="server"/>
            <asp:RegularExpressionValidator
                ID="CASValidator"
                runat="server"
                ControlToValidate="Text1"
                ValidationExpression="[1-9][0-9]?$|^100$"
                ErrorMessage="Introdu un procent valid (numere cuprinse între 1 și 100)."
                ForeColor="Red" />
        </p>

        <p>
            Procent CASS:
            <asp:TextBox ID="Text2" runat="server"/>
            <asp:RegularExpressionValidator
                ID="CASSValidator"
                runat="server"
                ControlToValidate="Text2"
                ValidationExpression="[1-9][0-9]?$|^100$"
                ErrorMessage="Introdu un procent valid (numere cuprinse între 1 și 100)."
                ForeColor="Red" />
        </p>

        <p>
            Procent impozit:
            <asp:TextBox ID="Text3" runat="server" />
            <asp:RegularExpressionValidator
                ID="ImpozitValidator"
                runat="server"
                ControlToValidate="Text3"
                ValidationExpression="[1-9][0-9]?$|^100$"
                ErrorMessage="Introdu un procent valid (numere cuprinse între 1 și 100)."
                ForeColor="Red" />
        </p>

        <p>
            Parolă configurare:
            <asp:TextBox ID="Text4" runat="server" TextMode="Password"/>
            
            <asp:RequiredFieldValidator
                ID="ParolaValidator2" 
                runat="server"
                ControlToValidate="Text4"
                ErrorMessage="Trebuie introdusă parola pentru a putea actualiza procentele!"
                ForeColor="Red" />
        </p>

        <asp:Button ID="Button1"
            runat="server"
            OnClick="Button1_Click"
            Text="Modificare procente" CssClass="auto-style1" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            margin-top: 2px;
        }
    </style>
</asp:Content>