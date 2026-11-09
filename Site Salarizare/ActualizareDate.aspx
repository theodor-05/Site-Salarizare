<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActualizareDate.aspx.cs" Inherits="ActualizareDate" MasterPageFile="~/Site.master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2>Actualizare Date</h2>
        <div class="auto-style2">
            <table style="border-style: solid; border-color: #00FF00; width: 100%; background-color: #FFFFFF;">
                <tr>
                    <td class="auto-style3">ID:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ControlToValidate="TextBox1"
                            ValidationExpression="^\d+$"
                            ErrorMessage="Introdu un ID valid."
                            ForeColor="Red" />
                    </td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td>Nume:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator
                            ID="NameValidator"
                            runat="server"
                            ControlToValidate="TextBox2"
                            ValidationExpression="^[a-zA-Z' -]{1,40}$"
                            ErrorMessage="Introdu un nume valid."
                            ForeColor="Red" />

                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Button ID="Button1" runat="server" Text="Caută"/>
                    </td>
                    <td class="auto-style5"></td>
                    <td class="auto-style5"></td>
                </tr>
            </table>
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="true"></asp:Label>
            <br />
        </div>
        
    </div>
    <div class="auto-style4">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
            EmptyDataText="Angajatul căutat nu există!"
            AutoGenerateColumns="False" DataKeyNames="NR_CRT">
            <Columns>
                <asp:CommandField ShowEditButton="true" EditText="Editează"
                    UpdateText="Salvează" CancelText="Anulează" />

                <asp:BoundField DataField="NR_CRT" HeaderText="ID" ReadOnly="True">
                    <HeaderStyle BackColor="Yellow" />
                    <ItemStyle BackColor="Yellow" />
                </asp:BoundField>

                <asp:BoundField DataField="NUME" HeaderText="Nume" />
                <asp:BoundField DataField="PRENUME" HeaderText="Prenume" />
                <asp:BoundField DataField="FUNCTIE" HeaderText="Funcție" />
                <asp:BoundField DataField="SALARIU_BAZA" HeaderText="Salariu de bază" />
                <asp:BoundField DataField="SPOR" HeaderText="Spor (%)" />
                <asp:BoundField DataField="PREMII_BRUTE" HeaderText="Premii brute" />

                <asp:BoundField DataField="TOTAL_BRUT" HeaderText="Total brut" ReadOnly="True">
                    <HeaderStyle BackColor="Yellow" />
                    <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField DataField="BRUT_IMPOZITABIL" HeaderText="Brut impozitabil" ReadOnly="True">
                    <HeaderStyle BackColor="Yellow" />
                    <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField DataField="IMPOZIT" HeaderText="Impozit" ReadOnly="True">
                    <HeaderStyle BackColor="Yellow" />
                    <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField DataField="CAS" HeaderText="CAS" ReadOnly="True">
                    <HeaderStyle BackColor="Yellow" />
                    <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField DataField="CASS" HeaderText="CASS" ReadOnly="True">
                    <HeaderStyle BackColor="Yellow" />
                    <ItemStyle BackColor="Yellow" />
                </asp:BoundField>

                <asp:BoundField DataField="RETINERI" HeaderText="Rețineri" />

                <asp:BoundField DataField="VIRAT_CARD" HeaderText="Virat card" ReadOnly="True">
                    <HeaderStyle BackColor="Yellow" />
                    <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            CancelSelectOnNullParameter="False"
            SelectCommand="SELECT * FROM ANGAJATI
                           WHERE nr_crt = NVL(:ID, nr_crt)
                             AND UPPER(nume) = UPPER(NVL(:NUME, nume))
                           ORDER BY nr_crt"
            UpdateCommand="BEGIN
                             UPDATE ANGAJATI
                                SET nume = :NUME, prenume = :PRENUME, functie = :FUNCTIE,
                                    salariu_baza = :SALARIU_BAZA,
                                    spor = NVL(:SPOR, 0),
                                    premii_brute = NVL(:PREMII_BRUTE, 0),
                                    retineri = NVL(:RETINERI, 0)
                              WHERE nr_crt = :NR_CRT;
                           END;">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="ID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox2" Name="NUME" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="NUME" Type="String" />
                <asp:Parameter Name="PRENUME" Type="String" />
                <asp:Parameter Name="FUNCTIE" Type="String" />
                <asp:Parameter Name="SALARIU_BAZA" Type="Int32" />
                <asp:Parameter Name="SPOR" Type="Int32" />
                <asp:Parameter Name="PREMII_BRUTE" Type="Int32" />
                <asp:Parameter Name="RETINERI" Type="Int32" />
                <asp:Parameter Name="NR_CRT" Type="Int32" />
            </UpdateParameters>
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
        .auto-style5 {
            height: 33px;
        }
        </style>
</asp:Content>

