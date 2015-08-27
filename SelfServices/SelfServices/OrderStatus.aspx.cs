using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SelfServices.Models;
using SelfServices.Utilities;

namespace SelfServices
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        Profile p;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["customerId"] = "VZ/1234";
           
            if (Session["customerId"] != null)
            {
                if (!Page.IsPostBack)
                {

                    string cid = (string)Session["customerId"];
                    p = Profile.GetUserProfile(cid);
                    List<string> orderId = new List<string>();
                    if (p != null)
                    {
                        foreach (OrderWrapper orders in p.Orders)
                        {
                            if (orders.Status != "cancelled")
                            {
                                orderId.Add(orders.Id);
                            }

                        }

                        DropDownList1.DataSource = orderId;
                        DropDownList1.DataBind();


                        string order_id = p.Orders[0].Id;
                        DateTime order_date = p.Orders[0].OrderDate;
                        DateTime instal_date = Extensions.ToDateTime(p.Orders[0].InstallationDate.ToString());
                        lbl_instal.Text = "Your order is scheduled installation on:";
                        btnDay.Visible = true;
                        btnDay.Text = instal_date.Day.ToString();
                        btnmonth.Visible = true;
                        btnmonth.Text = instal_date.Month.ToString();
                        btnyear.Visible = true;
                        btnyear.Text = instal_date.Year.ToString();
                        btnChangeDate.Visible = true;
                        btnCancelOrder.Visible = true;
                        orderDateid.Text =order_date.ToString();
                        lbl_esti.Text = "Estimated Time :";
                        lbltime.Text = "1hr 15 mins";
                        
                        lblServ.Text = p.ServiceAddress;
                     
                        lbl_prodinfo.Text = "Included in this order ";
                        products.DataSource = p.Orders[0].Services;
                        products.DataBind();

                    }
                }
                
            }
            else
            {
                Response.Redirect("index.aspx");
            }


        }

        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {

           int i= ServiceJsonHelper.CancelOrder(DropDownList1.SelectedItem.Value);
            if (i == 1)
            {
                string cid = (string)Session["customerId"];
                p = Profile.GetUserProfile(cid);
                List<string> orderId = new List<string>();
                if (p != null)
                {
                    foreach (OrderWrapper orders in p.Orders)
                    {
                        if (orders.Status != "cancelled")
                        {
                            orderId.Add(orders.Id);
                        }

                    }

                    DropDownList1.DataSource = orderId;
                    DropDownList1.DataBind();
                }
                else
                {
                    Response.Write("The order dint get cancelled!Please Try again later");
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cid = (string)Session["customerId"];
            p = Profile.GetUserProfile(cid);
            string orderid = DropDownList1.SelectedItem.Value;
            foreach (OrderWrapper oid in p.Orders)
            {
                if (oid.Id == orderid)
                {
                    string status = oid.Status;
                    DateTime order_date = oid.OrderDate;
                   DateTime instal_date =p.Orders[0].InstallationDate;
                    if (status == "new" || status == "out provision")
                    {
                        lbl_instal.Text = "Your order is scheduled installation on:";
                        btnDay.Visible = true;
                        btnDay.Text = instal_date.Day.ToString();
                        btnmonth.Visible = true;
                        btnmonth.Text = instal_date.Month.ToString();
                        btnyear.Visible = true;
                        btnyear.Text = instal_date.Year.ToString();
                        btnChangeDate.Visible = true;
                        btnCancelOrder.Visible = true;
                        orderDateid.Text = order_date.ToString();
                        lbl_esti.Text = "Estimated Time :";
                        lbltime.Text = "1hrs 15 mins";
                       
                        lblServ.Text=p.ServiceAddress;
                       
                        lbl_prodinfo.Text = "Included in this order ";
                        products.DataSource = oid.Services;
                        products.DataBind();
                    }
                    if (status == "in provision")
                    {
                        lbl_instal.Text = "Your order is scheduled installation on:";
                        btnDay.Visible = true;
                        btnDay.Text = instal_date.Day.ToString();
                        btnmonth.Visible = true;
                        btnmonth.Text = instal_date.Month.ToString();
                        btnyear.Visible = true;
                        btnyear.Text = instal_date.Year.ToString();
                        btnChangeDate.Visible = true;
                        btnCancelOrder.Visible = false;
                        orderDateid.Text = order_date.ToString();
                        lbl_esti.Text = "Estimated Time :";
                        lbltime.Text = "1hrs 15 mins";
                        
                        lblServ.Text = p.ServiceAddress;
                       
                        lbl_prodinfo.Text = "Included in this order ";
                        products.DataSource = oid.Services;
                        products.DataBind();
                    }
                    if (status == "Completed")
                    {
                        lbl_instal.Text = "Your order was Successfully completed!";
                        lblInstal.Text = "Installed on";
                        btnDay.Visible = true;
                        btnDay.Text = instal_date.Day.ToString();
                        btnmonth.Visible = true;
                        btnmonth.Text = instal_date.Month.ToString();
                        btnyear.Visible = true;
                        btnyear.Text = instal_date.Year.ToString();
                        btnChangeDate.Visible = false;
                        btnCancelOrder.Visible = false;
                        //lbl_esti.Text = "Estimated Time :";
                        //lbltime.Text = "1hrs 15 mins";
                        orderDateid.Text = order_date.ToString();
                        lblServ.Text = p.ServiceAddress;
                        
                        lbl_prodinfo.Text = "Included in this order ";
                        products.DataSource = oid.Services;
                        products.DataBind();
                    }
                }
                //if (DropDownList1.SelectedItem.Value == "SampleId1")
                //{

                //    lbl_instal.Text = "Your order is scheduled installation on:";
                //    btnDay.Visible = true;
                //    btnmonth.Visible = true;
                //    btnyear.Visible = true;
                //    btnChangeDate.Visible = true;
                //    btnCancelOrder.Visible = true;
                //    btnCancelOrder.Enabled = false;
                //    btnCancelOrder.ToolTip = "Your order has crossed the cancellation stage";
                //    lbl_esti.Text = "Estimated Time :";
                //    lbltime.Text = "3hrs 45 mins";
                //    lbl_serv.Text = "service address";
                //    lbl_ordrinfo.Text = "Order Info";
                //    lbl_prodinfo.Text = "Included in this order ";
                //}
                //if (DropDownList1.SelectedItem.Value == "SampleId3")
                //{
                //    lbl_instal.Text = "Your order is complete!Installed on:";
                //    btnDay.Visible = true;
                //    btnmonth.Visible = true;
                //    btnyear.Visible = true;
                //    btnChangeDate.Visible = false;
                //    btnCancelOrder.Visible = false;
                //    lbl_esti.Text = "";
                //    lbltime.Text = "";
                //    lbl_serv.Text = "service address";
                //    lbl_ordrinfo.Text = "Order Info";
                //    lbl_prodinfo.Text = "Included in this order ";

                //}
                //if (DropDownList1.SelectedItem.Value == "sample_id2")
                //{
                //    lbl_instal.Text = "Your order is scheduled installation on:";
                //    btnDay.Visible = true;
                //    btnmonth.Visible = true;
                //    btnyear.Visible = true;
                //    btnChangeDate.Visible = true;
                //    btnCancelOrder.Visible = true;
                //    lbl_esti.Text = "Estimated Time :";
                //    lbltime.Text = "3hrs 45 mins";
                //    lbl_serv.Text = "service address";
                //    lbl_ordrinfo.Text = "Order Info";
                //    lbl_prodinfo.Text = "Included in this order ";

                //}
            }
        }
    }
}