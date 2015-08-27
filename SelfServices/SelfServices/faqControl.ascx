<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="faqControl.ascx.cs" Inherits="SelfServices.faqControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<link rel="stylesheet" href="Content/bootstrap.min.css" />
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/jquery.magnific-popup.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/magnific-popup.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/magnific-popup.min.css" />



<style type="text/css">
    .btn-danger {
        color: #ffffff;
        background-color: #d9534f;
        border-color: #d43f3a;
    }  
    .hide-block{
    display: none;
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
        width: 500px;
        border: 3px solid #d9534f;
        border-radius: 12px;
        padding:0
      
    }
    .modalPopup .header
    {
        background-color: #d9534f;
        height: 30px;
        color: White;
        line-height: 30px;
        text-align: centre;
        font-weight: bold;
        border-top-left-radius: 6px;
        border-top-right-radius: 6px;
    }
    .modalPopup .body
    {
        min-height: 50px;
        line-height: 30px;
        text-align: left;
        font-weight: bold;
    }
    .modalPopup .footer
    {
        padding: 6px;
    }
    /*.modalPopup .yes, .modalPopup .no
    {
        height: 30px;
        color: Black;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
        border-radius: 4px;
    }
    .modalPopup .yes
    {
        background-color: #2FBDF1;
        border: 2px solid #0DA9D0;
    }
    .modalPopup .no
    {
        background-color: #9F9F9F;
        border: 2px solid #5C5C5C;
    }*/
</style>

 <script type="text/javascript">
      $(document).ready(function() {
        $('.popup-youtube').magnificPopup({
          disableOn: 700,
          type: 'iframe',
          mainClass: 'mfp-fade',
          removalDelay: 160,
          preloader: false,

          fixedContentPos: false
        });
      });
    </script>
<p>
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="True" ForeColor="#3399FF" Text="We're here to help you..." Font-Names="Cooper Black"></asp:Label>
</p>
<p>

    <a class="popup-youtube" ID="LinkButton1"  href="//www.youtube.com/embed/caELQ4juL0Y?rel=0&amp"  runat="server" >Troubleshoot your  FiOS Router</a>
</p>
<p>
    <a class="popup-youtube" ID="LinkButton3"  href="//www.youtube.com/embed/NmqQsxqLqaU?rel=0&amp"  runat="server" >Improving your gaming connnection</a>
</p>
<p>
    <a class="popup-youtube" ID="LinkButton2" href="//www.youtube.com/embed/a9q-tDRCTtc?rel=0&amp"   runat="server">How to create a secure password</a>
</p>
<p>
    <a class="popup-youtube" ID="LinkButton4"  href="//www.youtube.com/embed/affSl7XxBmE?list=PLooRvxIU8b2WAMTuKzQ2nxKxoa1q6qWv5?rel=0&amp"  runat="server">How to Program your FiOS TV Remote</a>
</p>

  
     
<div class="jumbotron" style="height: 519px; width: 289px; ">
    <br />
    &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Cooper Black" Font-Size="X-Large" ForeColor="#999966" Text="Give Your feedback and help us serve you better!"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:Image ID="Image1" runat="server" Height="158px" ImageUrl="~/images/calcentre.jpg" Width="234px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    
    <asp:Button ID="ask" class="btn btn-danger" runat="server" style="z-index: 1; left: 25px; top: 0px; position: relative; margin-bottom: 0px; width: 237px; height: 61px;" Text="Give Feedback" OnClick="ask_Click" />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;
    <br />
    <cc1:ModalPopupExtender ID="mpe"  runat="server" PopupControlID="pnlPopup" TargetControlID="ask"
      CancelControlID="btnNo" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
    <div class="header">
        Enter your Feedback:
    </div>
    <div class="body">
        Name:<asp:TextBox ID="mailAddr" runat="server"></asp:TextBox><br /><br/>
        Feedback:<asp:TextBox ID="query" runat="server"></asp:TextBox><br /><br />
    </div>
    <div class="footer" align="right">
        <asp:Button ID="btnYes" class="btn btn-danger" runat="server" Text="Submit" />
        <cc1:ModalPopupExtender ID="mpe2"  runat="server" PopupControlID="pnlPopup1" TargetControlID="btnYes"
    OkControlID="btnYes1" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="pnlPopup1" runat="server" CssClass="modalPopup" Style="display: none">
     <div class="body">
         <%this.mailAddr.Text = ""; %>
         <%this.query.Text = ""; %>
      Thank you! Your Feedback was Successfully Submitted!<br />
     <asp:Button ID="btnYes1" class="btn btn-danger" runat="server" Text="Close" align="centre" />
    </div>
</asp:Panel>
        <asp:Button ID="btnNo" class="btn btn-danger" runat="server" Text="Exit" />
    </div>
</asp:Panel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>


<p>
    &nbsp;</p>
<p>
    &nbsp;</p>



