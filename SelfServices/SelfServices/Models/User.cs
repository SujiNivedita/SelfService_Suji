using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using SelfServices.Utilities;

namespace SelfServices.Models
{
    public class User
    {
        public string Username { get; set; }

        private string password;
        public string Password
        {
            get
            {
                return password;
            }
            set
            {
                password = HashPassword(value);
            }
        }

        public string CustomerId { get; set; }
        public string SecurityQuestion { get; set; }
        public string SecurtiyAnswer { get; set; }
        public string EmailId { get; set; }

        public void LoadUserDetails()
        {
            if(Username!=null)
            {
                User temp = DataAccessHelper.GetUser(Username);
                CustomerId = temp.CustomerId;
                SecurityQuestion = temp.SecurityQuestion;
                SecurtiyAnswer = temp.SecurtiyAnswer;
                EmailId = temp.EmailId;                
            }
            
        }

        public User() { }

        public User(string username,string password)
        {
            Username = username;
            Password = password;
        }

        public User(string username, string password, string customerId, string securityQuestion, string securityAnswer, string emailId)
        {
            Username = username;
            Password = password;
            CustomerId = customerId;
            SecurityQuestion = securityQuestion;
            SecurtiyAnswer = securityAnswer;
            EmailId = emailId;
        }

        private static string HashPassword(string password)
        {
            MD5 hasher = MD5.Create();
            byte[] hashBytes=hasher.ComputeHash(Encoding.UTF8.GetBytes(password));
            string hash = Encoding.ASCII.GetString(hashBytes);
            return hash;
        }
        
        public static bool IsRegistered(User user)
        {
            return DataAccessHelper.IsUserExists(user);            
        }

        public static bool TryRegister(User user)
        {
            if(DataAccessHelper.IsUserNameAvailable(user.Username) && DataAccessHelper.IsCustomerIdAvailable(user.CustomerId))
            {
                DataAccessHelper.RegisterUser(user);
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    public class UserLoginModel
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }
}