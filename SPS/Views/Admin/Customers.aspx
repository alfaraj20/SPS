<%@ Page Title="Customers" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Customers.aspx.cs" Inherits="SPS.Views.Admin.Customers" %>

<%@ MasterType VirtualPath="~/Dashboard.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Global Template Css File -->
    <link rel="stylesheet" href="Css/Global.css" />
    <!-- Global Template Css File -->
    <link rel="stylesheet" href="Css/Global.css" />
    <!-- Global Template Javascript File -->
    <script src="../../JavaScript/Global.js"></script>
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Admin/WorkShop.css" />
    <!-- Animation Files -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <!-- Main Template Javascript File -->
    <script src="../../JavaScript/Admin/Workshop.js"></script>
    <!-- Alert Msg -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Icons Template Css File -->
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
    <!-- Icons Template Css File -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <!-- Icons Template Css File -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- Start Pop -->
    <link href="../../Css/Admin/Pop.css" rel="stylesheet" />
    <!-- End Pop -->
    <!-- Start Css inside -->
    <style>
        .Popup {
            background-color: black;
            opacity: 0.5;
        }

        .error {
            color: red;
            font-style: italic;
            border-color: Red !important;
            display: none;
        }

        .show {
            transform: translateY(45px);
            opacity: 1;
            visibility: visible;
            position: relative;
            margin-bottom: 170px;
        }

        label.error {
            color: red;
            font-size: 0.95rem;
        }

        .errorClass {
            border: 1px solid red;
        }

        .has-error {
            padding-bottom: 165px;
            transition: 0s;
        }

        #a {
            position: absolute;
            top: 83px;
            left: 0px;
            display: inline-block !important;
        }

        .title errorClass {
            background-color: aqua !important;
        }

        .custom-file-input {
            color: transparent;
            border-radius: 25px;
            width: 100%;
            cursor: pointer;
            margin-top: 30px;
            height: 50px;
            background: var(--MainColor);
        }

            .custom-file-input::-webkit-file-upload-button {
                visibility: hidden;
            }

            .custom-file-input::before {
                content: 'Choose a file';
                color: #fff;
                display: inline-block;
                padding: 5px 8px;
                outline: none;
                cursor: pointer;
                font-weight: 500;
                font-size: 18px;
                text-transform: uppercase;
                letter-spacing: 1px;
                top: 0;
                left: 50%;
                transform: translate(74%, 6px);
            }

            .custom-file-input:active {
                outline: 0;
            }
    </style>
    <!-- End Css inside -->
    <!-- Start javascript inside -->
    <script type="text/javascript">
        //Start Checkbox count
        function checkboxes() {
            var inputElems = document.getElementsByTagName("input");
            var count = 0;
            for (var i = 0; i < inputElems.length; i++) {
                if (inputElems[i].type === "checkbox" && inputElems[i].checked === true) {
                    count++;
                } else if (<%=selected.Text%> == "0") {
                    document.getElementById('<%= Counter.ClientID%>').classList.add("show");
                }
            }
            document.getElementById('<%= Counter.ClientID%>').classList.add("show");
            document.getElementById('<%=selected.ClientID%>').innerHTML = count;
        }
        //End Checkbox count
        //Start validation inside datalist
        function CheckUsername(oName) {
            PageMethods.UserNameChecker(oName.value, OnSucceeded1);
        }
        function OnSucceeded1(result, userContext, methodName) {

            if (methodName == "UserNameChecker") {
                if (result == true) {
                    alert("Username is not available")
                }
            }
        }
        function CheckPhone(oName) {
            PageMethods.PhoneChecker(oName.value, OnSucceeded2);
        }
        function OnSucceeded2(result, userContext, methodName) {

            if (methodName == "PhoneChecker") {
                if (result == true) {
                    alert("Phone is not available")
                }
            }
        }
        function CheckEmail(oName) {
            PageMethods.EmailChecker(oName.value, OnSucceeded3);
        }
        function OnSucceeded3(result, userContext, methodName) {

            if (methodName == "EmailChecker") {
                if (result == true) {
                    alert("Workshop email is not available")
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
    </script>
    <!-- End javascript inside -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <!-- Start Title -->
    <div class="title" data-aos="zoom-in-up" data-aos-delay="300">
        <asp:HiddenField runat="server" ID="Products2" Value="Customers" Visible="false" />
        <asp:HiddenField runat="server" ID="WorkshopsPage" Value="Customers" Visible="false" />
        <asp:HiddenField runat="server" ID="Orders1" Value="Customers" Visible="false" />
        <asp:HiddenField runat="server" ID="CustomersPage1" Value="Customers" Visible="false" />
        <asp:HiddenField runat="server" ID="Dashboard1" Value="Customers" Visible="false" />
        <h1>Customers</h1>
    </div>
    <!-- End Title -->
    <div class="Container1">
        <!-- Start Controls -->
        <div class="view-control" data-aos="zoom-in-up" data-aos-delay="300">
            <asp:LinkButton runat="server" OnClick="CheckBox" CssClass="btn" Style="margin: 20px;">
                <span>Delete</span>
                <span>
                    <i class="fas fa-trash-alt" style="padding: 0 10px;"></i>
                </span>
            </asp:LinkButton>
        </div>
        <!-- End Controls -->
        <!-- Start Counter -->
        <div runat="server" id="Counter" class="Counter2">
            <p>
                <span>Customers Selected : </span>
                <asp:Label runat="server" ID="selected">0</asp:Label>
            </p>
        </div>
        <!-- End Counter -->
        <!-- Start Container For The workshop -->
        <div runat="server" id="products_div" class="grid-block main_content list" style="grid-template-columns: repeat(auto-fill,minmax(1%,1fr)); margin-top: 100px;">
            <!-- Start ListItem -->
            <asp:DataList runat="server" ID="DataList1">
                <ItemTemplate>
                    <asp:Label runat="server" Visible="false" ID="ID" Text='<%#Eval("ID") %>'></asp:Label>
                    <div class="animation" data-aos="zoom-in-up" data-aos-delay="300">
                        <asp:CheckBox ID="DeleteMultiple" runat="server" onclick="checkboxes()" />
                        <div class="Workshop2" id="Workshop2" style="width: 1335px; height: 180px; margin-bottom: 34px;">
                            <div class="Name" style="left: 34px; top: 18px;">
                                <asp:TextBox runat="server" ID="Username" CssClass="NameTextBox" Enabled="false" MaxLength="35" Text='<%#Eval("Username") %>'></asp:TextBox>
                                <i class="far fa-user" style="position: absolute; top: 10px; left: 15px;"></i>
                            </div>
                            <br />
                            <div class="tools" style="left: 34px; top: 27px;">
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Phone" CssClass="textbox" Enabled="false" MaxLength="13" minlength="10" Text='<%#Eval("Phone") %>' onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                                    <i class="fas fa-phone-alt"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Email" CssClass="textbox" Enabled="false" Text='<%#Eval("Email") %>' onkeypress="javascript: return Email(event)"></asp:TextBox>
                                    <i class="far fa-envelope"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Fname" CssClass="textbox" Enabled="false" Text='<%#Eval("Fname") %>' onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                                    <i class="fas fa-user-tie"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Lname" CssClass="textbox" Enabled="false" Text='<%#Eval("Lname") %>' onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                                    <i class="fas fa-user-tie"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:DropDownList runat="server" ID="UserType" DataSourceID="SqlDataSource2" DataTextField="UserNameManagement" DataValueField="UserIDManagement" CssClass="textbox1" Enabled="false" Style="cursor: default" Text='<%#Eval("UserType") %>'></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT UserIDManagement,UserNameManagement FROM ManagementUsers iner SELECT UserType FROM Users"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="Buttons1">
                                <input runat="server" value="Edit" onserverclick="Edit" class="Cancel" type="button" />
                                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="Save" ValidationGroup="Update" CommandName="Update" Enabled="false" Style="cursor: default">Update</asp:LinkButton>
                                <asp:HiddenField ID="Hidden" runat="server" Value='<%#Container.ItemIndex+1 %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label runat="server" Visible="false" ID="ID" Text='<%#Eval("ID") %>'></asp:Label>
                    <div class="animation" data-aos="zoom-in-up" data-aos-delay="300">
                        <asp:CheckBox ID="DeleteMultiple" runat="server" onclick="checkboxes()" />
                        <div class="Workshop2" id="Workshop2" style="width: 1335px; height: 180px; margin-bottom: 34px;">
                            <div class="Name" style="left: 34px; top: 18px;">
                                <asp:TextBox runat="server" ID="Username" CssClass="NameTextBox" Placeholder="Username..." Enabled="false" MaxLength="35" Text='<%#Eval("Username") %>' OnChange="CheckUsername(this)"></asp:TextBox>
                                <i class="far fa-user" style="position: absolute; top: 10px; left: 15px;"></i>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Username" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="Username" ErrorMessage="Not allowed" ForeColor="Red" ValidationGroup="Update" Font-Italic="true" Display="Dynamic" ValidationExpression="^[A-Za-z][A-Za-z0-9_]{7,29}$"></asp:RegularExpressionValidator>
                            </div>
                            <br />
                            <div class="tools" style="left: 34px; top: 27px;">
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Phone" CssClass="textbox" Placeholder="Phone..." MaxLength="13" minlength="10" Text='<%#Eval("Phone") %>' OnChange="CheckPhone(this)" onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                                    <i class="fas fa-phone-alt"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="Phone" ErrorMessage="Invalid phone" ValidationGroup="Update" ForeColor="Red" Display="Dynamic" Font-Italic="true" ValidationExpression="(?:\+?0*?966)?0?5[0-9]{8}"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Email" CssClass="textbox" Placeholder="Email..." Text='<%#Eval("Email") %>' OnChange="CheckEmail(this)" onkeypress="javascript: return Email(event)"></asp:TextBox>
                                    <i class="far fa-envelope"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="Email" ErrorMessage="Invalid email" ForeColor="Red" ValidationGroup="Update" Font-Italic="true" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Fname" CssClass="textbox" Placeholder="First name..." Text='<%#Eval("Fname") %>' onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                                    <i class="fas fa-user-tie"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Fname" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="Fname" ErrorMessage="Only character" ForeColor="Red" ValidationGroup="Update" Font-Italic="true" Display="Dynamic" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Lname" CssClass="textbox" Placeholder="Last name..." Text='<%#Eval("Lname") %>' onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                                    <i class="fas fa-user-tie"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Lname" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="Lname" ErrorMessage="Only character" ForeColor="Red" ValidationGroup="Update" Font-Italic="true" Display="Dynamic" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:DropDownList runat="server" ID="UserType" DataSourceID="SqlDataSource2" DataTextField="UserNameManagement" DataValueField="UserIDManagement" CssClass="textbox1" Style="cursor: default" Text='<%#Eval("UserType") %>'></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT UserIDManagement,UserNameManagement FROM ManagementUsers iner SELECT UserType FROM Users"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserType" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="Buttons1">
                                <asp:DropDownList runat="server" ID="DropDownListChose" CssClass="Cancel" AutoPostBack="true" OnSelectedIndexChanged="Delete" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0" Text="More"></asp:ListItem>
                                    <asp:ListItem>Cancel</asp:ListItem>
                                    <asp:ListItem ID="Delete" style="color: red;">Delete</asp:ListItem>
                                </asp:DropDownList>
                                <asp:LinkButton runat="server" ID="Update" CssClass="Save" ValidationGroup="Update" OnClick="UpdateUsers">Update</asp:LinkButton>
                                <asp:HiddenField ID="Hidden" runat="server" Value='<%#Container.ItemIndex+1 %>' />
                            </div>
                        </div>
                    </div>
                </EditItemTemplate>
            </asp:DataList>
            <div runat="server" id="UsernameCustomers" visible="false" style="margin: 0px 0; text-align: center; position:absolute; left:1000px;" data-aos="fade-up" data-aos-delay="300">
                <i class="fas fa-users" style="color: var(--MainColor); display: block; font-size: 60px; margin-bottom: 30px;"></i>
                <h4 style="color: var(--MainColor); font-size: 20px; font-weight: 700; margin: 0 auto; max-width: 75%;">There are no customers</h4>
            </div>
            <!-- End ListItem -->
        </div>
    </div>
    <!-- Start Animation -->
    <script>
        AOS.init({
            delay: 300,
        });
    </script>
    <!-- End Animation -->
</asp:Content>
