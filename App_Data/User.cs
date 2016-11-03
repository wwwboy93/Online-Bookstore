using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using myDB;
/// <summary>
/// User 的摘要说明
/// </summary>
namespace UserDB {
    public class User
    {

        public static int Login(string name, string psw)//验证登录,登录成功返回用户id,失败返回0
        {
            int result = 0;
            SqlConnection myConn = DBclass.GetConnection();
            string sqlstr = "select * from [user] where user_name='" + name + "' and psw='" + psw+"'";
            SqlCommand myCmd = new SqlCommand(sqlstr, myConn);
            SqlDataAdapter myDa = new SqlDataAdapter(myCmd);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs);
            if (myDs.Tables[0].Rows.Count > 0)//登录成功
            {
                result = Convert.ToInt32(myDs.Tables[0].Rows[0]["user_id"]);
            }
            myDa.Dispose();
            myDs.Dispose();
            myConn.Close();
            return result;
        }
        public static int Register(string user_name, string psw, string realname, string phone, string email) {
            int result = 0;
            
            string str1 = "select * from [user] where user_name = '" + user_name+ "'";

            DataSet myDs = new DataSet();
            SqlConnection myConn = DBclass.GetConnection();
            SqlDataAdapter myDa = new SqlDataAdapter(str1, myConn);
            myConn.Open();
            myDa.Fill(myDs);

            if (myDs.Tables[0].Rows.Count > 0)
            {
                result=-1;
            }
            else
            {
                string str2 = "insert into [user](user_name,psw,realname,phone,email) values('"
                    + user_name+ "','" + psw + "','" + realname + "','" +phone
                    + "','" + email + "')";
                SqlCommand myCmd = new SqlCommand(str2, myConn);
                if (myCmd.ExecuteNonQuery() > 0)
                {
                    result = 1;
                }

            }
            myDa.Dispose();
            myDs.Dispose();
            myConn.Close();
            return result;
        }
    }
}
