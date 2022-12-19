<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="OwnerWorkshop.aspx.cs" Inherits="SPS.Views.Customer.OwnerWorkshop" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Global.css" />
    <!-- Render All Elements Normally -->
    <link rel="stylesheet" href="../../Css/Normalize.css" />
    <!-- Page Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/LR.css" />
    <!-- Page Template JavaScript File -->
    <script src="../../JavaScript/Customer/LR.js"></script>
    <!-- Start Pop -->
    <link href="../../Css/Admin/Pop.css" rel="stylesheet" />
    <!-- Start Alert Msg -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- End Pop -->
    <!-- jQuery version 1.11.2 Template Javascript File -->
    <script src="../../JavaScript/jQuery version 1.11.2.js"></script>
    <!-- Alert Msg -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Icons Template Css File -->
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
    <!-- Icons Template Css File -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <!-- Icons Template Css File -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- Start Jquery method to show photo -->
    <script src="http://code.jquery.com/jquery-1.11.3.js" type="text/javascript"></script>
    <!-- End Jquery method to show photo -->
    <!-- Start Jquery Validaion -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" integrity="sha512-yVvxUQV0QESBt1SyZbNJMAwyKvFTLMyXSyBHDO4BG5t7k/Lw34tyqlSDlKIrIENIzCl+RVUNjmCPG+V/GMesRw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- End Jquery Validaion -->
    <style>
        .container1 .form {
            width: 50%;
            height: 100%;
            padding: 30px;
            background-color: #fff;
            transition: margin-left 0.18s ease;
        }

        .container1 .forms {
            display: flex;
            align-items: center;
            height: 950px;
            width: 200%;
            transition: height 0.2s ease;
        }

        .Popup {
            background-color: black;
            opacity: 0.5;
        }

        .textbox1 {
            padding: 5px 10px;
            border: 1px solid var(--ThreedColor);
            border-radius: 4px;
            height: 36px;
            width: 146px;
            font-size: 14px;
            outline: none;
            position: relative;
            right: 11px;
            cursor: pointer;
            transform: translateX(11px);
        }

            .textbox1:focus {
                border: 1px solid var(--MainColor);
                color: var(--MainColor);
                transition: 0.1s;
            }
    </style>
    <script>
        //Start validation inside datalist
        function CheckWorkshopName(oName) {
            PageMethods.WorkshopNameChecker(oName.value, OnSucceeded1);
        }
        function OnSucceeded1(result, userContext, methodName) {
            var message = document.getElementById("NameCheck");
            if (methodName == "WorkshopNameChecker") {
                if (result == true) {
                    message.innerHTML = "Workshop name is not available.";
                }
                else {
                    message.innerHTML = "";
                }
            }
        }
        function CheckWorkshopPhone(oName) {
            PageMethods.PhoneWorkShopChecker(oName.value, OnSucceeded2);
        }
        function OnSucceeded2(result, userContext, methodName) {
            var message = document.getElementById("PhoneCheck");
            if (methodName == "PhoneWorkShopChecker") {
                if (result == true) {
                    message.innerHTML = "Workshop phone is not available.";
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
                    message.innerHTML = "Email is not available.";
                }
                else {
                    message.innerHTML = "";
                }
            }
        }
        function CheckWorkshopLicense(oName) {
            PageMethods.LicenseWorkShopChecker(oName.value, OnSucceeded4);
        }
        function OnSucceeded4(result, userContext, methodName) {
            if (methodName == "LicenseWorkShopChecker") {
                var message = document.getElementById("LicenseCheck");
                if (result == true) {
                    message.innerHTML = "Workshop licens is not available.";
                }
                else {
                    message.innerHTML = "";
                }
            }
        }
        //End validation inside datalist
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
        //Start show photo
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function ClearPreview(input) {
            $('#<%=Image1.ClientID%>').prop('src', '');
        }
        //End show photo
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <div class="Container" style="margin-top: 300px; margin-bottom: 100px;">
        <div class="container1">
            <div class="forms">
                <div class="form login">
                    <span class="title">Add Your Workshop</span>
                    <div class="input-field">
                        <asp:TextBox runat="server" placeholder="Workshop name ..." ID="NameTextBox" onkeypress="javascript: return Deatails(event)" MaxLength="35" OnChange="CheckWorkshopName(this)"></asp:TextBox>
                        <i class="fas fa-store"></i>
                    </div>
                    <span id="NameCheck" style="color: red;"></span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" ErrorMessage="Required field" ValidationGroup="Add" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <div class="input-field" style="border-bottom: 3px solid var(--MainColor);">
                        <asp:DropDownList runat="server" ID="User1" DataSourceID="SqlDataSource3" DataTextField="Username" DataValueField="ID" AppendDataBoundItems="true" Style="width: 215px;" CssClass="textbox1" Enabled="false">
                            <asp:ListItem Text="Please Select"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                    </div>
                    <div class="input-field">
                        <asp:TextBox runat="server" ID="PhoneTextBox" OnChange="CheckWorkshopPhone(this)" CssClass="textbox" Placeholder="Workshop phone ..." onkeypress="javascript: return OnlyNumbers(event)" MaxLength="10" minlength="10"></asp:TextBox>
                        <i class="fas fa-phone-alt"></i>
                    </div>
                    <span id="PhoneCheck" style="color: red;"></span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="Required field" ValidationGroup="Add" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="PhoneTextBox" ErrorMessage="Invalid phone" ValidationGroup="Add" ForeColor="Red" Display="Dynamic" Font-Italic="true" ValidationExpression="(?:\+?0*?966)?0?5[0-9]{8}"></asp:RegularExpressionValidator>
                    <div class="input-field">
                        <asp:TextBox runat="server" ID="EmailTextBox" CssClass="textbox" Placeholder="Workshop email ..." onkeypress="javascript: return Email(event)" OnChange="CheckWorkshopEmail(this)"></asp:TextBox>
                        <i class="far fa-envelope"></i>
                    </div>
                    <span id="EmailCheck" style="color:red;"></span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Required field" ValidationGroup="Add" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Invalid email" ForeColor="Red" ValidationGroup="Add" Font-Italic="true" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <div class="input-field">
                        <asp:TextBox runat="server" ID="LocationTextBox" CssClass="textbox" Placeholder="Workshop location ..." onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LocationTextBox" ErrorMessage="Required field" ValidationGroup="Add" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="LocationTextBox" ErrorMessage="Only character" ForeColor="Red" ValidationGroup="Add" Font-Italic="true" Display="Dynamic" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                    <div class="input-field">
                        <asp:TextBox runat="server" ID="LicenseTextBox" OnChange="CheckWorkshopLicense(this)" CssClass="textbox" Placeholder="Workshop license ..." onkeypress="javascript: return OnlyNumbers(event)" MaxLength="6" MinLength="1"></asp:TextBox>
                        <i class="far fa-id-badge"></i>
                    </div>
                    <span id="LicenseCheck" style="color:red;"></span>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LicenseTextBox" ErrorMessage="Required field" ValidationGroup="Add" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="LicenseTextBox" ErrorMessage="Only eight numbers" ForeColor="Red" ValidationGroup="Add" ValidationExpression="\d{1,6}" Font-Italic="true" Display="Dynamic"></asp:RegularExpressionValidator>

                    <div class="input-field" style="border-bottom: 3px solid var(--MainColor);">
                        <asp:DropDownList runat="server" ID="WorkshopCategory" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="WorkshopCategoryID" CssClass="textbox1" AppendDataBoundItems="True">
                            <asp:ListItem Value="0" Text="Please Select"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT * FROM [WorkshopCategory]"></asp:SqlDataSource>
                    </div>
                    <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="WorkshopCategory" ErrorMessage="Required field" ValidationGroup="Add" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
                    <div class="input-field" style="border-bottom: 3px solid var(--MainColor);">
                        <asp:LinkButton runat="server" ID="UploadImage">
                        <i class="uil uil-upload icon" style="left: 20px;">     File Upload</i></asp:LinkButton>
                    </div>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="FileUploadArea" ValidationExpression="(.*\.)(jpg|JPG|png|PNG)$" Display="Dynamic" ErrorMessage="only image" ValidationGroup="Add" ForeColor="Red" Font-Italic="true"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FileUploadArea" ErrorMessage="Photo is required" ValidationGroup="Add" Display="Dynamic" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
                    <div class="input-field button">
                        <input runat="server" type="button" value="Login Now" validationgroup="Add" onserverclick="InsertWorkshop">
                        <asp:FileUpload runat="server" ID="FileUploadArea" accept="image/*" onchange="ImagePreview(this);" Style="visibility: hidden; opacity: 0;" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Start Pop Extender For Save File -->
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="UploadImage" PopupControlID="Panel1" CancelControlID="CancelBtn" BackgroundCssClass="Popup"></cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" Style="width: 600px; height: 600px; background-color: white; border-radius: 5px; display: none;">
        <div class="Header" style="text-align: center; padding: 10px; background-color: var(--MainColor); border-radius: 5px 5px 0px 0px;">
            <h3 style="color: white;">Photo Of Workshop</h3>
        </div>
        <div class="container">
            <div class="wrapper">
                <div class="image">
                    <asp:Image runat="server" ID="Image1" alt="" />
                </div>
                <div class="content">
                    <div class="icon"><i class="fas fa-cloud-upload-alt"></i></div>
                    <div class="text">No photo chosen, yet!</div>
                </div>
                <div id="cancel-btn" style="left: 67px;"><a href="#" onclick="ClearPreview()" class="canel"><i class="fas fa-times"></i></a></div>
                <div class="file-name">File name here</div>
            </div>
            <input runat="server" type="button" id="FileUploadBtn1" value="Choose a file" />
        </div>
        <div class="footer">
            <asp:Button runat="server" Text="Cancel" ID="CancelBtn" CssClass="CancelBtn" />
        </div>
    </asp:Panel>
    <cc1:AnimationExtender ID="popupAnimation" runat="server" TargetControlID="UploadImage">
        <Animations>
            <OnClick>
                   <Parallel AnimationTarget="Panel1" 
                    Duration="0.3" Fps="25">
                    <FadeIn />                                        
                    <Move Horizontal="0" Vertical="0"></Move>
                    </Parallel> 
            </OnClick>
        </Animations>
    </cc1:AnimationExtender>
    <!-- End Pop Extender For Save File -->
</asp:Content>
