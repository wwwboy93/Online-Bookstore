using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using myDB;
namespace 在线书店
{
    public class Category
    {

        public static DataTable GetCategory()//验证登录,登录成功返回用户id,失败返回0
        {
            SqlConnection myConn = DBclass.GetConnection();
            string sqlstr = "select top 6 * from [category]";
            myConn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapt = new SqlDataAdapter(sqlstr, myConn);
            adapt.Fill(ds);
            myConn.Close();
            return ds.Tables[0];
        }
    }
   
}