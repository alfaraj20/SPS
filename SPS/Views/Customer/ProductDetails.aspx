<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="SPS.Views.Customer.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Css/Customer/OO.css" rel="stylesheet" />
    <style>
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
    <asp:DataList ID="DataList1" CssClass="dd1-ev" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource1" style="position:relative; left: 500px; top:140px; cursor:default;">
        <ItemTemplate>
            <div class="Container" style="cursor:default; position:relative; bottom:80px;">
                <div class="jjj" style="width: 350px;position: relative;right: 140px;">
                    <table>
                        <ul id="content-slider">
                            <li style="list-style: none; cursor:default;">
                                <div class="left">
                                    <asp:Image ID="Image" runat="server" Height="100px" ImageUrl='<%# Eval("Image") %>' Width="100px" style="position:relative; top:91px;" />
                                    <br />
                                    <div class="slider-data">
                                        <asp:Label ID="Label1" runat="server" CssClass="name-ev" Text='<%# Eval("Name") %>' style="cursor:default;"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label2" runat="server" CssClass="deatalis-ev" Text='<%# Eval("Deatalis") %>' style="cursor:default;"/>
                                        <br />
                                        <asp:Label ID="Label4" runat="server" CssClass="price-ev" Text='<%# Eval("Price") %>' style="cursor:default;"></asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" CssClass="price-ev" Text='<%# Eval("Model") %>' Style="cursor: default;"></asp:Label>
                                        <br />
                                        <asp:Label ID="qlab" runat="server" CssClass="quantity-ev" Text='<%# Eval("Quantity") %>' Visible="false" />
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </table>
                </div>
                <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:DropDownList ID="Qdrob" CssClass="textbox1" runat="server" style="position:relative; left:715px; bottom: 100px; cursor:pointer;"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SPS %>" SelectCommand="SELECT * FROM [Product] WHERE ([ProductID] = @PID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PID" QueryStringField="pid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="ErrorMsg" runat="server" style="position: relative;left: 730px;color: red;"></asp:Label>
    <asp:Button ID="AddToCart" runat="server" CssClass="add-ev" Text="Add To Cart" OnClick="AddToCart_Click" Style="width: 25%; position: relative; left: 725px;" />
</asp:Content>
