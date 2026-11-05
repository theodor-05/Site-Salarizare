<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActualizareDate.aspx.cs" Inherits="ActualizareDate" MasterPageFile="~/Site.master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        
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
                            ValidationExpression="^[a-zA-ZăâîșțĂÂÎȘȚ' -]{1,40}$"
                            ErrorMessage="Introdu un nume valid."
                            ForeColor="Red" />

                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Caută" OnClick="Button1_Click" />
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
        <asp:GridView ID="GridView1" runat="server" CssClass="auto-style5" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField HeaderText="ID" ReadOnly="True" DataField="NR_CRT">
                <ItemStyle BackColor="Yellow"  />
                </asp:BoundField>
                <asp:BoundField HeaderText="Nume" DataField="NUME"/>
                <asp:BoundField HeaderText="Prenume" DataField="PRENUME" />
                <asp:BoundField HeaderText="Funcție" DataField="FUNCTIE"/>
                <asp:BoundField HeaderText="Salariu de bază" DataField="SALARIU_BAZA" />
                <asp:BoundField HeaderText="Spor (%)" DataField="SPOR" />
                <asp:BoundField HeaderText="Premii brute" DataField="PREMII_BRUTE" />
                <asp:BoundField HeaderText="Total brut" ReadOnly="True" DataField="TOTAL_BRUT" >
                <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Brut impozitabil" ReadOnly="True" DataField="BRUT_IMPOZITABIL" >
                <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Impozit" ReadOnly="True" DataField="IMPOZIT" >
                <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField HeaderText="CAS" ReadOnly="True" DataField="CAS" >
                <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField HeaderText="CASS" ReadOnly="True" DataField="CASS" >
                <ItemStyle BackColor="Yellow" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Rețineri" DataField="RETINERI" />
                <asp:BoundField HeaderText="Virat card" ReadOnly="True" DataField="VIRAT_CARD" >
                <ItemStyle BackColor="Yellow" />
                </asp:BoundField>

                <asp:CommandField ShowEditButton="true" />

            </Columns>
        </asp:GridView>
        <asp:Button ID="Button2" runat="server" Text="Actualizează Date" />
        <asp:Button ID="Button3" runat="server" Text="Resetează tabel" OnClick="Button3_Click"/>
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
            margin-top: 31px;
        }
    </style>
</asp:Content>

