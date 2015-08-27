using SelfServices.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SelfServices
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            Response.Cache.SetValidUntilExpires(false);
            Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            if (Session["customerId"] != null)
            {
                Response.Redirect("/Pages/OrderStatus.aspx");
            }
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true, ResponseFormat = ResponseFormat.Json, XmlSerializeString = false)]
        public static string Test()
        {
            return "hello";
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, XmlSerializeString = false)]
        public static string Login(UserLoginModel user)
        {
            return "lol";
            //if(!String.IsNullOrWhiteSpace(user.Username) && !String.IsNullOrWhiteSpace(user.Password))
            //{
            //    User loginUser = new Models.User(user.Username, user.Password);
            //    if (Models.User.IsRegistered(loginUser))
            //    {
            //        Session.Add("user", user.Username);
            //        Response.Redirect("/Pages/OrderStatus.aspx");
            //    }                                
            //}
            //return "Invalid Username/Password";            
        }
    }
}
    
