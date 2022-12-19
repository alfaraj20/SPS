<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SPS.Views.Customer.Home" %>

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
        body{
            background-color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Start landing section-->
    <div class="landing">
        <div class="intro-text">
            <h1 style="color: white;">Hello there</h1>
            <p style="color: white;">We are special company to provid all spare parts for cars</p>
        </div> 
    </div>
    <!--End landing section-->
    <!--Start features section-->
    <section id="qualitey1" class="qulities1">
        <h2 data-aos="fade-down">What we offer to you?</h2>
        <div class="qualitey-container1">
            <div class="qualitey1" data-aos="fade-right">
                <div class="header-container1">
                    <h3>Workshop</h3>
                    <i class="fas fa-store"></i>
                </div>
                <p>We are have a lot of workshop that is on website</p>
            </div>
            <div class="qualitey1" data-aos="fade-down">
                <div class="header-container1">
                    <h3>Products</h3>
                    <i class="fas fa-boxes"></i>
                </div>
                <p>We are have a lot of products that is on website</p>
            </div>
            <div class="qualitey1" data-aos="fade-left">
                <div class="header-container1">
                    <h3>Fast Delivery</h3>
                    <i class="fas fa-shipping-fast"></i>
                </div>
                <p>We are have a lot of cars that is have powerful engine to deliver your order</p>
            </div>
        </div>
    </section>
    <div style="position:relative; width:90%; max-width:1366px; margin:4rem auto; margin-top:135px;padding:1.6rem;" data-aos="fade-down">
        <h2 style="position:absolute; left:600px; font-size:3rem; color:var(--MainColor);">Join Us</h2>
    </div>
    <!--End features section-->
    <!--Start add workshop-->
    <div runat="server" id="AddWorkshopDiv" style="position: relative; top: 0px; width: 90%; max-width:1366px; height: 180px; margin: 4rem auto; margin-top:135px; background-color: var(--SectionBackground); border-radius:1.6rem; padding: 1.6rem; margin-bottom: 130px;" data-aos="fade-up">
        <div>
            <asp:Image runat="server" ImageUrl="~/Images/Admin/Default/HandShake2.jpeg" style="height:130px; position:absolute;border-radius:1.6rem;"/>
            <h3 style="position:absolute; left: 250px; color:var(--MainColor)">Add your workshop</h3>
            <p style="position:absolute; line-height: 1.6; left:250px; top:65px; margin: 1rem auto; font-weight:500; max-width: 1075px">Add your workshop to our website, and manage your workshop easily. We are will give you dashboard to see total orders,products, and sells. You are will see to the quantity of product, and you are will see details about the orders when customer buy from you. You are will be allowed to login any time to the dashboard.</p>
            <asp:Button runat="server" Text="Add your workshop" OnClick="AddWorkshop" style="position:absolute; left: 1168px; top:30px; border: none; background: var(--MainColor); color: white; border-radius: 3px; font-weight: 700; height: 36px; padding: 10px; font-size: 15px; cursor:pointer;"/>
        </div>
    </div>
    <div style="height: 110px;">
    </div>
    <!--End add workshop-->
    <!-- Start Animation -->
    <script>
        AOS.init({
            offset: 400,
            duration: 1000,
        });
    </script>
    <!-- End Animation -->
</asp:Content>
