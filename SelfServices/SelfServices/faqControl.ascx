<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="faqControl.ascx.cs" Inherits="SelfServices.faqControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%--<link rel="stylesheet" href="Content/bootstrap.css" />--%>
<style type="text/css">
    .btn-danger {
        color: #ffffff;
        background-color: #d9534f;
        border-color: #d43f3a;
    }  
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=60);
        opacity: 0.6;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        width: 300px;
        border: 3px solid red;
        border-radius: 12px;
        padding:0
      
    }
    .modalPopup .header
    {
        background-color: red;
        height: 30px;
        color: White;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
        border-top-left-radius: 6px;
        border-top-right-radius: 6px;
    }
    .modalPopup .body
    {
        min-height: 50px;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }
    .modalPopup .footer
    {
        padding: 6px;
    }
    .modalPopup .yes, .modalPopup .no
    {
        height: 23px;
        color: Black;
        line-height: 23px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
        border-radius: 4px;
    }
    .modalPopup .yes
    {
        background-color: #2FBDF1;
        border: 1px solid #0DA9D0;
    }
    .modalPopup .no
    {
        background-color: #9F9F9F;
        border: 1px solid #5C5C5C;
    }
</style>

<p>
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" ForeColor="#3399FF" Text="We're here to help you..." Font-Names="Cooper Black"></asp:Label>
</p>
<p>

    <asp:LinkButton ID="LinkButton1"  PostBackUrl="//www.youtube.com/embed/caELQ4juL0Y?rel=0&amp;autoplay=1" runat="server" >Troubleshoot your  FiOS Router</asp:LinkButton>
</p>
<p>
    <asp:LinkButton ID="LinkButton3"  PostBackUrl="//www.youtube.com/embed/NmqQsxqLqaU?rel=0&amp;autoplay=1" runat="server" >Improving your gaming connnection</asp:LinkButton>
</p>
<p>
    <asp:LinkButton ID="LinkButton2" PostBackUrl="//www.youtube.com/embed/a9q-tDRCTtc?rel=0&amp;autoplay=1" runat="server">How to create a secure password</asp:LinkButton>
</p>
<p>
    <asp:LinkButton ID="LinkButton4"  PostBackUrl="//www.youtube.com/embed/affSl7XxBmE?list=PLooRvxIU8b2WAMTuKzQ2nxKxoa1q6qWv5?rel=0&amp;autoplay=1" runat="server">How to Program your FiOS TV Remote</asp:LinkButton>
</p>
<div class="jumbotron" style="height: 519px; width: 289px; ">
    <br />
    &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Cooper Black" Font-Size="X-Large" ForeColor="#999966" Text="Tell us your Queries and Get Instant Answers"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:Image ID="Image1" runat="server" Height="158px" ImageUrl="~/images/calcentre.jpg" Width="234px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    
    <asp:Button ID="ask" class="btn btn-danger" runat="server" style="z-index: 1; left: 25px; top: 0px; position: relative; margin-bottom: 0px; width: 237px; height: 61px;" Text="Ask Us" OnClick="ask_Click" />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;
    <br />
    <cc1:ModalPopupExtender ID="mpe"  runat="server" PopupControlID="pnlPopup" TargetControlID="ask"
    OkControlID="btnYes" CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
    <div class="header">
        Enter your Query:
    </div>
    <div class="body">
        Mail Adress:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        Query:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>
    <div class="footer" align="right">
        <asp:Button ID="btnYes" runat="server" Text="Submit" CssClass="yes" />
        <asp:Button ID="btnNo" runat="server" Text="Cancel" CssClass="no" />
    </div>
</asp:Panel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>


<p>
    &nbsp;</p>
<p>
    &nbsp;</p>



