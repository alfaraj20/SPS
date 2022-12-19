<%@ Page Title="Workshop" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="WorkShop.aspx.cs" Inherits="SPS.Views.Admin.WorkShop" %>

<%@ MasterType VirtualPath="~/Dashboard.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css" integrity="sha512-yVvxUQV0QESBt1SyZbNJMAwyKvFTLMyXSyBHDO4BG5t7k/Lw34tyqlSDlKIrIENIzCl+RVUNjmCPG+V/GMesRw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            margin-bottom:208px;
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
        .chosen-container {
            position: relative;
            display: inline-block;
            vertical-align: middle;
            font-size: 14px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        .chosen-container .chosen-results {
            color: var(--MainColor);
            position: relative;
            overflow-x: hidden;
            overflow-y: auto;
            margin: 0 4px 4px 0;
            padding: 0 0 0 4px;
            max-height: 240px;
            -webkit-overflow-scrolling: touch;
        }
        .chosen-container-single .chosen-single {
            position: relative;
            display: block;
            overflow: hidden;
            padding: 5px 10px;
            height: 36px;
            border: 1px solid var(--ThreedColor);
            border-radius: 4px;
            background-color: #702929;
            font-size: 14px;
            background: transparent;
            background: transparent;
            background-clip: padding-box;
            -webkit-box-shadow: none;
            box-shadow: none;
            color: var(--ThreedColor);
            text-decoration: none;
            white-space: nowrap;
            line-height: 24px;
        }
        .chosen-container .chosen-results {
            color: var(--MainColor);
            position: relative;
             overflow-x: hidden; 
            overflow-y: auto; 
            margin: 0 4px 4px 0;
            padding: 0 0 0 4px;
            max-height: 60px;
            -webkit-overflow-scrolling: touch;
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

        .chosen-container .chosen-results::-webkit-scrollbar {
            width: 3px;
        }

        .chosen-container .chosen-results::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 10px #BDDAE0;
        }

        .chosen-container .chosen-results::-webkit-scrollbar-thumb {
            background-color: var(--MainColor);
        }
        .chosen-results ul:hover {
            background:var(--MainColor)
        }
        select:invalid {
            height: 0px !important;
            opacity: 0 !important;
            position: absolute !important;
            display: flex !important;
        }

            select:invalid[multiple] {
                margin-top: 15px !important;
            }
    </style>
    <!-- End Css inside -->
    <!-- Start javascript inside -->
    <script type="text/javascript">
        //Start show photo
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result);
                    $('#<%=WorkshopImage.ClientID%>').prop('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function ImagePreview1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('[id*=DataList1] [id*=Image1]').prop('src', e.target.result);
                    $('[id*=DataList1] [id*=WorkshopImage1]').prop('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function ClearPreview1(input) {
            $('[id*=DataList1] [id*=Image1]').prop('src', '');
            $('[id*=DataList1] input[id*=WorkshopImage1]').prop('src', '../../Images/Admin/Default/placeholder.png');
        }
        function ClearPreview(input) {
            $('#<%=Image1.ClientID%>').prop('src', '');
            $('#<%=WorkshopImage.ClientID%>').prop('src', '../../Images/Admin/Default/placeholder.png');
        }
        //End show photo
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
        const FileUploadArea = document.getElementById('#ContentPlaceHolder1_FileUploadArea');
        const FileUploadBtn = document.getElementById("#ContentPlaceHolder1_FileUploadBtn");
        const img = document.querySelector("img");

        function FileUploadAreaActive() {
            FileUploadArea.click();
        }
        FileUploadArea.addEventListener("change", function () {
            const file = this.file[0];
            FileReader.onload = function () {
                const result = FileReader.result;
                img.src = result;
            }
            reader.readAsDataURL(file);
        });
        //Start validation inside datalist
        function CheckWorkshopName(oName) {
            PageMethods.WorkshopNameChecker(oName.value, OnSucceeded1);
        }
        function OnSucceeded1(result, userContext, methodName) {

            if (methodName == "WorkshopNameChecker") {
                if (result == true) {
                    alert("Workshop name is not available")
                }
            }
        }
        function CheckWorkshopPhone(oName) {
            PageMethods.PhoneWorkShopChecker(oName.value, OnSucceeded2);
        }
        function OnSucceeded2(result, userContext, methodName) {

            if (methodName == "PhoneWorkShopChecker") {
                if (result == true) {
                    alert("Workshop phone is not available")
                }
            }
        }
        function CheckWorkshopEmail(oName) {
            PageMethods.EmailWorkShopChecker(oName.value, OnSucceeded3);
        }
        function OnSucceeded3(result, userContext, methodName) {

            if (methodName == "EmailWorkShopChecker") {
                if (result == true) {
                    alert("Workshop email is not available")
                }
            }
        }
        function CheckWorkshopLicense(oName) {
            PageMethods.LicenseWorkShopChecker(oName.value, OnSucceeded4);
        }
        function OnSucceeded4(result, userContext, methodName) {

            if (methodName == "LicenseWorkShopChecker") {
                if (result == true) {
                    alert("Workshop licens is not available")
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
        $(function () {
            $("#<%=User1.UniqueID%>").chosen();
            $.validator.setDefaults({ ignore: ":hidden:not(select)" })
            $("#signupForm").validate({
                rules: { chosen: "required" },
                message: { chosen: "Select a Country" }
            });
        });
        $(this).find(".canel").click(function () {
            xhr.abort();
        });
    </script>
    <!-- End javascript inside -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <!-- Start Title -->
    <div class="title" data-aos="zoom-in-up" data-aos-delay="300">
        <asp:HiddenField runat="server" ID="WorkshopsPage" Value="Workshops" Visible="false" />
        <asp:HiddenField runat="server" ID="Dashboard1" Value="Workshops" Visible="false" />
        <h1>Workshops</h1>
    </div>
    <!-- End Title -->
    <div class="Container1">
        <!-- Start Controls -->
        <div class="view-control" data-aos="zoom-in-up" data-aos-delay="300">
            <button onclick="ToggleBtn()" type="button" class="btn">
                <span>Add Workshop</span>
                <span>
                    <i class="fas fa-plus-circle" style="padding: 0 10px;"></i>
                </span>
            </button>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:Button runat="server" OnClientClick="ToggleBtn()" Text="Update panl" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button runat="server" OnClientClick="ToggleBtn()" Text="Noraml" />
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
        <!-- Start Container For The workshop -->
        <div id="products_div" class="grid-block main_content list">
            <!-- Start Template For workshop -->
            <div class="Workshop" id="Workshop">
                <button type="button" onclick="ToggleBtnCircle()" class="fas fa-times btn-delete-circle btn-delete-product"><i class="sicon-cancel"></i></button>
                <div class="Image">
                    <asp:ImageButton runat="server" ID="WorkshopImage" CssClass="ImageWorkshop" ImageUrl="~/Images/Admin/Default/placeholder.png" />
                </div>
                <label id="ContentPlaceHolder1_FileUploadArea-error" class="error" for="ContentPlaceHolder1_FileUploadArea" style="position: absolute; left: 65px;"></label>
                <div class="Name">
                    <asp:TextBox runat="server" ID="NameTextBox" style="width: 880px;" CssClass="NameTextBox" Placeholder="Workshop name ..." name="Name" onkeypress="javascript: return Deatails(event)" MaxLength="35" OnChange="CheckWorkshopName(this)"></asp:TextBox>
                    <i class="fas fa-store"></i>
                    <label id="ContentPlaceHolder1_NameTextBox-error" class="error" for="ContentPlaceHolder1_NameTextBox"></label>
                    <div class="user" style="position: absolute;top: 0px;left: 912px;">
                        <asp:DropDownList runat="server" ID="User1" DataSourceID="SqlDataSource3" DataTextField="Username" DataValueField="ID" AppendDataBoundItems="true" Style="width: 215px;" CssClass="textbox1">
                            <asp:ListItem Text="Please Select"></asp:ListItem>
                        </asp:DropDownList>
                        <label id="ContentPlaceHolder1_User1-error" class="error" for="ContentPlaceHolder1_User1"></label>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                    </div>
                    <script type="text/javascript">
                        $('#<%=User1.ClientID%>').chosen();
                    </script>
                </div>
                <div class="tools">
                    <div class="TextBoxContainer">
                        <asp:TextBox runat="server" ID="PhoneTextBox" OnChange="CheckWorkshopPhone(this)" CssClass="textbox" Placeholder="Workshop phone ..." onkeypress="javascript: return OnlyNumbers(event)" MaxLength="10" minlength="10"></asp:TextBox>
                        <i class="fas fa-phone-alt"></i>
                        <label id="ContentPlaceHolder1_PhoneTextBox-error" class="error" for="ContentPlaceHolder1_PhoneTextBox"></label>
                    </div>
                    <div class="TextBoxContainer">
                        <asp:TextBox runat="server" ID="EmailTextBox" CssClass="textbox" Placeholder="Workshop email ..." onkeypress="javascript: return Email(event)" OnChange="CheckWorkshopEmail(this)"></asp:TextBox>
                        <i class="far fa-envelope"></i>
                        <label id="ContentPlaceHolder1_EmailTextBox-error" class="error" for="ContentPlaceHolder1_EmailTextBox"></label>
                    </div>
                    <div class="TextBoxContainer">
                        <asp:TextBox runat="server" ID="LocationTextBox" CssClass="textbox" Placeholder="Workshop location ..." onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                        <i class="fas fa-map-marker-alt"></i>
                        <label id="ContentPlaceHolder1_LocationTextBox-error" class="error" for="ContentPlaceHolder1_LocationTextBox"></label>
                    </div>
                    <div class="TextBoxContainer">
                        <asp:TextBox runat="server" ID="LicenseTextBox" OnChange="CheckWorkshopLicense(this)" CssClass="textbox" Placeholder="Workshop license ..." onkeypress="javascript: return OnlyNumbers(event)" MaxLength="6" MinLength="1"></asp:TextBox>
                        <i class="far fa-id-badge"></i>
                        <label id="ContentPlaceHolder1_LicenseTextBox-error" class="error" for="ContentPlaceHolder1_LicenseTextBox"></label>
                    </div>
                    <div class="TextBoxContainer">
                        <asp:DropDownList runat="server" ID="WorkshopCategory" DataSourceID="SqlDataSource1" DataTextField="Category" DataValueField="WorkshopCategoryID" CssClass="textbox1" AppendDataBoundItems="True">
                            <asp:ListItem Value="0" Text="Please Select"></asp:ListItem>
                        </asp:DropDownList>
                        <label id="ContentPlaceHolder1_WorkshopCategory-error" class="error" for="ContentPlaceHolder1_WorkshopCategory"></label>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT * FROM [WorkshopCategory]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="Buttons">
                    <button onclick="ToggleBtn()" type="button" class="Cancel">Cancel</button>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:Button runat="server" OnClick="InsertWorkshop" CssClass="Save1" Text="Save" ValidationGroup="Save0" />
                        </ContentTemplate>
                        <Triggers>

                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:Button runat="server" OnClick="InsertWorkshop" CssClass="Save1" Text="Save Two" ValidationGroup="Save0" />
                    <asp:FileUpload runat="server" ID="FileUploadArea" accept="image/*" onchange="ImagePreview(this);" Style="visibility: hidden; opacity: 0;" /></div>
            </div>
            <!-- End Template For workshop -->
            <!-- Start ListItem -->
            <asp:DataList runat="server" ID="DataList1" OnItemCommand="Update">
                <ItemTemplate>
                    <asp:Label runat="server" Visible="false" ID="ID" Text='<%#Eval("WorkshopID") %>'></asp:Label>
                    <div class="animation" data-aos="zoom-in-up" data-aos-delay="300">
                        <asp:CheckBox ID="DeleteMultiple" runat="server" onclick="checkboxes()" />
                        <div class="Workshop2" id="Workshop2" style="height:195px; margin-bottom: 65px;">
                            <div class="Image">
                                <asp:ImageButton runat="server" ID="WorkshopImage2" CssClass="ImageWorkshop1" Enabled="false" ImageUrl='<%#Eval("Image") %>' />
                            </div>
                            <div class="Name">
                                <asp:TextBox runat="server" ID="NameTextBox1" Style="width: 880px;" CssClass="NameTextBox" Placeholder="Workshop name ..." name="Name" onkeypress="javascript: return Deatails(event)" MaxLength="35" Text='<%#Eval("Name") %>' Enabled="false"></asp:TextBox>
                                <i class="fas fa-store"></i>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox1" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="user" style="position: absolute; top: 0px; left: 912px;">
                                    <asp:DropDownList runat="server" ID="User1" DataSourceID="SqlDataSource3" DataTextField="Username" DataValueField="ID" AppendDataBoundItems="true" Style="width: 215px; cursor:default;" CssClass="textbox1" Text='<%#Eval("ID") %>' Enabled="false">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                                    <label id="ContentPlaceHolder1_User-error" class="error" for="ContentPlaceHolder1_User"></label>
                                </div>
                            </div>
                            <br />
                            <div class="tools">
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="PhoneTextBox1" CssClass="textbox" Enabled="false" Placeholder="Workshop phone ..." MaxLength="10" onkeypress="javascript: return OnlyNumbers(event)" minlength="10" Text='<%#Eval("Phone") %>'></asp:TextBox>
                                    <i class="fas fa-phone-alt"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="EmailTextBox1" CssClass="textbox" Enabled="false" Placeholder="Workshop email ..." Text='<%#Eval("Email") %>' onkeypress="javascript: return Email(event)"></asp:TextBox>
                                    <i class="far fa-envelope"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="LocationTextBox1" CssClass="textbox" Enabled="false" Placeholder="Workshop location ..." Text='<%#Eval("Location") %>' onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="LicenseTextBox1" CssClass="textbox" Enabled="false" Placeholder="Workshop license ..." Text='<%#Eval("License") %>' onkeypress="javascript: return OnlyNumbers(event)" MaxLength="6" MinLength="1"></asp:TextBox>
                                    <i class="far fa-id-badge"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:DropDownList runat="server" ID="WorkshopCategory1" DataSourceID="SqlDataSource2" DataTextField="Category" DataValueField="WorkshopCategoryID" CssClass="textbox1" Enabled="false" Style="cursor: default" Text='<%#Eval("WorkshopCategoryID") %>'></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT WorkshopCategoryID,Category FROM WorkshopCategory iner SELECT WorkshopCategoryID FROM WorkShopR"></asp:SqlDataSource>
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
                    <asp:Label runat="server" Visible="false" ID="ID" Text='<%#Eval("WorkshopID") %>'></asp:Label>
                    <div class="animation" data-aos="zoom-in-up" data-aos-delay="300">
                        <asp:CheckBox ID="DeleteMultiple" runat="server" onclick="checkboxes()" />
                        <div class="Workshop2" id="Workshop2" style="height:195px; margin-bottom: 65px;">
                            <div class="Image">
                                <asp:ImageButton runat="server" ID="WorkshopImage1" CssClass="ImageWorkshop1" Enabled="true" ImageUrl='<%#Eval("Image") %>' />
                            </div>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="aaa" ValidationExpression="(.*\.)(jpg|JPG|png|PNG)$" Style="position: absolute; left: 60px; color: red; bottom: 10px;" ErrorMessage="only image" ValidationGroup="Update"></asp:RegularExpressionValidator>
                            <div class="Name">
                                <asp:TextBox runat="server" ID="NameTextBox1" Style="width: 880px;" CssClass="NameTextBox" Placeholder="Workshop name ..." OnChange="CheckWorkshopName(this)" name="Name" onkeypress="javascript: return Deatails(event)" MaxLength="35" Text='<%#Eval("Name") %>'></asp:TextBox>
                                <i class="fas fa-store"></i>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox1" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                <div class="user" style="position: absolute; top: 0px; left: 912px;">
                                    <asp:DropDownList runat="server" ID="User1" DataSourceID="SqlDataSource3" DataTextField="Username" DataValueField="ID" AppendDataBoundItems="true" Style="width: 215px;" CssClass="textbox1" Text='<%#Eval("ID") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                                    <label id="ContentPlaceHolder1_User-error" class="error" for="ContentPlaceHolder1_User"></label>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $('[id*=DataList1] select[id*=User1]').chosen();
                            </script>
                            <br />
                            <div class="tools">
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="PhoneTextBox1" CssClass="textbox" Enabled="true" Placeholder="Workshop phone ..." OnChange="CheckWorkshopPhone(this)" onkeypress="javascript: return OnlyNumbers(event)" MaxLength="10" minlength="10" Text='<%#Eval("Phone") %>'></asp:TextBox>
                                    <i class="fas fa-phone-alt"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneTextBox1" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="PhoneTextBox1" ErrorMessage="Invalid phone" ValidationGroup="Update" ForeColor="Red" Display="Dynamic" Font-Italic="true" ValidationExpression="(?:\+?0*?966)?0?5[0-9]{8}"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="EmailTextBox1" CssClass="textbox" Enabled="true" Placeholder="Workshop email ..." OnChange="CheckWorkshopEmail(this)" Text='<%#Eval("Email") %>' onkeypress="javascript: return Email(event)"></asp:TextBox>
                                    <i class="far fa-envelope"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailTextBox1" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="EmailTextBox1" ErrorMessage="Invalid email" ForeColor="Red" ValidationGroup="Update" Font-Italic="true" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="LocationTextBox1" CssClass="textbox" Enabled="true" Placeholder="Workshop location ..." Text='<%#Eval("Location") %>' onkeypress="javascript: return OnlyLetters(event)"></asp:TextBox>
                                    <i class="fas fa-map-marker-alt"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LocationTextBox1" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="LocationTextBox1" ErrorMessage="Only character" ForeColor="Red" ValidationGroup="Update" Font-Italic="true" Display="Dynamic" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="LicenseTextBox1" CssClass="textbox" Enabled="true" Placeholder="Workshop license ..." OnChange="CheckWorkshopLicense(this)" Text='<%#Eval("License") %>' onkeypress="javascript: return OnlyNumbers(event)" MaxLength="6" MinLength="1"></asp:TextBox>
                                    <i class="far fa-id-badge"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LicenseTextBox1" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="LicenseTextBox1" ErrorMessage="Only eight numbers" ForeColor="Red" ValidationGroup="Update" ValidationExpression="\d{1,6}" Font-Italic="true" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:DropDownList runat="server" ID="WorkshopCategory1" DataSourceID="SqlDataSource2" DataTextField="Category" DataValueField="WorkshopCategoryID" CssClass="textbox1" Enabled="true" Style="cursor: default" Text='<%#Eval("WorkshopCategoryID") %>'></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT WorkshopCategoryID,Category FROM WorkshopCategory iner SELECT WorkshopCategoryID FROM WorkShopR"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="WorkshopCategory1" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="Buttons1">
                                <asp:DropDownList runat="server" ID="DropDownListChose" CssClass="Cancel" AutoPostBack="true" OnSelectedIndexChanged="Delete" AppendDataBoundItems="true">
                                    <asp:ListItem Value="0" Text="More"></asp:ListItem>
                                    <asp:ListItem>Cancel</asp:ListItem>
                                    <asp:ListItem ID="Delete" style="color: red;">Delete</asp:ListItem>
                                </asp:DropDownList>
                                <asp:LinkButton runat="server" ID="Update" CssClass="Save" ValidationGroup="Update" CommandName="Update" OnClick="LinkButton1_Click">Update</asp:LinkButton>
                                <asp:HiddenField ID="Hidden" runat="server" Value='<%#Container.ItemIndex+1 %>' />
                            </div>
                        </div>
                    </div>
                    <!-- Start Pop Extender For Save File -->
                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="WorkshopImage1" PopupControlID="Panel1" CancelControlID="CancelBtn" BackgroundCssClass="Popup"></cc1:ModalPopupExtender>
                    <asp:Panel ID="Panel1" runat="server" Style="width: 600px; height: 600px; background-color: white; border-radius: 5px; display:none;" onclick="openFileUpload()">
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
                                <div id="cancel-btn" style="left: 67px;"><a href="#" onclick="ClearPreview1()"><i class="fas fa-times"></i></a></div>
                                <div class="file-name">File name here</div>
                            </div>
                            <asp:FileUpload runat="server" ID="aaa" accept=".png,.jpg,.jpeg," CssClass="custom-file-input" onchange="ImagePreview1(this)" />
                        </div>
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
            <div runat="server" id="NameWorkshop" visible="false" style="margin: 0px 0; text-align: center;" data-aos="fade-up" data-aos-delay="300">
                <i class="fas fa-store" style="color: var(--MainColor); display: block; font-size: 60px; margin-bottom: 30px;"></i>
                <h4 style="color: var(--MainColor); font-size: 20px; font-weight: 700; margin: 0 auto; max-width: 75%;">There are no workshops</h4>
            </div>
            <!-- End ListItem -->
            <!-- End Template For workshop -->
        </div>
        <!-- End Container For The workshop -->
    </div>
    <!-- Start Pop Extender For Save File -->
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="WorkshopImage" PopupControlID="Panel1" CancelControlID="CancelBtn" BackgroundCssClass="Popup"></cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" Style="width: 600px; height: 600px; background-color: white; border-radius: 5px; display:none;">
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
    <cc1:AnimationExtender ID="popupAnimation" runat="server" TargetControlID="WorkshopImage">
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
    <!-- Start Animation -->
    <script>
        AOS.init({
            delay: 300,
        });
    </script>
    <!-- End Animation -->
</asp:Content>
