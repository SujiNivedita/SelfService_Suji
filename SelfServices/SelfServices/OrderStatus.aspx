<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="SelfServices.OrderStatus" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Src="~/faqControl.ascx" TagPrefix="uc1" TagName="faqControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
   

    
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

     <script type="text/javascript">
        var dates;
        var sel;
        function loadDates()
        {
            var date1 = document.getElementById("<%= btnmonth.ClientID %>").value;
            var date2 = document.getElementById("<%= btnDay.ClientID %>").value;
            var date3 = document.getElementById("<%= btnyear.ClientID %>").value;
            dates = [date1 + '/' + date2 + '/' + date3];
        };
        $(document).ready(function () {
            $(document).on('click', "#<%= btnChangeDate.ClientID %>", (function () {
                //   alert("Test");
                  //var date1 = document.getElementById("<%= btnmonth.ClientID %>").value;
                  //var date2 = document.getElementById("<%= btnDay.ClientID %>").value;
                  //var date3 = document.getElementById("<%= btnyear.ClientID %>").value;
                  //dates = [date1 + '/' + date2 + '/' + date3];
                //alert(dates);
                //var dates4 = [$('#id4').text()];
                //tips are optional but good to have
                loadDates();
                $("#ContentPlaceHolder1_duedate").html("Your due date is " + dates + ".");// = document.getElementById("").innerHtml + "hello";


                var tips = ['some description', 'some other description'];
                $("#datepicker").datepicker("refresh");
                $("#datepicker").datepicker({

                    //gotoCurrent: true,
                    //defaultDate: new Date(2015, 07, 23, 00, 00, 00, 00),
                    //maxDate: new Date(2015, 08, 22, 00, 00, 00, 00),
                    //minDate: new Date(2015, 07, 21, 00, 00, 00, 00),
                    minDate:'today',
                    maxDate:'+1M',
                    beforeShowDay: function (date) {
                        loadDates();
                            if (new Date(dates).toString() == date.toString()) {
                                //alert(dates);
                                return [true, 'event', tips[0]];
                            
                        }
                        return [true, ''];
                    },
                    onSelect: function (dateText) {
                        sel = dateText;
                        //alert(sel);
                        //var one = sel.substring(3, 5);
                        //var two = sel.substring(0, 2);
                        //var three = sel.substring(6, 10);
                        //alert(one);
                        //alert(two);
                        //alert(three);
                    }

                });


                // validate();
                $("#modal_dialog").dialog({
                    title: "Change Due Date",

                    buttons: {
                        Close: function () {
                            $(this).dialog('close');
                        },
                        Confirm: function () {
                            //  $("#datepicker").datepicker("refresh");
                            //$("#btnDay").prop('value','29');
                            var one=sel.substring(3, 5);
                            var two = sel.substring(0, 2);
                            var three = sel.substring(6, 10);
                            $("#<%=btnDay.ClientID%>").prop('value', one);
                            $("#<%=btnmonth.ClientID%>").prop('value', two);
                            $("#<%=btnyear.ClientID%>").prop('value', three);
                            //document.getElementById("<%= btnDay.ClientID %>").value = one;
                           // document.getElementById("<%= btnmonth.ClientID %>").value = two;
                            //document.getElementById("<%= btnyear.ClientID %>").value = three;
                            $(this).dialog('close');
                        }

                    },
                    height: 650,
                    width: 500,
                    modal: true,

                });
                return false;
            }));
            
        });
     </script>
    
    <%-- <style type="text/css">
           .event a {
            background-color: red !important;
            background-image :none !important;
            color:yellow;
            }  
     </style>--%>
   

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <link rel="stylesheet" href="Content/bootstrap.css" />
  <link rel="stylesheet" href="Content/bootstrap-theme.css" />
     <br />
    <br />
    <br />
     <hr />
  <div data-ride="carousel" class="carousel slide" id="carousel-example-generic">
      <ol class="carousel-indicators">
        <li class="active" data-slide-to="0" data-target="#carousel-example-generic"></li>
        <li data-slide-to="1" data-target="#carousel-example-generic" class=""></li>
        <li data-slide-to="2" data-target="#carousel-example-generic" class=""></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img alt="First slide"  src="images/im1.jpg" style="width:100%"/>
        </div>
        <div class="item">
          <img alt="Second slide"  src="images/im2.jpg" style="width:100%"/>
        </div>
        <div class="item">
          <img alt="Third slide"  src="images/im3.jpg" style="width:100%"/>
      </div>
      <a data-slide="prev" href="#carousel-example-generic" class="left carousel-control">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a data-slide="next" href="#carousel-example-generic" class="right carousel-control">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>
    </div>
          <br />
    <hr />
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
    
           <style type="text/css">
           .event a {
            background-color:mediumpurple !important;
            background-image :none !important;
            color:yellow;
            }  
     </style>
    

     
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="jumbotron">
        <asp:Label ID="Label1" runat="server" style="color:saddlebrown;font-family:Cooper Black"
            Text="Select OrderId: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1"  runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
           
        </asp:DropDownList>
        <br />
        </div>
  <div >
      <div style="background-color:#d9534f;color:#ffffff;border-color:#d43f3a;font-weight:bolder;float:left;width:60%">
        <br/>
        <h3>Your Order Information</h3>
        <br/>
        </div>
      <div class="jumbotron" style="float:left;width:60%">
     
<h3 style="color:saddlebrown;font-family:Cooper Black">
    
    <asp:Label ID="lbl_instal" runat="server" Text="" ></asp:Label><asp:Label ID="lblInstal" runat="server" Text=""></asp:Label>
        <h3></h3>
    <asp:Button ID="btnDay" runat="server" BackColor="Black" Enabled="False" Font-Bold="True" Font-Names="Cooper Black" Font-Size="XX-Large" ForeColor="White" Height="74px" text="28" Visible="false" Width="83px" />
    &nbsp;&nbsp;
    <asp:Button ID="btnmonth" runat="server" BackColor="Black" Enabled="False" Font-Bold="true" Font-Names="Cooper Black" Font-Size="XX-Large" ForeColor="White" Height="74px" Text="08" Visible="false" Width="83px" />
    &nbsp;&nbsp;
    <asp:Button ID="btnyear" runat="server" BackColor="Black" Enabled="False" Font-Bold="true" Font-Names="Cooper Black" Font-Size="XX-Large" ForeColor="White" Height="74px" Text="2015" Visible="false" Width="83px" />
    <p>
        &nbsp;</p>
    <h3 style="color: saddlebrown; font-family: Cooper Black">
        <asp:Label ID="lbl_esti" runat="server" Text=""></asp:Label>
    </h3>
    <asp:Label ID="lbltime" runat="server" Text=""></asp:Label>
    <p>
        &nbsp;</p>
    <div id="modal_dialog" style="display: none">
        <p id="duedate" runat="server"></p>
        <p>
            You Can change your Due date till a month from the order date.</p>
        <div id="datepicker" align="center">
        </div>
    </div>
    <asp:Button ID="btnChangeDate" runat="server" class="btn btn-danger" Height="48px" Text="Change Due Date" Visible="false" Width="248px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancelOrder" runat="server" class="btn btn-danger" Height="49px" Text="Cancel Order" Visible="false" Width="248px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
   <asp:Label ID="orderDateid" runat="server" Visible="false" Text=""></asp:Label>
          <h3></h3>
          <h3></h3>
          </h3></div>
               <div style="background-color: none !important; float: right; width: 35%;" class="jumbotron">
                   <uc1:faqControl ID="faqControl" runat="server" />
   
    
</div>
   


      </div>
   <br />
            <div style="background-color:#d9534f;color:#ffffff;border-color:#d43f3a;font-weight:bolder;float:left;width:60%">
        <br/>
        <h3>Service Address</h3>
        <br/>
        </div>
     <div class="jumbotron" style="float:left;width:60%">
         <p style="color:saddlebrown;font-family:Cooper Black">
             
             <asp:Label ID="lblServ" runat="server" Text=""></asp:Label>
         </p>
     </div>
             <div style="background-color:#d9534f;color:#ffffff;border-color:#d43f3a;font-weight:bolder;float:left;width:60%">
        <br/>
        <h3>Service Details</h3>
        <br/>
        </div>
    <div class="jumbotron" style="float:left;width:60%;color:saddlebrown;font-family:Cooper Black">
        
        
        
        <p style="color:saddlebrown;font-family:Cooper Black">
            <asp:Label ID="lbl_prodinfo" runat="server" Text=""></asp:Label>
        
           
        <asp:GridView ID="products" runat="server" style="color:saddlebrown;border-style:hidden;border-color:InactiveBorder;font-family:Cooper Black"></asp:GridView></p>
</div>
  
            </ContentTemplate>
    </asp:UpdatePanel>
     <hr />
         <br />
</asp:Content>
