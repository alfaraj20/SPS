<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Update_Location.aspx.cs" Inherits="SPS.Views.Customer.Update_Location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Css/Customer/ULcss.css" rel="stylesheet" />
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
        //Start validation inside datalist
        function CheckWorkshopEmail(oName) {
            PageMethods.EmailWorkShopChecker(oName.value, OnSucceeded3);
        }
        function OnSucceeded3(result, userContext, methodName) {
            var message = document.getElementById("EmailCheck");
            if (methodName == "EmailWorkShopChecker") {
                if (result == true) {
                    message.innerHTML = "Email is not available";
                }
            }
        }
        //End validation inside datalist
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <div class="container">
        <h2>Delivery</h2>
        <table>
            <tr>
                <td>First Name:
                </td>
                <td>
                    <asp:TextBox ID="FN" CssClass="box1" runat="server" onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                    <label id="ContentPlaceHolder1_FN-error" class="error" for="ContentPlaceHolder1_FN"></label>
                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="FN" ForeColor="Red" Font-Italic="true" ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Last Name:
                </td>
                <td>
                    <asp:TextBox ID="LN" CssClass="box1" runat="server" onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="Update" ControlToValidate="LN" ForeColor="Red" Font-Italic="true" ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Country:
                </td>
                <td>
                    <asp:TextBox ID="Country" CssClass="box1" runat="server" onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="Country" ForeColor="Red" Font-Italic="true" ErrorMessage="Country name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Region:
                </td>
                <td>
                    <asp:TextBox ID="Region" CssClass="box1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="Region" ForeColor="Red" Font-Italic="true" ErrorMessage="Region name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>City:
                </td>
                <td>
                    <asp:TextBox ID="City" CssClass="box1" runat="server" onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="City" ForeColor="Red" Font-Italic="true" ErrorMessage="City name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>neighborhood:
                </td>
                <td>
                    <asp:TextBox ID="NB" CssClass="box1" runat="server" onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="NB" ForeColor="Red" Font-Italic="true" ErrorMessage="Neighborhood name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Street:
                </td>
                <td>
                    <asp:TextBox ID="Street" CssClass="box1" runat="server" onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="Street" ForeColor="Red" Font-Italic="true" ErrorMessage="Street name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Zip Code:
                </td>
                <td>
                    <asp:TextBox ID="ZipC" CssClass="box1" runat="server" onkeypress="javascript: return OnlyNumbers(event)" MaxLength="5" minlength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="ZipC" Display="Dynamic" ForeColor="Red" Font-Italic="true" ErrorMessage="Zip code is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="Update" runat="server" ControlToValidate="ZipC" Display="Dynamic" Font-Italic="true" ForeColor="Red" ValidationExpression="^\d{5}(?:[-\s]\d{4})?$" ErrorMessage="Inavild zip code"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Mobile number:
                </td>
                <td>
                    <asp:TextBox ID="Mob" CssClass="box1" runat="server" onkeypress="javascript: return OnlyNumbers(event)" MaxLength="10" minlength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Update" runat="server" ControlToValidate="Mob" ForeColor="Red" Display="Dynamic" Font-Italic="true" ErrorMessage="Mobile number is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationGroup="Update" runat="server" ControlToValidate="Mob" Display="Dynamic" Font-Italic="true" ForeColor="Red" ValidationExpression="(?:\+?0*?966)?0?5[0-9]{8}" ErrorMessage="Inavild mobile number"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Email:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="email" placeholder="Enter your email" onkeypress="javascript: return Email(event)" OnChange="CheckWorkshopEmail(this)"></asp:TextBox>
                    <span id="EmailCheck" style="position:relative; top:10px; color:red;"></span>
                    <asp:RequiredFieldValidator ID="Emaillabel" style="position:relative; top:10px;" runat="server" ControlToValidate="email" ErrorMessage="Email is required." ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator style="position:relative; top:10px;" runat="server" ControlToValidate="email" ErrorMessage="Invalid email" ForeColor="Red" ValidationGroup="Update" Font-Italic="true" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="but" runat="server" CssClass="btn1" Text="Update and Continue" OnClick="but_Click" style="position:relative; margin-top: 70px;" ValidationGroup="Update"/>
                </td>
            </tr>

        </table>
    </div>
</asp:Content>
