<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StergereAngajati.aspx.cs" Inherits="StergereAngajati" MasterPageFile="~/Site.master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Ștergere angajat</h2>
        <div class="auto-style2">
            <table style="border-style: solid; border-color: #00FF00; width: 100%; background-color: #FFFFFF;">
                <tr>
                    <td class="auto-style3">Nume:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ControlToValidate="TextBox2"
                            ValidationExpression="^[a-zA-Z' -]{1,40}$"
                            ErrorMessage="Introdu un nume valid."
                            ForeColor="Red" />
                    </td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td>Prenume:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator
                            ID="NameValidator"
                            runat="server"
                            ControlToValidate="TextBox2"
                            ValidationExpression="^[a-zA-Z' -]{1,40}$"
                            ErrorMessage="Introdu un prenume valid."
                            ForeColor="Red" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Caută"/>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="true"></asp:Label>
            <br />
        </div>
        
    </div>
    <div class="auto-style4">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
            EmptyDataText="Angajatul căutat nu există!"
            AutoGenerateColumns="False" DataKeyNames="NR_CRT"
            OnRowDeleted="GridView1_RowDeleted">
            <Columns>

                <asp:CommandField ShowDeleteButton="true" DeleteText="Șterge" />


                <asp:BoundField DataField="NR_CRT" HeaderText="NR_CRT" ReadOnly="True" SortExpression="NR_CRT">
                </asp:BoundField>

                <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                <asp:BoundField DataField="PRENUME" HeaderText="PRENUME" SortExpression="PRENUME" />
                <asp:BoundField DataField="FUNCTIE" HeaderText="FUNCTIE" SortExpression="FUNCTIE" />
                <asp:BoundField DataField="SALARIU_BAZA" HeaderText="SALARIU_BAZA" SortExpression="SALARIU_BAZA" />
                <asp:BoundField DataField="SPOR" HeaderText="SPOR" SortExpression="SPOR" />
                <asp:BoundField DataField="PREMII_BRUTE" HeaderText="PREMII_BRUTE" SortExpression="PREMII_BRUTE" />

                <asp:BoundField DataField="TOTAL_BRUT" HeaderText="TOTAL_BRUT" SortExpression="TOTAL_BRUT">
                </asp:BoundField>

                <asp:BoundField DataField="BRUT_IMPOZITABIL" HeaderText="BRUT_IMPOZITABIL" SortExpression="BRUT_IMPOZITABIL">
                </asp:BoundField>

                <asp:BoundField DataField="IMPOZIT" HeaderText="IMPOZIT" SortExpression="IMPOZIT">
                </asp:BoundField>

                <asp:BoundField DataField="CAS" HeaderText="CAS" SortExpression="CAS">
                </asp:BoundField>

                <asp:BoundField DataField="CASS" HeaderText="CASS" SortExpression="CASS">
                </asp:BoundField>

                <asp:BoundField DataField="RETINERI" HeaderText="RETINERI" SortExpression="RETINERI" />

                <asp:BoundField DataField="VIRAT_CARD" HeaderText="VIRAT_CARD" SortExpression="VIRAT_CARD">
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            CancelSelectOnNullParameter="False"
            SelectCommand="SELECT * FROM ANGAJATI
                           WHERE UPPER(nume) = UPPER(NVL(:NUME, nume))
                             AND UPPER(prenume) = UPPER(NVL(:PRENUME, prenume))
                           ORDER BY nr_crt" 
            DeleteCommand="DELETE FROM angajati WHERE (nr_crt = :ID)">

            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="NUME" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="PRENUME" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .auto-style2 {
        height: 132px;
    }
    .auto-style3 {
        height: 26px;
    }
        .auto-style4 {
            height: 209px;
        }
        </style>
</asp:Content>

