using SelfServices.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SelfServices.Models
{
    public class ServiceWrapper
    {
        public string Name { get; set; }
    }

    public class OrderWrapper
    {
        public string Id { get; set; }
        public DateTime OrderDate { get; set; }
        public DateTime InstallationDate { get; set; }
        public string Status { get; set; }
        public List<ServiceWrapper> Services { get; set; }
    }

    public class Profile
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public List<OrderWrapper> Orders
        {
            get;
            set;
        }

        public string ServiceAddress { get; set; }

        public static Profile GetUserProfile(string customerId)
        {
            return ServiceJsonHelper.PullProfile(customerId);
        }
    }

}