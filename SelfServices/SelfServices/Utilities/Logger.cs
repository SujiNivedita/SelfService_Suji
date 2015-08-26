using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SelfServices.Utilities
{
    public static class Logger
    {
        public static void LogException(Exception e)
        {
            System.IO.File.WriteAllText("D:\\log.txt", e.Message);
        }
    }
}