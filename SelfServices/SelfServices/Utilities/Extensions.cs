using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SelfServices.Utilities
{
    public static class Extensions
    {
        public static DateTime ToDateTime(this string dateString)
        {
            DateTime date;
            if(DateTime.TryParse(dateString, out date))
            {
                return date;
            }
            else
            {
                return DateTime.MinValue;
            }
            
        }
    }
}