using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using myDB;
/// <summary>
/// Book 的摘要说明
/// </summary>
namespace mybook{
    public class Book
{

        public Book()
        { 
        }
		 public static DataTable GetBook(int id)//验证登录,登录成功返回用户id,失败返回0
        {
            SqlConnection myConn = DBclass.GetConnection();
            string sqlstr="select * from [book] where book_id="+id;
            myConn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapt = new SqlDataAdapter(sqlstr, myConn);
            adapt.Fill(ds);
            myConn.Close();
            return ds.Tables[0];
        }
	}

}


