<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Register</h2>
        <div class="auto-style2">
            <table style="border-style: solid; border-color: #00FF00; width: 100%; background-color: #FFFFFF;">
                <tr>
                    <td class="auto-style3">Nume de utilizator:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ControlToValidate="TextBox1"
                            ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"
                            ErrorMessage="Introdu un nume de utilizator valid!"
                            ForeColor="Red" />
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="TextBox1"
                            ErrorMessage="Introdu un nume de utilizator!"
                            ForeColor="Red" />
                    </td>
                    <td class="auto-style3"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style1">Parolă:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            runat="server"
                            ControlToValidate="TextBox2"
                            ValidationExpression="^(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$"
                            ErrorMessage="Parola trebuie să aibă între 8 și 10 caractere, să conțină cel puțin o cifră și un caracter alfabetic și nu trebuie să conțină caractere speciale."
                            ForeColor="Red" />
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="TextBox2"
                            ErrorMessage="Introdu o parolă!"
                            ForeColor="Red" />
                    </td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style1">Confirmă parola:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:CompareValidator
                            ID="CompareValidator1"
                            runat="server"
                            ControlToValidate="TextBox3"
                            ControlToCompare="TextBox2"
                            Operator="Equal"
                            Type="String"
                            ErrorMessage="Parola trebuie să fie aceeași cu cea din câmpul de mai sus!"
                            ForeColor="Red" />
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="TextBox3"
                            ErrorMessage="Introdu o parolă!"
                            ForeColor="Red" />
                    </td>
                    <td class="auto-style1"></td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Button ID="Button1" runat="server" Text="Înregistrare" OnClick="Button1_Click"/>
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                    <td class="auto-style5"></td>
                    <td class="auto-style5"></td>
                </tr>
            </table>
            <br />
        </div>
        <p>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Ai deja un cont?" CausesValidation="false"/>
        </p>
    </form>
</body>
</html>
