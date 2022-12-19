<%@ Page Title="Products" EnableEventValidation="false" Language="C#" MasterPageFile="~/Dashboard.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SPS.Views.Admin.Products" %>

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

        textarea:focus {
            border: 1px solid var(--MainColor);
            color: var(--MainColor);
            transition: 0.1s;
        }

        .TextBoxContainer textarea:focus::placeholder {
            color: var(--MainColor);
            transition: 0.1s;
        }

        textarea:focus + i {
            color: var(--MainColor);
            transition: 0.1s;
        }

        textarea::-webkit-scrollbar {
            width: 3px;
        }

        textarea::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 10px #BDDAE0;
        }

        textarea::-webkit-scrollbar-thumb {
            background-color: var(--MainColor);
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
    <!-- Start Javascript inside -->
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
            $('[id*=DataList1] [id*=WorkshopImage1]').prop('src', '../../Images/Admin/Default/placeholder.png');
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
        //Start validation
        $(document).ready(function () {
            $.validator.addMethod('filesize', function (value, element, param) {
                // param = size (in bytes) 
                // element = element to validate (<input>)
                // value = value of the element (file name)
                return this.optional(element) || (element.files[0].size <= param)
            });
            $('form').validate({
                onsubmit: true,
                rules: {
                    ctl00$ContentPlaceHolder1$FileUploadArea: {
                        required: true,
                        accept: "image/*",
                        filesize: 1048576
                    },
                    ctl00$ContentPlaceHolder1$ProductQuantity: {

                        required: true,
                        number: true,

                    },
                    ctl00$ContentPlaceHolder1$ProducPrice: {

                        required: true,
                        number: true,

                    },
                    ctl00$ContentPlaceHolder1$ProductMatchYears: {

                        required: true,

                    },
                    ctl00$ContentPlaceHolder1$ProductDetails: {

                        required: true,

                    },
                    ctl00$ContentPlaceHolder1$CompanyName: {
                        required: true,
                    },
                    ctl00$ContentPlaceHolder1$CarName: {
                        required: true,
                    },
                    ctl00$ContentPlaceHolder1$CategoryProduct: {
                        required: true,
                    },
                    ctl00$ContentPlaceHolder1$ProductName: {
                        required: true,
                    },
                    ctl00$ContentPlaceHolder1$SupplierName: {
                        required: true,
                    }
                },
                errorPlacement: function (error, element) {
                    $("#Workshop").css('error', 'auto');
                },

                messages: {
                    ctl00$ContentPlaceHolder1$FileUploadArea: {
                        required: 'Required.',
                        accept: 'Accept only<br/>image'
                    },
                    ctl00$ContentPlaceHolder1$ProductQuantity: {

                        required: 'required.',

                        number: 'Not allowed characters',

                    },
                    ctl00$ContentPlaceHolder1$ProducPrice: {

                        required: 'required.',

                        number: 'Not allowed characters',

                    },
                    ctl00$ContentPlaceHolder1$ProductMatchYears: {

                        required: 'required.',

                    },
                    ctl00$ContentPlaceHolder1$ProductDetails: {

                        required: 'required.',

                    },
                    ctl00$ContentPlaceHolder1$CompanyName: {

                        required: 'required.',
                    },
                    ctl00$ContentPlaceHolder1$CarName: {

                        required: 'required.',
                    },
                    ctl00$ContentPlaceHolder1$CategoryProduct: {

                        required: 'required.',
                    },
                    ctl00$ContentPlaceHolder1$ProductName: {

                        required: 'required.',
                    },
                    ContentPlaceHolder1_SupplierName: {

                        required: 'required.',
                    }
                },
                highlight: function (element, errorClass) {
                    var NameTextBox = $('#ContentPlaceHolder1_NameTextBox').hasClass('errorClass');
                    var aa = $('#ContentPlaceHolder1_aa').hasClass('errorClass');
                    $(element).addClass('errorClass');
                    if ($(element).hasClass('errorClass') == true) {
                        $(element).closest(".Workshop").addClass("has-error");
                        $(element).closest(".test0").removeClass("errorClass");
                    }
                },
                unhighlight: function (element, errorClass) {
                    var FileUploadArea = $('#ContentPlaceHolder1_FileUploadArea').hasClass('errorClass');
                    var CompanyName = $('#ContentPlaceHolder1_CompanyName').hasClass('errorClass');
                    var CarName = $('#ContentPlaceHolder1_CarName').hasClass('errorClass');
                    var CategoryProduct = $('#ContentPlaceHolder1_CategoryProduct').hasClass('errorClass');
                    var ProductName = $('#ContentPlaceHolder1_ProductName').hasClass('errorClass');
                    var SupplierName = $('#ContentPlaceHolder1_SupplierName').hasClass('errorClass');
                    var ProductQuantity = $('#ContentPlaceHolder1_ProductQuantity').hasClass('errorClass');
                    var ProducPrice = $('#ContentPlaceHolder1_ProducPrice').hasClass('errorClass');
                    var ProductMatchYears = $('#ContentPlaceHolder1_ProductMatchYears').hasClass('errorClass');
                    var ProductDetails = $('#ContentPlaceHolder1_ProductDetails').hasClass('errorClass');
                    $(element).removeClass('errorClass');
                    if (ProductQuantity == false && ProducPrice == false && ProductMatchYears == false && ProductDetails == false && FileUploadArea == false && CompanyName == false && CarName == false && CategoryProduct == false && ProductName == false && SupplierName == false) {
                        $(element).closest(".Workshop").removeClass("has-error");
                    }
                    else {
                        console.log('False');
                    }
                },
            });

        });
        //End validation
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
        /* Start Match Years */
        function OnlyNumbersAndSpecificSymbols(event) {
            var ikeycode = (event.which) ? event.which : event.keyCode
            if (!(ikeycode > 47 && ikeycode < 58) && !(ikeycode == 124) && !(ikeycode == 45) && !(ikeycode == 32)) {
                return false;
            }
            else {
                return true;
            }
        }
        /* End Match Years */
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
    <!-- End Javascript inside -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
    <!-- Start Title -->
    <div class="title" data-aos="zoom-in-up" data-aos-delay="300">
        <asp:HiddenField runat="server" ID="Products2" Value="Products" Visible="false" />
        <asp:HiddenField runat="server" ID="WorkshopsPage" Value="Products" Visible="false" />
        <asp:HiddenField runat="server" ID="Dashboard1" Value="Products" Visible="false" />
        <h1>Products</h1>
    </div>
    <!-- End Title -->
    <div class="Container1">
        <!-- Start Controls -->
        <div class="view-control" data-aos="zoom-in-up" data-aos-delay="300">
            <button onclick="ToggleBtn()" type="button" class="btn">
                <span>Add Product</span>
                <span>
                    <i class="fas fa-plus-circle" style="padding: 0 10px;"></i>
                </span>
            </button>
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
        <div id="products_div" class="grid-block main_content list">
            <!-- Start Template For workshop -->
            <div class="Workshop" id="Workshop">
                <button type="button" onclick="ToggleBtnCircle()" class="fas fa-times btn-delete-circle btn-delete-product"><i class="sicon-cancel"></i></button>
                <div class="Image">
                    <asp:ImageButton runat="server" ID="WorkshopImage" CssClass="ImageWorkshop" ImageUrl="~/Images/Admin/Default/placeholder.png" />
                </div>
                <label id="ContentPlaceHolder1_FileUploadArea-error" class="error" for="ContentPlaceHolder1_FileUploadArea" style="position: absolute; left: 65px;"></label>
                <div class="Name" style="display: flex;">
                    <div class="CompanyName">
                        <asp:DropDownList runat="server" ID="CompanyName" CssClass="textbox1" Style="width: 210px;">
                        </asp:DropDownList>
                        <cc1:CascadingDropDown ID="CascadingDropDownCompanyName" runat="server" TargetControlID="CompanyName" ServiceMethod="BindProduct" Category="product" PromptText="Select company name" ServicePath="~/CascadingDropdown.asmx" />
                        <label id="ContentPlaceHolder1_CompanyName-error" class="error" for="ContentPlaceHolder1_CompanyName"></label>
                    </div>
                    <div class="CarName" style="margin-left: 35px;">
                        <asp:DropDownList runat="server" ID="CarName" CssClass="textbox1" Style="width: 210px;">
                        </asp:DropDownList>
                        <cc1:CascadingDropDown ID="CascadingDropDownCarName" runat="server" TargetControlID="CarName" ServiceMethod="BindBrand" ParentControlID="CompanyName" Category="CarName" PromptText="Select car name" ServicePath="~/CascadingDropdown.asmx" />
                        <label id="ContentPlaceHolder1_CarName-error" class="error" for="ContentPlaceHolder1_CarName"></label>
                    </div>
                    <div class="CategoryProduct" style="margin-left: 35px;">
                        <asp:DropDownList runat="server" ID="CategoryProduct" CssClass="textbox1" Style="width: 210px;">
                        </asp:DropDownList>
                        <cc1:CascadingDropDown ID="CascadingDropDownCategoryProduct" runat="server" TargetControlID="CategoryProduct" Category="CategoryProduct" ParentControlID="CarName" ServiceMethod="BindCategoryProduct" PromptText="Select category product" ServicePath="~/CascadingDropdown.asmx" />
                        <label id="ContentPlaceHolder1_CategoryProduct-error" class="error" for="ContentPlaceHolder1_CategoryProduct"></label>
                    </div>
                    <div class="ProductName" style="margin-left: 35px;">
                        <asp:DropDownList runat="server" ID="ProductName" CssClass="textbox1" Style="width: 157px;">
                        </asp:DropDownList>
                        <cc1:CascadingDropDown ID="CascadingDropDownProductName" runat="server" TargetControlID="ProductName" ServiceMethod="BindProductName" ParentControlID="CategoryProduct" Category="ProductName" PromptText="Select product name" ServicePath="~/CascadingDropdown.asmx" />
                        <label id="ContentPlaceHolder1_ProductName-error" class="error" for="ContentPlaceHolder1_ProductName"></label>
                    </div>
                    <div class="SupplierName" style="margin-left: 10px;">
                        <asp:DropDownList runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="WorkshopID" AppendDataBoundItems="true" ID="SupplierName" CssClass="textbox1" Style="width: 210px; cursor: default;">
                            <asp:ListItem Text="Please Select"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT * FROM [WorkShopR]"></asp:SqlDataSource>
                        <label id="ContentPlaceHolder1_SupplierName-error" class="error" for="ContentPlaceHolder1_SupplierName"></label>
                    </div>
                    <script type="text/javascript">
                        $('#<%=SupplierName.ClientID%>').chosen();
                    </script>
                </div>
                <div class="tools">
                    <div class="TextBoxContainer">
                        <asp:TextBox runat="server" ID="ProductQuantity" CssClass="textbox" Placeholder="Product quantity..." onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                        <i class="fas fa-boxes" style="transform: translateX(10px) translateY(-30px);"></i>
                        <label id="ContentPlaceHolder1_ProductQuantity-error" class="error" for="ContentPlaceHolder1_ProductQuantity" style="position:absolute; left:0;"></label>
                    </div>
                    <div class="TextBoxContainer">
                        <asp:TextBox runat="server" ID="ProducPrice" CssClass="textbox" Placeholder="Product price ..." onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                        <i class="fas fa-dollar-sign"></i>
                        <label id="ContentPlaceHolder1_ProducPrice-error" class="error" for="ContentPlaceHolder1_ProducPrice"></label>
                    </div>
                    <div class="TextBoxContainer">
                        <asp:TextBox runat="server" ID="ProductMatchYears" CssClass="textbox" Placeholder="Product match ..." onkeypress="javascript: return OnlyNumbersAndSpecificSymbols(event)"></asp:TextBox>
                        <i class="fas fa-calendar-check"></i>
                        <label id="ContentPlaceHolder1_ProductMatchYears-error" class="error" for="ContentPlaceHolder1_ProductMatchYears"></label>
                    </div>
                    <div class="TextBoxContainer">
                        <textarea id="ProductDetails" runat="server" class="Details" placeholder="Product details ..." onkeypress="javascript: return Deatails(event)"></textarea>
                        <i class="fas fa-info-circle" style="transform: translateX(10px) translateY(-38px);"></i>
                        <label id="ContentPlaceHolder1_ProductDetails-error" class="error" for="ContentPlaceHolder1_ProductDetails" style="position:absolute; right:175px; bottom:10px;"></label>
                    </div>
                </div>
                <div class="Buttons" style="margin-left: 250px;">
                    <button onclick="ToggleBtn()" type="button" class="Cancel">Cancel</button>
                    <asp:Button runat="server" OnClick="InsertWorkshop" CssClass="Save1" Text="Save" />
                    <asp:FileUpload runat="server" ID="FileUploadArea" accept="image/*" onchange="ImagePreview(this);" Style="visibility: hidden; opacity: 0;" />
                </div>
            </div>
            <!-- End Template For product -->
            <!-- Start ListItem -->
            <asp:DataList runat="server" ID="DataList1" OnItemCommand="Update">
                <ItemTemplate>
                    <asp:Label runat="server" Visible="false" ID="ID" Text='<%#Eval("ProductID") %>'></asp:Label>
                    <div class="animation" data-aos="zoom-in-up" data-aos-delay="300">
                        <asp:CheckBox ID="DeleteMultiple" runat="server" onclick="checkboxes()"/>
                        <div class="Workshop2" id="Workshop2" style="display: block; height: 180px;">
                            <div class="Image">
                                <asp:ImageButton runat="server" ID="WorkshopImage2" CssClass="ImageWorkshop1" Enabled="false" ImageUrl='<%#Eval("Image") %>' />
                            </div>
                            <div class="Name" style="display: flex;">
                                <div class="CompanyName">
                                    <asp:DropDownList runat="server" ID="CompanyName" CssClass="textbox1" Style="width: 210px; cursor: default;" Enabled="false">
                                    </asp:DropDownList>
                                    <cc1:CascadingDropDown ID="CascadingDropDownCompanyName" runat="server" TargetControlID="CompanyName" SelectedValue='<%# Eval("CompanyID") %>' ServiceMethod="BindProduct" Category="product" ServicePath="~/CascadingDropdown.asmx" />
                                </div>
                                <div class="CarName" style="margin-left: 35px;">
                                    <asp:DropDownList runat="server" ID="CarName" CssClass="textbox1" Style="width: 210px; cursor: default;" Enabled="false">
                                    </asp:DropDownList>
                                    <cc1:CascadingDropDown ID="CascadingDropDownCarName" runat="server" TargetControlID="CarName" SelectedValue='<%# Eval("CarNameID") %>' ServiceMethod="BindBrand" ParentControlID="CompanyName" Category="CarName" ServicePath="~/CascadingDropdown.asmx" />
                                </div>
                                <div class="CategoryProduct" style="margin-left: 35px;">
                                    <asp:DropDownList runat="server" ID="CategoryProduct" CssClass="textbox1" Style="width: 210px; cursor: default;" Enabled="false">
                                    </asp:DropDownList>
                                    <cc1:CascadingDropDown ID="CascadingDropDownCategoryProduct" runat="server" TargetControlID="CategoryProduct" SelectedValue='<%#Eval("CategoryProduct") %>' Category="CategoryProduct" ParentControlID="CarName" ServiceMethod="BindCategoryProduct" ServicePath="~/CascadingDropdown.asmx" />
                                </div>
                                <div class="ProductName" style="margin-left: 35px;">
                                    <asp:DropDownList runat="server" ID="ProductName" CssClass="textbox1" Style="width: 157px; cursor: default;" Enabled="false">
                                    </asp:DropDownList>
                                    <cc1:CascadingDropDown ID="CascadingDropDownProductName" runat="server" TargetControlID="ProductName" SelectedValue='<%#Eval("Name") %>' ServiceMethod="BindProductName" ParentControlID="CategoryProduct" Category="ProductName" ServicePath="~/CascadingDropdown.asmx" />
                                </div>
                                <div class="SupplierName" style="margin-left: 10px;">
                                    <asp:DropDownList runat="server" ID="SupplierName" CssClass="textbox1" Style="width: 210px; cursor: default;" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="WorkshopID" Enabled="false" Text='<%#Eval("WorkshopID") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT WorkshopID,Name FROM WorkShopR iner SELECT WorkshopID FROM Product"></asp:SqlDataSource>
                                </div>
                            </div>
                            <br />
                            <div class="tools">
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="ProductQuantity" CssClass="textbox" Enabled="false" Placeholder="Product quantity..." MaxLength="13" minlength="10" Text='<%#Eval("Quantity") %>' onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                                    <i class="fas fa-boxes" style="transform: translateX(10px) translateY(-30px);"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="ProducPrice" CssClass="textbox" Enabled="false" Placeholder="Product price ..." Text='<%#Eval("Price") %>' onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                                    <i class="fas fa-dollar-sign"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="ProductMatchYears" CssClass="textbox" Enabled="false" Placeholder="Product match ..." Text='<%#Eval("Model") %>' onkeypress="javascript: return OnlyNumbersAndSpecificSymbols(event)"></asp:TextBox>
                                    <i class="fas fa-calendar-check"></i>
                                </div>
                                <div class="TextBoxContainer">
                                    <textarea id="ProductDetails" runat="server" class="Details" placeholder="Product details ..." onkeypress="javascript: return Deatails(event)" disabled><%#Eval("Deatalis") %></textarea>
                                    <i class="fas fa-info-circle" style="transform: translateX(10px) translateY(-38px);"></i>
                                </div>
                            </div>
                            <div class="Buttons1">
                                <input runat="server" value="Edit" class="Cancel" type="button" onserverclick="Edit"/>
                                <asp:LinkButton runat="server" ID="LinkButton1" CssClass="Save" ValidationGroup="Update" CommandName="Update" Enabled="false" Style="cursor: default">Update</asp:LinkButton>
                                <asp:HiddenField ID="Hidden" runat="server" Value='<%#Container.ItemIndex+1 %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label runat="server" Visible="false" ID="ID" Text='<%#Eval("ProductID") %>'></asp:Label>
                    <div class="animation" data-aos="zoom-in-up" data-aos-delay="300">
                        <asp:CheckBox ID="DeleteMultiple" runat="server" onclick="checkboxes()"/>
                        <div class="Workshop2" id="Workshop2" style="display: block; height: 180px;">
                            <!-- Start here -->
                            <div class="Image">
                                <asp:ImageButton runat="server" ID="WorkshopImage1" CssClass="ImageWorkshop1" ImageUrl='<%#Eval("Image") %>' />
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="aaa" ValidationExpression="(.*\.)(jpg|JPG|png|PNG)$" Style="position: absolute; left: 0; color: red; top: 118px;" ErrorMessage="only image" ValidationGroup="Update"></asp:RegularExpressionValidator>
                            </div>
                            <div class="Name" style="display: flex;">
                                <div class="CompanyName">
                                    <asp:DropDownList runat="server" ID="CompanyName" CssClass="textbox1" Style="width: 210px;">
                                    </asp:DropDownList>
                                    <cc1:CascadingDropDown ID="CascadingDropDownCompanyName" runat="server" TargetControlID="CompanyName" SelectedValue='<%# Eval("CompanyID") %>' ServiceMethod="BindProduct" Category="product" ServicePath="~/CascadingDropdown.asmx" />
                                </div>
                                <div class="CarName" style="margin-left: 35px;">
                                    <asp:DropDownList runat="server" ID="CarName" CssClass="textbox1" Style="width: 210px;">
                                    </asp:DropDownList>
                                    <cc1:CascadingDropDown ID="CascadingDropDownCarName" runat="server" TargetControlID="CarName" SelectedValue='<%# Eval("CarNameID") %>' ServiceMethod="BindBrand" ParentControlID="CompanyName" Category="CarName" ServicePath="~/CascadingDropdown.asmx" />
                                </div>
                                <div class="CategoryProduct" style="margin-left: 35px;">
                                    <asp:DropDownList runat="server" ID="CategoryProduct" CssClass="textbox1" Style="width: 210px;">
                                    </asp:DropDownList>
                                    <cc1:CascadingDropDown ID="CascadingDropDownCategoryProduct" runat="server" TargetControlID="CategoryProduct" SelectedValue='<%#Eval("CategoryProduct") %>' Category="CategoryProduct" ParentControlID="CarName" ServiceMethod="BindCategoryProduct" ServicePath="~/CascadingDropdown.asmx" />
                                </div>
                                <div class="ProductName" style="margin-left: 35px;">
                                    <asp:DropDownList runat="server" ID="ProductName" CssClass="textbox1" Style="width: 157px;">
                                    </asp:DropDownList>
                                    <cc1:CascadingDropDown ID="CascadingDropDownProductName" runat="server" TargetControlID="ProductName" SelectedValue='<%#Eval("Name") %>' ServiceMethod="BindProductName" ParentControlID="CategoryProduct" Category="ProductName" ServicePath="~/CascadingDropdown.asmx" />
                                </div>
                                <div class="SupplierName" style="margin-left: 10px;">
                                    <asp:DropDownList runat="server" ID="SupplierName" CssClass="textbox1" Style="width: 210px; cursor:default;" DataSourceID="SqlDataSource5" DataTextField="Name" DataValueField="WorkshopID" Text='<%#Eval("WorkshopID") %>'>
                                    </asp:DropDownList>     </script>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT WorkshopID,Name FROM WorkShopR iner SELECT WorkshopID FROM Product"></asp:SqlDataSource>
                                </div>
                                <script type="text/javascript">
                                    $('[id*=DataList1] select[id*=SupplierName]').chosen();
                                </script>
                            </div>
                            <br />
                            <div class="tools">
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="ProductQuantity" CssClass="textbox" Placeholder="Product quantity..." Text='<%#Eval("Quantity") %>' onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                                    <i class="fas fa-boxes" style="transform: translateX(10px) translateY(-30px);"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductQuantity" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic" Style="position: relative; left: -35px;"></asp:RequiredFieldValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="ProducPrice" CssClass="textbox" Placeholder="Product price ..." Text='<%#Eval("Price") %>' onkeypress="javascript: return OnlyNumbers(event)"></asp:TextBox>
                                    <i class="fas fa-dollar-sign"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ProducPrice" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <asp:TextBox runat="server" ID="ProductMatchYears" CssClass="textbox" Placeholder="Product match ..." Text='<%#Eval("Model") %>' onkeypress="javascript: return OnlyNumbersAndSpecificSymbols(event)"></asp:TextBox>
                                    <i class="fas fa-calendar-check"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductMatchYears" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="TextBoxContainer">
                                    <textarea id="ProductDetails" runat="server" class="Details" placeholder="Product details ..." onkeypress="javascript: return Deatails(event)"><%#Eval("Deatalis") %></textarea>
                                    <i class="fas fa-info-circle" style="transform: translateX(10px) translateY(-38px);"></i>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ProductDetails" ErrorMessage="Required field" ValidationGroup="Update" ForeColor="Red" Font-Italic="true" Display="Dynamic" Style="position: relative; right: 35px; bottom: 8px;"></asp:RequiredFieldValidator>
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
                            <h3 style="color: white;">Photo Of Product</h3>
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
                                <div id="cancel-btn" style="left: 65px;"><a href="#" onclick="ClearPreview1()"><i class="fas fa-times"></i></a></div>
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
            <div runat="server" id="Product1" visible="false" style="margin: 0px 0; text-align: center;" data-aos="fade-up" data-aos-delay="300">
                <i class="fas fa-boxes" style="color: var(--MainColor); display: block; font-size: 60px; margin-bottom: 30px;"></i>
                <h4 style="color: var(--MainColor); font-size: 20px; font-weight: 700; margin: 0 auto; max-width: 75%;">There are no products</h4>
            </div>
            <!-- End ListItem -->
        </div>
    </div>
    <!-- Start Pop Extender For Save File -->
    <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="WorkshopImage" PopupControlID="Panel1" CancelControlID="CancelBtn" BackgroundCssClass="Popup"></cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" Style="width: 600px; height: 600px; background-color: white; border-radius: 5px; display:none;">
        <div class="Header" style="text-align: center; padding: 10px; background-color: var(--MainColor); border-radius: 5px 5px 0px 0px;">
            <h3 style="color: white;">Photo Of Product</h3>
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
                <div id="cancel-btn" style="left: 65px;"><a href="#" onclick="ClearPreview()"><i class="fas fa-times"></i></a></div>
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
