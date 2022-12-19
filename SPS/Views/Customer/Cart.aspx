<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SPS.Views.Customer.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Css/Customer/CC.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="small-container cart-page">
    <asp:DataList ID="d1" runat="server" style="position: relative; top:50px;">
        <HeaderTemplate>
                        <tr>
                <th>Product</th>                                     
                <th>Quantity</th>
                 <th>Price</th>               
            </tr>
        </HeaderTemplate>

        <ItemTemplate>

            <tr>
                <td>
                    <div class="cart-info">
                    <asp:Image ID="Image" runat="server" Height="100px" ImageUrl='<%# Eval("Image") %>' Width="100px" />
                        <div>
                            <p><asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' style="font-weight:900;"></asp:Label></p>
                            <span><asp:Label ID="Label2" runat="server" Text='<%# Eval("Deatalis") %>' style="font-weight:900;"/></span>
                            <br/>
                             <asp:HyperLink ID="HyperLink1" CssClass="btn-2" runat="server" NavigateUrl='<%# Eval("PID","~/Views/Customer/DeleteFromCart.aspx?id={0}") %>' style="font-weight:900; color:var(--MainColor);">Remove</asp:HyperLink>
                        </div>
                </td>    
                
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Quantity") %>' style="font-weight:900;"></asp:Label>
                </td>
                
                <td style="font-weight:900;">
                     $<asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Price") %>' style="font-weight:900;"/>   
                </td>                
            </tr>
            </div>

        </ItemTemplate>
    </asp:DataList>

          <div class="total-price">

                <table style="position:relative; top:60px;">
                     
                    <tr>
                        <td style="font-weight:900;">Total</td>
                        <td style="font-weight:900;">  $<asp:Label ID="TotLab" runat="server" style="font-weight:900;"></asp:Label></td>
                    </tr>                         
                </table>
              <br />
             
               </div>
                       <div class="btn-1">
                <asp:Button ID="CheckOut" runat="server" CssClass="btn1-ev" Text="CheckOut" OnClick="CheckOut_Click" style="position:relative; top:40px;left:145px;" />

                    </div>
   
 </div>
</asp:Content>
