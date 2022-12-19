<%@ Page Title="Login" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="LoginRegistration.aspx.cs" Inherits="SPS.Views.Customer.LoginRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Global.css" />
    <!-- Render All Elements Normally -->
    <link rel="stylesheet" href="../../Css/Normalize.css" />
    <!-- Page Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/LR.css" />
    <!-- Page Template JavaScript File -->
    <script src="../../JavaScript/Customer/LR.js"></script>
    <!-- Start Alert Msg -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Container" style="margin-top: 300px;">
        <div class="container1">
            <div class="forms">
                <div class="form login">
                    <span class="title">Login</span>

                    <div class="input-field">
                        <asp:TextBox runat="server" placeholder="Enter your username" ID="Username"></asp:TextBox>
                        <i class="far fa-user"></i>
                    </div>
                    <div class="input-field">
                        <asp:TextBox runat="server" class="password" placeholder="Enter your password" type="Password" ID="Password"></asp:TextBox>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>
                    <asp:Label runat="server" ID="MSG" ForeColor="Red" Style="position: relative; top: 10px;"></asp:Label>

                    <div class="input-field button">
                        <input runat="server" type="button" value="Login Now" onserverclick="MoveToHome">
                    </div>

                    <div class="login-signup" id="login-signup">
                        <span class="text">Not a member?
                        <a runat="server" href="#" onserverclick="MoveToRegistration" class="text signup-link">Signup now</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const container = document.querySelector(".container"),
                pwShowHide = document.querySelectorAll(".showHidePw"),
                pwFields = document.querySelectorAll(".password"),
                login = document.querySelector(".login-link");
            var signUp = document.getElementById("signup-link");
            //   js code to show/hide password and change icon
            pwShowHide.forEach(eyeIcon => {
                eyeIcon.addEventListener("click", () => {
                    pwFields.forEach(pwField => {
                        if (pwField.type === "password") {
                            pwField.type = "text";

                            pwShowHide.forEach(icon => {
                                icon.classList.replace("uil-eye-slash", "uil-eye");
                            })
                        } else {
                            pwField.type = "password";

                            pwShowHide.forEach(icon => {
                                icon.classList.replace("uil-eye", "uil-eye-slash");
                            })
                        }
                    })
                })
            })


            // js code to appear signup and login form
            signUp.addEventListener("click", () => {
                container.classList.add("active");
            });
            login.addEventListener("click", () => {
                container.classList.remove("active");
            });
            function ToggleBtnCircle() {
                document.getElementById("login-signup").classList.add("active");
            }
        </script>
    </div>
</asp:Content>
