<%@ Page Title="Sign UP" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SPS.Views.Customer.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Global.css" />
    <!-- Render All Elements Normally -->
    <link rel="stylesheet" href="../../Css/Normalize.css" />
    <!-- Page Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/LR.css" />
    <!-- Page Template JavaScript File -->
    <script src="../../JavaScript/Customer/LR.js"></script>
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
        function CheckWorkshopName(oName) {
            PageMethods.WorkshopNameChecker(oName.value, OnSucceeded1);
        }
        function OnSucceeded1(result, userContext, methodName) {
            var message = document.getElementById("UsernameCheck");
            if (methodName == "WorkshopNameChecker") {
                if (result == true) {
                    message.innerHTML = "Username is not available";
                }
                else {
                    message.innerHTML = "";
                }
            }
        }
        function CheckWorkshopEmail(oName) {
            PageMethods.EmailWorkShopChecker(oName.value, OnSucceeded3);
        }
        function OnSucceeded3(result, userContext, methodName) {
            var message = document.getElementById("EmailCheck");
            if (methodName == "EmailWorkShopChecker") {
                if (result == true) {
                    message.innerHTML = "Email is not available";
                }
                else {
                    message.innerHTML = "";
                }
            }
        }
        //End validation inside datalist
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <div class="container1" style="position: absolute;max-width: 430px;width: 100%;background: #fff;border-radius: 10px;box-shadow: 0 5px 10px rgb(0 0 0 / 10%);overflow: hidden;margin: 250px 750px auto; height:812px;">
        <div class="forms">
            <!-- Registration Form -->
            <div class="form signup" style="height:420px;">
                <span class="title">Registration</span>
                <div class="input-field">
                    <asp:TextBox runat="server" ID="fname" placeholder="Enter your first name" onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                    <i class="far fa-id-card"></i>
                </div>
                    <asp:RequiredFieldValidator ValidationGroup="Registration" runat="server" ControlToValidate="fname" ForeColor="Red" Font-Italic="true" ErrorMessage="First name is required." style="position:relative; top:10px;"></asp:RequiredFieldValidator>
                <div class="input-field">
                    <asp:TextBox runat="server" ID="lname" class="password" placeholder="Enter your last name" onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                    <i class="far fa-id-card"></i>
                </div>
                    <asp:RequiredFieldValidator ValidationGroup="Registration" runat="server" ControlToValidate="lname" ForeColor="Red" Font-Italic="true" ErrorMessage="Last name is required." style="position:relative; top:10px;"></asp:RequiredFieldValidator>
                <div class="input-field">
                    <asp:TextBox runat="server" ID="username" OnChange="CheckWorkshopName(this)" placeholder="Enter your username"></asp:TextBox>
                    <i class="uil uil-user"></i>
                </div>
                <span id="UsernameCheck" style="position:relative; top:10px; color:red;"></span>
                    <asp:RequiredFieldValidator ValidationGroup="Registration" runat="server" ControlToValidate="username" ForeColor="Red" Font-Italic="true" ErrorMessage="Username is required." Display="Dynamic" style="position:relative; top:10px;"></asp:RequiredFieldValidator>
                <div class="input-field">
                    <asp:TextBox runat="server" ID="password" placeholder="Enter your password" type="password"></asp:TextBox>
                    <i class="uil uil-lock icon"></i>
                </div>
                    <asp:RequiredFieldValidator ValidationGroup="Registration" runat="server" ControlToValidate="password" ForeColor="Red" Font-Italic="true" ErrorMessage="Password is required." style="position:relative; top:10px;"></asp:RequiredFieldValidator>                <div class="input-field">
                    <asp:TextBox runat="server" ID="email" placeholder="Enter your email" onkeypress="javascript: return Email(event)" OnChange="CheckWorkshopEmail(this)"></asp:TextBox>
                    <i class="uil uil-envelope icon"></i>
                </div>
                    <span id="EmailCheck" style="position:relative; top:10px; color:red;"></span>
                    <asp:RequiredFieldValidator ID="Emaillabel" style="position:relative; top:10px;" runat="server" ControlToValidate="email" ErrorMessage="Email is required." ValidationGroup="Registration" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator style="position:relative; top:10px;" runat="server" ControlToValidate="email" ErrorMessage="Invalid email" ForeColor="Red" ValidationGroup="Registration" Font-Italic="true" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <div class="input-field">
                    <asp:TextBox runat="server" ID="phone" placeholder="Enter your phone" onkeypress="javascript: return OnlyNumbers(event)" MaxLength="10" minlength="10"></asp:TextBox>
                    <i class="uil uil-phone icon"></i>
                </div>
                    <asp:RequiredFieldValidator style="position:relative; top:10px;" ValidationGroup="Registration" runat="server" ControlToValidate="phone" ForeColor="Red" Display="Dynamic" Font-Italic="true" ErrorMessage="Phone number is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator style="position:relative; top:10px;" ValidationGroup="Registration" runat="server" ControlToValidate="phone" Display="Dynamic" Font-Italic="true" ForeColor="Red" ValidationExpression="(?:\+?0*?966)?0?5[0-9]{8}" ErrorMessage="Inavild phone number"></asp:RegularExpressionValidator>
                <div class="input-field button">
                    <asp:Button runat="server" OnClick="InsertWorkshop" Text="Sign Up" ValidationGroup="Registration" />
                </div>
                <div class="login-signup" id="login-signup">
                    <span class="text">Move to
                        <a runat="server" href="#" onserverclick="MoveToLogin" class="text signup-link">Login</a>
                    </span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
