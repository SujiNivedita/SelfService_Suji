using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SelfServices.Utilities;

namespace SelfServices.Models
{

    public class ProfilePull
    {
        public string lineofbusiness { get; set; }
        public Customerdetails customerdetails { get; set; }
        public Existingsnp existingsnp { get; set; }
        public Orderhistory[] orderhistory { get; set; }
        public Contractdetail[] contractdetails { get; set; }

        public Profile GetCustomProfile()
        {
            Profile profile = new Profile();
            Connectionaddress address = this.customerdetails.connectionaddress;
            profile.FirstName = this.customerdetails.fname;
            profile.LastName = this.customerdetails.lname;
            profile.ServiceAddress = String.Format("{0}, {1} - {2}, {3}, {4}", address.streetname, address.city, address.zipcode, address.state, address.country);
            profile.Orders = new List<OrderWrapper>();
            foreach (var order in orderhistory)
            {
                OrderWrapper orderWrap = new OrderWrapper();
                orderWrap.Id = order.orderid;
                orderWrap.InstallationDate = order.duedate.ToDateTime();
                orderWrap.OrderDate = order.dateoforder.ToDateTime();
                orderWrap.Services = new List<ServiceWrapper>();
                foreach (var service in order.services)
                {
                    orderWrap.Services.Add(new ServiceWrapper() { Name = service.servicename });
                }
                orderWrap.Status = order.orderstatus;
                profile.Orders.Add(orderWrap);
            }

            return profile;
        }
    }

    public class Customerdetails
    {
        public string customerid { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public string customerstatus { get; set; }
        public string billstartdate { get; set; }
        public Connectionaddress connectionaddress { get; set; }
        public Billingaddress billingaddress { get; set; }
        public string email { get; set; }
        public long contactnumber { get; set; }
        public string dateofbirth { get; set; }
    }

    public class Connectionaddress
    {
        public string streetname { get; set; }
        public int zipcode { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public int stateid { get; set; }
        public string country { get; set; }
    }

    public class Billingaddress
    {
        public string streetname { get; set; }
        public int zipcode { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public int stateid { get; set; }
        public string country { get; set; }
    }

    public class Existingsnp
    {
        public Service[] services { get; set; }
        public Product[] products { get; set; }
    }

    public class Service
    {
        public string servicecode { get; set; }
        public string servicename { get; set; }
        public int serviceid { get; set; }
        public long mdn { get; set; }
        public string servicedate { get; set; }
        public Quantity quantity { get; set; }
    }

    public class Quantity
    {
        public int max { get; set; }
        public int current { get; set; }
    }

    public class Product
    {
        public string productcode { get; set; }
        public string productname { get; set; }
        public int productid { get; set; }
    }

    public class Orderhistory
    {
        public string orderid { get; set; }
        public string dateoforder { get; set; }
        public string duedate { get; set; }
        public string orderstatus { get; set; }
        public Service1[] services { get; set; }
        public Product1[] products { get; set; }
    }

    public class Service1
    {
        public string servicecode { get; set; }
        public string servicename { get; set; }
        public int serviceid { get; set; }
        public Quantity1 quantity { get; set; }
    }

    public class Quantity1
    {
        public int max { get; set; }
        public int current { get; set; }
    }

    public class Product1
    {
        public string productcode { get; set; }
        public string productname { get; set; }
        public int productid { get; set; }
    }

    public class Contractdetail
    {
        public string contractid { get; set; }
        public string modeltype { get; set; }
        public string classofservice { get; set; }
        public string fromdate { get; set; }
        public string todate { get; set; }
        public int current { get; set; }
        public int max { get; set; }
        public int discountpercentage { get; set; }
    }



}