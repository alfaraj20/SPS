<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="CustomerOrders.aspx.cs" Inherits="SPS.Views.Customer.CustomerOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Global.css" />
    <!-- Render All Elements Normally -->
    <link rel="stylesheet" href="../../Css/Normalize.css" />
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/HR.css" />
    <!-- Page Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/LR.css" />
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/HeaderAndFooter.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Start Alert Msg -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Animation Files -->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <style>
        body {
            background-color: #E5E7EB;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Title -->
    <div class="title" style="position: absolute; top: 120px; left: 180px; font-size: 25px;">
        <h1>Orders</h1>
    </div>
    <!-- End Title -->
    <div class="Orders_Div" style="position: absolute; max-width: 82%; top: 250px; left: 180px; width: 90%; height: 15%;">
        <asp:DataList runat="server" ID="DataList1">
            <ItemTemplate>
                <div class="Orders_Details" style="background: #fff; max-height: 161px; margin-bottom: 5%; position: relative;">
                    <asp:Image runat="server" ImageUrl='<%#Eval("Pimage") %>' Style="height: 161px; width: 225px;" />
                    <asp:Label runat="server" Style="position: relative; bottom: 130px; left: 25px;">Prouduct name:</asp:Label>
                    <asp:Label runat="server" Text='<%#Eval("Pname") %>' Style="position: relative; bottom: 130px; left: 35px;"></asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 70px; right: 110px;">Workshop ID:</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 70px; right: 100px;">'<%#Eval("WorkshopID") %>'</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 20px; right: 240px;">City name:</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 20px; right: 235px;"><%#Eval("City") %></asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 130px; left: 25px;">Street name:</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 130px; left: 35px;"><%#Eval("Street") %></asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 70px;  right: 110px;">Zip code:</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 70px; right: 105px;"><%#Eval("ZipCode") %></asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 20px; right: 225px;">Price product:</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 20px; right: 220px;">$<%#Eval("Pprice") %></asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 130px;">Quantity prouduct:</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 130px;"><%#Eval("Pqty") %></asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 70px; right: 145px;">Order prouduct:</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 70px; right: 140px;"><%#Eval("OrderID") %></asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 20px; right: 280px">Order date:</asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 20px; right: 275px;"><%#Eval("DateBuy") %></asp:Label>
                    <asp:Label runat="server" Style="position: relative; bottom: 148px; left: 1550px;">Status of order</asp:Label>
                    <asp:DropDownList runat="server" ID="OrderStatus" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="StatusID" CssClass="textbox1" Enabled="false" Style="cursor: default;left:1425px;bottom:95px;position:relative;" Text='<%#Eval("StatusID") %>'></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT StatusID,Name FROM Status iner SELECT StatusID FROM Orders"></asp:SqlDataSource>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div runat="server" id="OrdersDiv" visible="false" style="margin: 250px 0; text-align: center; position: absolute; left: 900px;">
            <i class="fas fa-shopping-cart" style="color: var(--MainColor); display: block; font-size: 60px; margin-bottom: 30px;"></i>
            <h4 style="color: var(--MainColor); font-size: 20px; font-weight: 700; margin: 0 auto; max-width: 75%;">There are no orders</h4>
        </div>
    </div>
</asp:Content>
