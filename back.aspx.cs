/** 
 * 退订单页面，
 * 主要是实现未支付订单的退单功能，可以将书籍退回到库存当中。
 * 
 * 
 * **/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using myDB;
using System.Data;
namespace 在线书店
{
    public partial class back : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["id"] == null || Session["user_id"] == null)
            {
                
                Response.Redirect("./register.aspx");
                return;
            }

            string OrderID = Request["id"].ToString();

            SqlConnection myConn = DBclass.GetConnection();
            myConn.Open();

            SqlTransaction myTrans = myConn.BeginTransaction();//新建一个事务处理


            SqlCommand myCmd = new SqlCommand();

            myCmd.Connection = myConn;
            myCmd.Transaction = myTrans;//设置命令的事务
            try
            {
                //先在order表中进行更新

                string sqlStr = "update [order] set isactive=0 where order_id='" + OrderID + "'"; ;

                myCmd.CommandText = sqlStr;
                myCmd.ExecuteNonQuery();
                Response.Write("here0<br>");
                sqlStr = "select * from [bookinorder] where order_id='" + OrderID + "'";
                Response.Write(sqlStr);

                myCmd.CommandText=sqlStr;
                SqlDataAdapter myDa = new SqlDataAdapter(myCmd);
                DataSet myDs = new DataSet();
                myDa.Fill(myDs);

                DataTable dtTable = myDs.Tables[0];
                Response.Write("here3<br>");
                int book_id;
                int book_num;
                //对order中的每一本书进行还到库中
                foreach (DataRow drRow in dtTable.Rows)
                {

                    book_id = Convert.ToInt32(drRow["book_id"].ToString());
                    book_num=Convert.ToInt32(drRow["number"].ToString());
                    sqlStr = "update [book] set stock = stock+"+book_num+" where book_id='"+book_id+"'";
                    Response.Write(sqlStr+"<br>");
                    myCmd.CommandText = sqlStr;
                    myCmd.ExecuteNonQuery();
                    Response.Write("here1");

               
                }
                myTrans.Commit();
                Response.Write("here2");

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                myTrans.Rollback();
            }

            finally
            {
                myConn.Close();
                Response.Redirect("./orders.aspx");
            }



        }
    }
}