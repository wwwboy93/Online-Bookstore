using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using myDB;

/// <summary>
/// Order 的摘要说明
/// </summary>
namespace OrderDB
{
    public class Order
    {
        public Order()
        {

        }
        public static DataTable GetOrder(int user_id)//验证登录,登录成功返回用户id,失败返回0
        {
            SqlConnection myConn = DBclass.GetConnection();
            string sqlstr = "select * from [order] where user_id=" + user_id;
            myConn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapt = new SqlDataAdapter(sqlstr, myConn);
            adapt.Fill(ds);
            myConn.Close();
            return ds.Tables[0];
        }
    }
}