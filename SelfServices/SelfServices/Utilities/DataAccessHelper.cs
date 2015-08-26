using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using Oracle.DataAccess.Client;
using SelfServices.Models;

namespace SelfServices.Utilities
{
    public static class DataAccessHelper
    {
        private static string CONNECTION_STRING = ConfigurationManager.ConnectionStrings["oracleXE"].ConnectionString;

        

        public static User GetUser(string username)
        {
            User user = null;
            if (username != null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = "SELECT password,customerId,securityQuestion,securityAnswer,email FROM Users WHERE username LIKE :username";
                        command.Parameters.Add(":username", OracleDbType.NVarchar2).Value = username;
                        command.Connection = connection;
                        connection.Open();
                        OracleDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            string password = reader["password"].ToString();
                            string customerId = reader["customerId"].ToString();
                            string securityQuestion = reader["securityQuestion"].ToString();
                            string securityAnswer = reader["securityAnswer"].ToString();
                            string email = reader["email"].ToString();
                            user = new User(username, password, customerId, securityQuestion, securityAnswer, email);
                        }
                    }
                }

                catch (Exception e)
                {
                    user = null;
                    Logger.LogException(e);
                }
            }
            return user;
        }
    

        public static bool IsUserExists(User user)
        {
            bool exists = false;
            if(user!= null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = "SELECT COUNT(*) FROM Users WHERE username LIKE :username AND password LIKE :password";
                        command.Parameters.Add(":username", OracleDbType.NVarchar2).Value = user.Username;
                        command.Parameters.Add(":password", OracleDbType.NVarchar2).Value = user.Password;
                        command.Connection = connection;
                        connection.Open();
                        int count = Convert.ToInt32(command.ExecuteScalar());
                        if (count == 1)
                            exists= true;
                        else
                            exists= false;
                    }
                }

                catch (Exception e)
                {
                    exists = false;
                    Logger.LogException(e);                    
                }
            }
            return exists;                        
        }


        public static bool IsAvailable(string columnName, string value)
        {
            bool available = false;
            if (!String.IsNullOrWhiteSpace(columnName) && value != null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = String.Format("SELECT COUNT(*) FROM Users WHERE {0} LIKE :value",columnName);
                        command.Parameters.Add(":value", OracleDbType.NVarchar2).Value = value;
                        command.Connection = connection;
                        connection.Open();
                        int count = Convert.ToInt32(command.ExecuteScalar());                         
                        if (count==0)
                            available = true;
                        else
                            available = false;
                    }
                }

                catch (Exception e)
                {
                    available = false;
                    Logger.LogException(e);
                }
            }
            return available;
        }

        public static bool IsUserNameAvailable(string username)
        {
            return IsAvailable("username", username);                 
        }

        public static bool IsCustomerIdAvailable(string customerId)
        {
            return IsAvailable("customerId", customerId);
        }

        public static void RegisterUser(User user)
        {
            if (user != null)
            {
                try
                {
                    using (OracleConnection connection = new OracleConnection(CONNECTION_STRING))
                    {
                        OracleCommand command = new OracleCommand();
                        command.CommandText = "INSERT INTO Users VALUES(:username,:password,:customerId,:securityQuestion,:securityAnswer,:email)";
                        command.Parameters.Add(":username", OracleDbType.NVarchar2).Value = user.Username;
                        command.Parameters.Add(":password", OracleDbType.NVarchar2).Value = user.Password;
                        command.Parameters.Add(":customerId", OracleDbType.NVarchar2).Value = user.CustomerId;
                        command.Parameters.Add(":securityQuestion", OracleDbType.NVarchar2).Value = user.SecurityQuestion;
                        command.Parameters.Add(":securityAnswer", OracleDbType.NVarchar2).Value = user.SecurtiyAnswer;
                        command.Parameters.Add(":email", OracleDbType.NVarchar2).Value = user.EmailId;
                        command.Connection = connection;
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }

                catch (Exception e)
                {                    
                    Logger.LogException(e);
                }
            }
        }

    }
}