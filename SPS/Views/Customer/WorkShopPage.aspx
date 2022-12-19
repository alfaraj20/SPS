<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="WorkShopPage.aspx.cs" Inherits="SPS.Views.Customer.WorkShopPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="../../Css/Global.css" />
    <!-- Render All Elements Normally -->
    <link rel="stylesheet" href="../../Css/Normalize.css" />
    <!-- Page Template Css File -->
    <link rel="stylesheet" href="../../Css/Customer/WSP.css" />
    <!-- Page Template JavaScript File -->
    <script src="../../JavaScript/Customer/WSP.js"></script>
    <!-- Main Template Css File -->
    <link rel="stylesheet" href="Css/Customer/HeaderAndFooter.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Container">

        <div class="gg">
            <asp:TextBox ID="Search" runat="server" CssClass="search-btn" placeholder="Search for WorkShop"></asp:TextBox>
            <asp:Button ID="btn_Search" runat="server" CssClass="btn-ev" Text="Search" OnClick="btn_Search_Click" />
            <asp:DropDownList ID="WorkShop_Specialization" CssClass="ddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="WorkShop_Specialization_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div>
        </div>
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" Style="border-collapse: collapse; position: absolute; left: 85px; top: 160px;">
            <ItemTemplate>
                <table>
                    <div class="jjj" style="padding: 5px;">
                        <ul class="ul1" style="margin-right: 100px;">
                            <li class="li1">
                                <asp:HyperLink ID="Transportt" runat="server" BorderStyle="None" NavigateUrl='<%# Eval("WorkshopID","~/Views/Customer/ProductPage.aspx?wid={0}")%>' Style="text-decoration: none; color: black;">
                                    <div class="image">
                                        <asp:Image ID="Image" runat="server" Height="100px" ImageUrl='<%# Eval("Image") %>' Width="100px" />
                                    </div>
                                    <div class="data">
                                        <asp:Label ID="Label1" runat="server" CssClass="name-ev" Text='<%# Eval("Name") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label4" runat="server" CssClass="location-ev" Text='<%# Eval("WorkshopCategoryName") %>'></asp:Label>
                                    </div>
                                </asp:HyperLink>
                            </li>
                        </ul>
                    </div>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
