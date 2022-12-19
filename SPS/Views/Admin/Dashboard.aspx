<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SPS.Views.Admin.Dashboard" %>

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
    <link rel="stylesheet" href="../../Css/Admin/DashboardDetails.css" />
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
    <!-- Start css inside -->
    <style>
        table#ContentPlaceHolder1_DataList1 {
            width:100%;
        }
        table#ContentPlaceHolder1_DataList1 tbody {
            display:none;
        }
        table#ContentPlaceHolder1_DataList1 #Dashboard-customers {
            display:contents;
        }
    </style>
    <!-- end css inside -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Title -->
    <div class="title" data-aos="zoom-in-up" data-aos-delay="300">
        <asp:HiddenField runat="server" ID="Products2" Value="Dashboard" Visible="false" />
        <asp:HiddenField runat="server" ID="WorkshopsPage" Value="Dashboard" Visible="false" />
        <asp:HiddenField runat="server" ID="Orders1" Value="Dashboard" Visible="false" />
        <asp:HiddenField runat="server" ID="Dashboard1" Value="Dashboard" Visible="false" />
        <h1>Dashboard</h1>
    </div>
    <!-- End Title -->
    <!-- Start container dashboard report panel -->
    <div class="Container1">
        <!-- Start total -->
        <div class="values" style="transform: translateX(-90px); margin-bottom:50px;">
            <div class="val-box" data-aos="fade-left" data-aos-delay="310" runat="server" id="UsersTotal">
                <i class="fas fa-users"></i>
                <div>
                    <h3 runat="server" id="TotalUsers">0</h3>
                    <span>Total Users</span>
                </div>
            </div>
            <div class="val-box" data-aos="fade-left" data-aos-delay="310">
                <i class="fas fa-shopping-cart"></i>
                <div>
                    <h3 runat="server" id="TotalOrders">0</h3>
                    <span>Total Orders</span>
                </div>
            </div>
            <div class="val-box" data-aos="fade-left" data-aos-delay="310">
                <i class="fas fa-boxes"></i>
                <div>
                    <h3 runat="server" id="TotalProductsSell">0</h3>
                    <span>Total Products Sell</span>
                </div>
            </div>
            <div class="val-box" data-aos="fade-left" data-aos-delay="310">
                <i class="fas fa-dollar-sign"></i>
                <div>
                    <h3 runat="server" id="TotalSells">$0</h3>
                    <span>Total sells</span>
                </div>
            </div>
        </div>
        <!-- End total -->
        <!-- Start this month -->
        <div class="values" style="transform: translateX(-90px); margin-bottom:50px;">
            <div class="val-box" data-aos="fade-left" data-aos-delay="440" runat="server" id="UsersNew">
                <i class="fas fa-users"></i>
                <div>
                    <h3 runat="server" id="TotalNewUsers">0</h3>
                    <span>New Users</span>
                </div>
            </div>
            <div class="val-box" data-aos="fade-left" data-aos-delay="440">
                <i class="fas fa-shopping-cart"></i>
                <div>
                    <h3 runat="server" id="TotalNewOrders">0</h3>
                    <span>New Orders</span>
                </div>
            </div>
            <div class="val-box" data-aos="fade-left" data-aos-delay="440">
                <i class="fas fa-boxes"></i>
                <div>
                    <h3 runat="server" id="TotalNewProductsSell">0</h3>
                    <span>New Products Sell</span>
                </div>
            </div>
            <div class="val-box" data-aos="fade-left" data-aos-delay="440">
                <i class="fas fa-dollar-sign"></i>
                <div>
                    <h3 runat="server" id="TotalNewMonth">$0</h3>
                    <span>New sell</span>
                </div>
            </div>
        </div>
        <!-- End this month -->
        <!--start-Step-Two-->
        <div class="board" style="transform: translateX(-25px)" data-aos="fade-up" data-aos-delay="320">
            <asp:DataList runat="server" data-aos="fade-down" data-aos-delay="330" ID="DataList1">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <td>Name</td>
                            <td>Username</td>
                            <td>User Type</td>
                        </tr>
                    </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tbody id="Dashboard-customers">
                        <tr>
                            <td class="people">
                                <asp:Image runat="server" ImageUrl='<%# Eval("UserNameManagement").ToString() == "Admin" ? "~/Images/Admin/Default/Admin.png" : "~/Images/Admin/Default/Customer.png" %>' />
                                <div class="people-de">
                                    <h4><%#Eval("Fname") %> <%#Eval("Lname") %></h4>
                                    <p><%#Eval("Email") %></p>
                                </div>
                            </td>

                            <td class="people-des">
                                <h5><%#Eval("Username") %></h5>
                                <p>New</p>
                            </td>

                            <td class="role">
                                <p runat="server"><%#Eval("UserNameManagement") %></p>
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div runat="server" id="DashboardDiv" visible="false" style="margin: 0px 0; text-align: center; position:relative; top:100px;" data-aos="fade-up" data-aos-delay="300">
            <i class="fad fa-chart-pie-alt" style="color: var(--MainColor); display: block; font-size: 60px; margin-bottom: 30px;"></i>
            <h4 style="color: var(--MainColor); font-size: 20px; font-weight: 700; margin: 0 auto; max-width: 75%;">There are no records</h4>
        </div>
        <!--End-Step-Two-->
    </div>
    <!-- End container dashboard report panel -->
    <!-- Start Animation -->
    <script>
        AOS.init({
            delay: 300,
        });
    </script>
    <!-- End Animation -->
</asp:Content>
