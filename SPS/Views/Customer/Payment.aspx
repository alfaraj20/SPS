<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SPS.Views.Customer.Payment1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Css/Customer/PD.css" rel="stylesheet" />
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Global.css" />
    <!-- Render All Elements Normally -->
    <link rel="stylesheet" href="../../Css/Normalize.css" />
    <!-- Page Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/PP.css" />
    <!-- Page Template JavaScript File -->
    <script src="../../JavaScript/Customer/PP.js"></script>
        <script>
        /* Start Enter Only Numbers */
        function OnlyNumbers(event) {
            var ikeycode = (event.which) ? event.which : event.keyCode
            if ((ikeycode < 48 || ikeycode > 57)) {
                return false;
            }
            else {
                return true;
            }
        }
        /* End Enter Only Numbers */
        /* Start Enter Only Letters */
        function OnlyLetters(event) {
            var ikeycode = (event.which) ? event.which : event.keyCode
            if (ikeycode < 65 || ikeycode > 90 && ikeycode < 97 || ikeycode > 122) {
                return false;
            }
            else {
                return true;
            }
        }
        /* End Enter Only Letters */
        /* Start Enter Emaill */
        function Email(event) {
            var ikeycode = (event.which) ? event.which : event.keyCode
            if (!(ikeycode == 46) && !(ikeycode > 47 && ikeycode < 58) && !(ikeycode == 64) && !(ikeycode > 64 && ikeycode < 91) && !(ikeycode == 95) && !(ikeycode > 96 && ikeycode < 123)) {
                return false;
            }
            else {
                return true;
            }
        }
        /* End Enter Email */
        /* Start Deatails */
        function Deatails(event) {
            var ikeycode = (event.which) ? event.which : event.keyCode
            if (!(ikeycode > 47 && ikeycode < 58) && !(ikeycode > 64 && ikeycode < 91) && !(ikeycode == 95) && !(ikeycode > 96 && ikeycode < 123) && !(ikeycode == 32) && !(ikeycode == 40) && !(ikeycode == 41) && !(ikeycode == 46) && !(ikeycode == 64) && !(ikeycode == 43) && !(ikeycode == 45) && !(ikeycode == 58) && !(ikeycode == 59) && !(ikeycode == 60) && !(ikeycode == 61) && !(ikeycode == 62) && !(ikeycode == 63) && !(ikeycode == 44) && !(ikeycode == 36)) {
                return false;
            }
            else {
                return true;
            }
        }
        /* End Deatails */
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-bottom: 270px; margin-left:900px;">

        <h2>Payment</h2>
        <table>
            <tr>

                <td>
                    <asp:TextBox ID="NOC" runat="server" CssClass="box1" placeholder="Name Of Card" onkeypress="javascript: return OnlyLetters(event)" MaxLength="30" minlength="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Payment" runat="server" ControlToValidate="NOC" ForeColor="Red" Display="Dynamic" Font-Italic="true" ErrorMessage="required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="CNum" runat="server" CssClass="box1" placeholder="Card Number" onkeypress="javascript: return OnlyNumbers(event)" MaxLength="16" minlength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Payment" runat="server" ControlToValidate="CNum" ForeColor="Red" Display="Dynamic" Font-Italic="true" ErrorMessage="required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="Payment" runat="server" ControlToValidate="CNum" Display="Dynamic" Font-Italic="true" ForeColor="Red" ValidationExpression="\d{16}" ErrorMessage="Inavild card number"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="EM" runat="server" CssClass="box1" placeholder="Exp Month" onkeypress="javascript: return OnlyNumbers(event)" MaxLength="2" minlength="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Payment" runat="server" ControlToValidate="EM" ForeColor="Red" Display="Dynamic" Font-Italic="true" ErrorMessage="required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="Payment" runat="server" ControlToValidate="EM" Display="Dynamic" Font-Italic="true" ForeColor="Red" ValidationExpression="^(0[1-9]|1[0-2])$" ErrorMessage="Inavild expire month"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="EY" runat="server" CssClass="box1" placeholder="Exp Year" onkeypress="javascript: return OnlyNumbers(event)" MaxLength="4" minlength="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Payment" runat="server" ControlToValidate="EY" ForeColor="Red" Display="Dynamic" Font-Italic="true" ErrorMessage="required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="Payment" runat="server" ControlToValidate="EY" Display="Dynamic" Font-Italic="true" ForeColor="Red" ValidationExpression="^20[0-9]{2}$" ErrorMessage="Inavild expire year"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="CVV" runat="server" CssClass="box1" placeholder="CVV" onkeypress="javascript: return OnlyNumbers(event)" MaxLength="3" minlength="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Payment" runat="server" ControlToValidate="CVV" ForeColor="Red" Display="Dynamic" Font-Italic="true" ErrorMessage="required." style="position:relative; bottom: 12px;"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="Payment" runat="server" ControlToValidate="CVV" Display="Dynamic" Font-Italic="true" ForeColor="Red" ValidationExpression="^\d{3}$" ErrorMessage="Inavild cvv" style="position:relative; bottom: 12px;"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Buy" runat="server" CssClass="btn1" Text="Buy Now" OnClick="Buy_Click" ValidationGroup="Payment"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
