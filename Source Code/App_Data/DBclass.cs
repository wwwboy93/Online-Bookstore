using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
//用于管理在项目中的对数据库的各种操作，包括GetConnection方法
//ExecNonQuery，ExecScalar,GetDataSet,GetCommandProc

namespace myDB
{
    public class DBclass
    {
        //获得数据库的链接
        public static SqlConnection GetConnection()
        {//用于获得一个数据库的链接，是其他操作的基础.
            string sqlstr = "Server=(local);User Id=sa;Pwd=123123; DataBase=bookstore";
            SqlConnection con = new SqlConnection(sqlstr);
            return con;
        }

       

        //执行sql语句，并且返回受影响的行数。
        public int ExecNonQuery(SqlCommand myCmd)
        {
            int affectrow = 0;
            try
            {
                if (myCmd.Connection.State != ConnectionState.Open)
                {
                    myCmd.Connection.Open();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }
            finally
            {
                if (myCmd.Connection.State == ConnectionState.Open)
                {
                    myCmd.Connection.Close();
                }
            }
            affectrow = 1;
            return affectrow;

        }

        //返回查询结果第一行第一列的值
        

        //从数据库中检所数据，返回数据集的集合
        public static DataTable GetDataSet(SqlCommand myCmd, string TableName)
        {
            SqlDataAdapter adapt;
            DataSet ds = new DataSet();
            try
            {
                if (myCmd.Connection.State != ConnectionState.Open)
                {
                    myCmd.Connection.Open();
                }
                adapt = new SqlDataAdapter(myCmd);
                adapt.Fill(ds, TableName);
                return ds.Tables[TableName];

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex);

            }
            finally
            {
                if (myCmd.Connection.State == ConnectionState.Open)
                {
                    myCmd.Connection.Close();
                }
            }
        }

      
    }
}