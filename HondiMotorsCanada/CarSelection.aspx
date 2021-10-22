<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarSelection.aspx.cs" Inherits="HondiMotorsCanada.CarSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hondi Motors Canada</title>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" /> 
    <link type="text/css" href="//fonts.cdnfonts.com/css/helsinki" rel="stylesheet"/>
    
    <style type="text/css">
        /*h1 the title Hondi Build & Price*/
        .auto-style1{
            text-align:center;
            font-family: 'Helsinki', sans-serif;                               
            font-weight:bolder;
            color:#2F5D62;
        }
        /*the whole form*/
        .auto-style2{
            height: 700px;
        }
        /*the car info colum*/
        .auto-style3{
            height: 120px;
        }
        /*the table inside the car info panel*/
        .auto-style4{
            width: 350px;
        }
        /*the left colum of the car info table*/
        .auto-style5{
            width:200px;
        }
        /*the right colum of the car info table*/
        .auto-style6{
            width:270px;
            padding: 5px;
        }
        /*the biggest table*/
        .auto-style7{
            width:500px;
        }
        /*the price resume and final info colum*/
        .auto-style8{
            height:120px;
        }
        /*the car info panel*/ 
        .stylePanelInfo{
            width: 400px;
        }
        .stylePanelInfo legend{
            color: #5E8B7E;
            font-weight: bold;
        }
        .stylePanelInfo fieldset{
            border-color: #5E8B7E;
        }
        /*the price resume panel*/
        .stylePanelPrice{
            margin-top:0px;
        }
        .stylePanelPrice legend{
            color: #5E8B7E;
            font-weight: bold;
        }
        .stylePanelPrice fieldset{
            border-color: #5E8B7E;
        }
        /*the final information panel*/
        .stylePanelFinal{
            margin-top:0px;
        }
        .stylePanelFinal legend{
            color: #5E8B7E;
            font-weight: bold;
        }
        .stylePanelFinal fieldset{
            border-color: #5E8B7E;
        }
        /*textbox style*/
        .textbox{
            border-radius: 5px;
            font-family: "Open Sans";
        }
        /*body font*/
        body { font-family: "Open Sans";} 
        /*button conclude*/
        #btnConclude{
            position: relative;
            right: 0px;
            bottom:0px;
            float: right;
            background-color:#5E8B7E;
            color:#ffffff;
            height:40px;
            font-family: "Open Sans";
        }
        
    </style>
</head>
<body style="background:#DFEEEA">
    <form id="form1" runat="server" class="auto-style2">
        <div>
            <h1 class="auto-style1">Hondi Build & Price</h1>
            <hr />
            <p style="background-color:#5E8B7E; color:#ffffff;font-weight:bold;">
                <marquee>Hondi Car is produced exclusively for you, Alex Client!!!</marquee>
            </p>
            <hr />
        </div>
        <table align="center" class="auto-style7">
            <tr style="vertical-align:top">
                <td class="auto-style3">
                    <asp:Panel ID="panInfo" runat="server" CssClass="stylePanelInfo" GroupingText="Car Informations" BackColor="White">
                        <table class="auto-style4">
                            <!--City-->
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="lblCity" runat="server" AccessKey="c" AssociatedControlID="txtCity" Text="Your City "></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:TextBox ID="txtCity" CssClass="textbox" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <!--Zip Code-->
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="lblZipCode" runat="server" AccessKey="z" AssociatedControlID="txtZipCode" Text="Zip Code "></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:TextBox ID="txtZipCode" CssClass="textbox" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <!--Select Car model-->
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="lblCarModel" runat="server" Text="Select Car model "></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:DropDownList ID="cboCarModel" runat="server" CssClass="textbox" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="cboCarModel_SelectedIndexChanged">
                                        <asp:ListItem>Select a car</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <!--Interior Color-->
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="lblInterColor" runat="server" Text="Interior Color "></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:ListBox ID="lstInterColor" runat="server" CssClass="textbox" Width="130px" Height="60px" AutoPostBack="true"></asp:ListBox>
                                </td>
                            </tr>
                            <!--Accessories-->
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="lblAccessories" runat="server" Text="Accessories "></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:CheckBoxList ID="chklstAccessories" runat="server" AutoPostBack="true"></asp:CheckBoxList>
                                </td>
                            </tr>
                            <!--Warranty-->
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="lblWarranty" runat="server" Text="Warranty "></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:RadioButtonList ID="radlstWarranty" runat="server" AutoPostBack="true"></asp:RadioButtonList>
                                </td>
                            </tr>
                            <!--Dealer Contact you by phone-->
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="lblPhoneContact" runat="server" Text="Dealer Contact you by phone? "></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:CheckBox ID="chkPhoneContact" runat="server" AutoPostBack="true" OnCheckedChanged="chkPhoneContact_CheckedChanged" />
                                </td>
                            </tr>
                            <!--Phone Number-->
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number "></asp:Label>
                                </td>
                                <td class="auto-style6">
                                    <asp:TextBox ID="txtPhone" CssClass="textbox" runat="server" Width="150px" TextMode="Phone" ></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:Panel>
                </td>
                <td class="auto-style8">
                    <!--Price Resume Panel-->
                    <asp:Panel ID="panPriceResume" runat="server" GroupingText="Price Resume" Width="350px" CssClass="stylePanelPrice" BackColor="White">
                        <asp:Literal ID="litPriceResume" runat="server"></asp:Literal>
                        <asp:Button ID="btnConclude" runat="server" Text="Conclude" OnClick="btnConclude_Click" />
                    </asp:Panel>
                    <br/>
                    <!--Final Information Panel-->
                    <asp:Panel ID="panFinalInfo" runat="server" GroupingText="Final Information" Width="350px" CssClass="stylePanelFinal" BackColor="White">
                        <asp:Literal ID="litFinalInfo" runat="server"></asp:Literal>
                    </asp:Panel>
                </td>
            </tr>

        </table>
    </form>
</body>
</html>
