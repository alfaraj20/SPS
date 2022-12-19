<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Bumpersgrillesandfacade.aspx.cs" Inherits="SPS.Views.Customer.Bumpersgrillesandfacade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Global.css" />
    <!-- Render All Elements Normally -->
    <link rel="stylesheet" href="../../Css/Normalize.css" />
    <!-- Page Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/PP.css" />
    <!-- Page Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/WSP.css" />
    <!-- Page Template JavaScript File -->
    <script src="../../JavaScript/Customer/PP.js"></script>
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="Css/Customer/HeaderAndFooter.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Height="293px" Width="310px" RepeatColumns="5" RepeatDirection="Horizontal" Style="border-collapse: collapse;position: absolute;left: 85px;top: 160px;">
        <ItemTemplate>
            <table>
                <div class="jjj" style="padding: 5px;">
                    <ul class="ul1" style="margin-right:100px;">
                        <li class="li1">
                            <asp:HyperLink ID="Transport" runat="server" NavigateUrl='<%# Eval("ProductID","~/Views/Customer/ProductDetails.aspx?pid={0}") %>' Style="text-decoration: none; color: black;">
                                <asp:Image ID="Image" runat="server" CssClss="img" Height="100px" ImageUrl='<%# Eval("Image") %>' Width="100px" />
                                <asp:Label ID="Label1" runat="server" CssClass="name-ev" Text='<%# Eval("Name") %>'></asp:Label>
                                <br />
                                <asp:Label ID="CompName" runat="server" CssClass="Comp-ev" Text='<%# Eval("CompanyName") %>'></asp:Label>
                                -
                                <asp:Label ID="CarName" runat="server" CssClass="car-ev" Text='<%# Eval("CarName") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" CssClass="price-ev" Text='<%# Eval("Price") %>'></asp:Label>
                            </asp:HyperLink>
                        </li>
                    </ul>
                </div>
            <div runat="server" id="Product1" visible="false" style="margin: 0px 0; text-align: center;" data-aos="fade-up" data-aos-delay="300">
                <i class="fas fa-boxes" style="color: var(--MainColor); display: block; font-size: 60px; margin-bottom: 30px;"></i>
                <h4 style="color: var(--MainColor); font-size: 20px; font-weight: 700; margin: 0 auto; max-width: 75%;">There are no products</h4>
            </div>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT [Name], [Price], [Image], [ProductID],[CompanyName],[CarName],[CategoryProduct] FROM [Product] WHERE ([CategoryProduct] = '1')">
    </asp:SqlDataSource>
</asp:Content>
