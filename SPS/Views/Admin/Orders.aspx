<%@ Page Title="Orders" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="SPS.Views.Admin.Orders" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
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
    <!-- End Jquery Validaion -->
    <!-- Start Pop -->
    <link href="../../Css/Admin/Pop.css" rel="stylesheet" />
    <!-- End Pop -->
    <!-- Start Css inside -->
    <style>
        .Popup {
            background-color: black;
            opacity: 0.5;
        }

        .show {
            transform: translateY(45px);
            opacity: 1;
            visibility: visible;
            position: relative;
            margin-bottom: 170px;
        }
        .show1 {
            transform: translateY(75px);
            opacity: 1;
            visibility: visible;
            position: relative;
            margin-bottom: 100px;
        }
        #a {
            position: absolute;
            top: 83px;
            left: 0px;
            display: inline-block !important;
        }
        .ProductName {
            width: 90%;
            border: 2px solid #000;
            border-radius: 4px;
            margin: 8px 0;
            outline: none;
            padding: 8px;
            box-sizing: border-box;
            transition: 0.3s;
        }
        .ProductName:focus {
            border-color: var(--MainColor);
            box-shadow: 0 0 8px 0 var(--MainColor);
        }
        .inputWithIcon input[type="text"] {
            padding-left: 60px;
            font-size: 14px;
        }
        .inputWithIcon {
            position:relative;
        }
        .inputWithIcon i {
            position: absolute;
            left: 0;
            top: 8px;
            padding: 9px 8px;
            color: #aaa;
            transition: 0.3s;
        }
        .inputWithIcon.inputIconBg i {
            background-color: #000;
            color: #fff;
            padding: 10px 5px;
            border-radius: 4px 0 0 4px;
            height: 40px;
            width: 50px;
        }
        .inputWithIcon.inputIconBg input[type="text"]:focus + i {
            color: #fff;
            background-color: var(--MainColor);
        }
    </style>
    <!-- End css inside -->
    <!-- Strat Javascript inside -->
    <script type="text/javascript">
        //Start Checkbox count
        function checkboxes() {
            var inputElems = document.getElementsByTagName("input");
            var count = 0;
            for (var i = 0; i < inputElems.length; i++) {
                if (inputElems[i].type === "checkbox" && inputElems[i].checked === true) {
                    count++;
                } else if (<%=selected.Text%> == "0") {
                    document.getElementById('<%= Counter.ClientID%>').classList.add("show1");
                }
            }
            document.getElementById('<%= Counter.ClientID%>').classList.add("show1");
            document.getElementById('<%=selected.ClientID%>').innerHTML = count;
        }
        //End Checkbox count
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
    <!-- End Javascript inside -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <!-- Start Title -->
    <div class="title" data-aos="zoom-in-up" data-aos-delay="300">
        <asp:HiddenField runat="server" ID="Products2" Value="Orders" Visible="false" />
        <asp:HiddenField runat="server" ID="WorkshopsPage" Value="Orders" Visible="false" />
        <asp:HiddenField runat="server" ID="Orders1" Value="Orders" Visible="false" />
        <asp:HiddenField runat="server" ID="Dashboard1" Value="Orders" Visible="false" />
        <h1>Orders</h1>
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
        <div runat="server" id="Counter" class="Counter">
            <p>
                <span>Workshop Selected : </span>
                <asp:Label runat="server" ID="selected">0</asp:Label>
            </p>
        </div>
        <!-- End Counter -->
        <!-- Start Container For The product -->
        <div id="products_div" class="grid-block main_content list" style="grid-template-columns: repeat(auto-fill,minmax(1%,1fr)); margin-top: 100px;">
            <!-- Start ListItem -->
            <asp:DataList runat="server" ID="DataList1">
                <ItemTemplate>
                    <asp:Label runat="server" Visible="false" ID="ID" Text='<%#Eval("OrderID") %>'></asp:Label>
                    <div class="animation" data-aos="zoom-in-up" data-aos-delay="300">
                        <asp:CheckBox ID="DeleteMultiple" runat="server" onclick="checkboxes()" />
                        <div class="Workshop2" id="Workshop2" style="height: 180px;">
                            <div class="Image">
                                <asp:ImageButton runat="server" ID="WorkshopImage1" CssClass="ImageWorkshop1" Enabled="false" ImageUrl='<%#Eval("Pimage") %>' />
                            </div>
                            <div class="Name1" style="bottom: 86px; left: 163px; position: relative;">
                                <asp:TextBox runat="server" ID="ProductName" CssClass="NameTextBox" Placeholder="Product Name..." Style="padding: 20px 40px;" Enabled="false" onkeypress="javascript: return OnlyLettersAndSpaces(event)" MaxLength="35" Text='<%#Eval("Pname") %>'></asp:TextBox>
                                <i class="fas fa-box-open" style="transform: translateX(-1119px)"></i>
                            </div>
                            <br />
                            <div class="tools">
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="FirstName" CssClass="textbox" Enabled="false" Placeholder="First name..." MaxLength="13" minlength="10" Text='<%#Eval("Fname") %>'></asp:TextBox>
                                    <i class="fas fa-user-tie"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="LastName" CssClass="textbox" Enabled="false" Placeholder="Last name..." Text='<%#Eval("Lname") %>'></asp:TextBox>
                                    <i class="fas fa-user-tie"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Username" CssClass="textbox" Enabled="false" Placeholder="Username..." Text='<%#Eval("Username") %>'></asp:TextBox>
                                    <i class="far fa-user"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Phone" CssClass="textbox" Enabled="false" Placeholder="Phone..." Text='<%#Eval("Phone") %>'></asp:TextBox>
                                    <i class="fas fa-phone-alt"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:DropDownList runat="server" ID="OrderStatus" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="StatusID" CssClass="textbox1" Enabled="false" Style="cursor: default" Text='<%#Eval("StatusID") %>'></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT StatusID,Name FROM Status iner SELECT StatusID FROM Orders"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="Buttons1" style="grid-gap: 40px;">
                                <input runat="server" value="Edit" onserverclick="Edit" class="Cancel" type="button" />
                                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="Save" ValidationGroup="Update" CommandName="Update" Enabled="false" Style="cursor: default">Update</asp:LinkButton>
                                <asp:HiddenField ID="Hidden" runat="server" Value='<%#Container.ItemIndex+1 %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label runat="server" Visible="false" ID="ID" Text='<%#Eval("OrderID") %>'></asp:Label>
                    <div class="animation" data-aos="zoom-in-up" data-aos-delay="300">
                        <asp:CheckBox ID="DeleteMultiple" runat="server" onclick="checkboxes()" />
                        <div class="Workshop2" id="Workshop2" style="height: 180px;">
                            <div class="Image">
                                <asp:ImageButton runat="server" ID="WorkshopImage1" CssClass="ImageWorkshop1" Enabled="true" ImageUrl='<%#Eval("Pimage") %>' />
                            </div>
                            <div class="Name1" style="bottom: 86px; left: 163px; position: relative;">
                                <asp:TextBox runat="server" ID="ProductName" CssClass="NameTextBox" Style="padding: 20px 40px;" Enabled="false" Placeholder="Product name..." OnChange="CheckWorkshopName(this)" onkeypress="javascript: return OnlyLettersAndSpaces(event)" MaxLength="35" Text='<%#Eval("Pname") %>'></asp:TextBox>
                                <i class="fas fa-box-open" style="transform: translateX(-1119px)"></i>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductName" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <br />
                            <div class="tools">
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="FirstName" CssClass="textbox" Enabled="true" Placeholder="First name..." onkeypress="javascript: return OnlyLetters(event)" Text='<%#Eval("Fname") %>'></asp:TextBox>
                                    <i class="fas fa-user-tie"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="LastName" CssClass="textbox" Enabled="true" Placeholder="Last name..." onkeypress="javascript: return OnlyLetters(event)" Text='<%#Eval("Lname") %>'></asp:TextBox>
                                    <i class="fas fa-user-tie"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Username" CssClass="textbox" Enabled="false" Placeholder="Username..." Text='<%#Eval("Username") %>'></asp:TextBox>
                                    <i class="far fa-user"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Username" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="Phone" CssClass="textbox" Enabled="true" Placeholder="Phone..." onkeypress="javascript: return OnlyNumbers(event)" Text='<%#Eval("Phone") %>' MaxLength="10" minlength="10"></asp:TextBox>
                                    <i class="fas fa-phone-alt"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="Phone" ErrorMessage="Invalid phone" ValidationGroup="Update" ForeColor="Red" Display="Dynamic" Font-Italic="true" ValidationExpression="(?:\+?0*?966)?0?5[0-9]{8}"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:DropDownList runat="server" ID="OrderStatus" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="StatusID" CssClass="textbox1" Enabled="true" Style="cursor: default" Text='<%#Eval("StatusID") %>'></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT StatusID,Name FROM Status iner SELECT StatusID FROM Orders"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="OrderStatus" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="Buttons1" style="grid-gap: 40px;">
                                <asp:DropDownList runat="server" ID="DropDownListChose" CssClass="Cancel" AutoPostBack="true" OnSelectedIndexChanged="Delete" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0" Text="More"></asp:ListItem>
                                    <asp:ListItem>Cancel</asp:ListItem>
                                    <asp:ListItem ID="Delete" style="color: red;">Delete</asp:ListItem>
                                </asp:DropDownList>
                                <asp:LinkButton runat="server" ID="Update" CssClass="Save" ValidationGroup="Update" OnClick="LinkButton1_Click">Update</asp:LinkButton>
                                <asp:HiddenField ID="Hidden" runat="server" Value='<%#Container.ItemIndex+1 %>' />
                            </div>
                        </div>
                    </div>
                    <!-- Start Pop Extender For Save File -->
                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="WorkshopImage1" PopupControlID="Panel1" CancelControlID="CancelBtn" BackgroundCssClass="Popup"></cc1:ModalPopupExtender>
                    <asp:Panel ID="Panel1" runat="server" Style="width: 600px; height: 600px; background-color: white; border-radius: 5px; display:none;" onclick="openFileUpload()">
                        <div class="Header" style="text-align: center; padding: 10px; background-color: var(--MainColor); border-radius: 5px 5px 0px 0px;">
                            <h3 style="color: white;">Order Details</h3>
                        </div>
                        <div class="container">
                            <div class="inputWithIcon inputIconBg">
                                <asp:TextBox runat="server" placeholder="Your product name..." ID="Pname" Enabled="false" value='<%#Eval("Pname") %>' CssClass="ProductName"></asp:TextBox>
                                <i class="fas fa-box-open fa-lg fa-fw" aria-hidden="true"></i>
                            </div>
                            <div class="inputWithIcon inputIconBg">
                                <asp:TextBox runat="server" placeholder="Your neighborhood..." ID="neighborhood" value='<%#Eval("neighborhood") %>' CssClass="ProductName" onkeypress="javascript: return Deatails(event)"></asp:TextBox>
                                <i class="fas fa-map-marker-alt fa-lg fa-fw" aria-hidden="true"></i>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="neighborhood" ErrorMessage="required" Font-Italic="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="inputWithIcon inputIconBg">
                                <asp:TextBox runat="server" placeholder="Your Street..." ID="Street" value='<%#Eval("Street") %>' CssClass="ProductName" onkeypress="javascript: return Deatails(event)"></asp:TextBox>
                                <i class="fas fa-road fa-lg fa-fw" aria-hidden="true"></i>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Street" ErrorMessage="required" Font-Italic="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="inputWithIcon inputIconBg">
                                <asp:TextBox runat="server" placeholder="Your zip code..." ID="ZipCode" value='<%#Eval("ZipCode") %>' CssClass="ProductName" onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                                <i class="fas fa-house-user fa-lg fa-fw" aria-hidden="true"></i>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ZipCode" ErrorMessage="required" Font-Italic="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="inputWithIcon inputIconBg">
                                <asp:TextBox runat="server" placeholder="Your Price..." ID="Pprice" Enabled="false" value='<%#Eval("Pprice") %>' CssClass="ProductName"></asp:TextBox>
                                <i class="fas fa-dollar-sign fa-lg fa-fw" aria-hidden="true"></i>
                            </div>
                            <div class="inputWithIcon inputIconBg">
                                <asp:TextBox runat="server" placeholder="Your quantity..." ID="Pqty" Enabled="false" value='<%#Eval("Pqty") %>' CssClass="ProductName"></asp:TextBox>
                                <i class="fas fa-boxes fa-lg fa-fw" aria-hidden="true"></i>
                            </div>
                            <div class="inputWithIcon inputIconBg">
                                <asp:TextBox runat="server" placeholder="date order..." ID="TextBox1" Enabled="false" value='<%#Eval("DateBuy") %>' CssClass="ProductName"></asp:TextBox>
                                <i class="far fa-clock fa-lg fa-fw" aria-hidden="true"></i>
                            </div>                        </div>
                        <div style="background-color: var(--MainColor); padding: 10px; position: relative; top: 155px;">
                            <asp:Button runat="server" Text="Cancel" ID="CancelBtn" CssClass="CancelBtn" />
                        </div>
                    </asp:Panel>
                    <cc1:AnimationExtender ID="popupAnimation" runat="server" TargetControlID="WorkshopImage1">
                        <Animations>
                        <OnClick>
                            <Parallel AnimationTarget="Panel1" Duration="0.3" Fps="25">
                            <FadeIn />                                        
                            <Move Horizontal="0" Vertical="0"></Move>
                            </Parallel> 
                        </OnClick>
                        </Animations>
                    </cc1:AnimationExtender>
                    <!-- End Pop Extender For Save File -->
                </EditItemTemplate>
            </asp:DataList>
            <div runat="server" id="OrdersDiv" visible="false" style="margin: 0px 0; text-align: center; position:absolute; left:1000px;" data-aos="fade-up" data-aos-delay="300">
                <i class="fas fa-shopping-cart" style="color: var(--MainColor); display: block; font-size: 60px; margin-bottom: 30px;"></i>
                <h4 style="color: var(--MainColor); font-size: 20px; font-weight: 700; margin: 0 auto; max-width: 75%;">There are no orders</h4>
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
