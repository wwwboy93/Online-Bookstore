using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using mybook;
using myDB;
using System.Text;

namespace 在线书店
{
    public partial class buy : System.Web.UI.Page
    {


        float totalPrice = 0; //商品总价格
        int user_id = 0;
        string user_name;
        DataTable dtTable;
        string Order_Num;
        public string nameShow
        {
            get
            {
                return user_name;
            }
        }






        protected void Page_Load(object sender, EventArgs e)
        {
            OrderBind();
            if (Session["user_id"] == null)
            {
                this.Label1.Text = "您还没有登录！"; //显示提示信息
                this.Label1.Visible = true;
                this.p_price.Visible = false;
                this.ButtonBuy.Visible = false;
                return;
            }
            else
            {
                user_name = Session["user_name"].ToString();



                if (Session["ShopCart"] == null)
                {
                    //如果没有购物，则给出相应信息，并隐藏按钮
                    this.Label1.Text = "您还没有购物"; //显示提示信息
                    this.Label1.Visible = true;
                    this.p_price.Visible = false;
                    this.ButtonBuy.Visible = false;
                }
                else
                {
                    Hashtable hashCar = (Hashtable)Session["ShopCart"];  //获取其购物车
                    user_id = Convert.ToInt32(Session["user_id"]);

                    if (hashCar.Count == 0)
                    {
                        //如果没有购物，则给出相应信息，并隐藏按钮
                        this.Label1.Text = "购物车为空";//显示提示信息
                        this.Label1.Visible = true;
                        this.p_price.Visible = false;
                        this.ButtonBuy.Visible = false;

                    }
                    else
                    {
                        //设置购物车内容的数据源
                        dtTable = new DataTable();
                        DataColumn column1 = new DataColumn("No");//序号列
                        DataColumn column2 = new DataColumn("BookID");    //书籍ID代号
                        DataColumn column3 = new DataColumn("BookName");  //书籍名称
                        DataColumn column4 = new DataColumn("Num");       //数量
                        DataColumn column5 = new DataColumn("price");     //单价
                        DataColumn column6 = new DataColumn("totalPrice");//总价
                        DataColumn column7 = new DataColumn("discount");//折扣
                        DataColumn column8 = new DataColumn("price_after");//折扣后价格
                        DataColumn column9 = new DataColumn("img");//url
                        dtTable.Columns.Add(column1);//添加新列
                        dtTable.Columns.Add(column2);
                        dtTable.Columns.Add(column3);
                        dtTable.Columns.Add(column4);
                        dtTable.Columns.Add(column5);
                        dtTable.Columns.Add(column7);
                        dtTable.Columns.Add(column8);
                        dtTable.Columns.Add(column6);
                        dtTable.Columns.Add(column9);
                        DataRow row;
                        //对数据表中每一行进行遍历，给每一行的新列赋值
                        foreach (object key in hashCar.Keys)
                        {
                            row = dtTable.NewRow();
                            row["BookID"] = key.ToString();        //商品ID
                            row["Num"] = hashCar[key].ToString();  //商品数量        
                            dtTable.Rows.Add(row);
                        }
                        //计算价格
                        DataTable dstable;
                        int i = 1;
                        float price; //商品单价
                        int num;     //商品数量
                        float discount;

                        int totailNum = 0;    //商品总数量
                        foreach (DataRow drRow in dtTable.Rows)
                        {

                            dstable = Book.GetBook(Convert.ToInt32(drRow["BookID"].ToString()));
                            drRow["No"] = i;
                            string url = dstable.Rows[0]["imgurl"].ToString();//图片的地址路径
                            drRow["img"] = url;
                            string BookNameURL =
                               "<a style=\" text-decoration: none; color: #444;\" href='./detail?id=" + drRow["BookID"] + "'>" +
                               dstable.Rows[0]["book_name"].ToString() + "</a>";
                            drRow["BookName"] = dstable.Rows[0]["book_name"].ToString();   //书籍名称
                            drRow["price"] = Convert.ToDouble(dstable.Rows[0]["price"].ToString()).ToString("0.00");      //书籍单价
                            price = (float)Convert.ToDouble(dstable.Rows[0]["price"]);
                            drRow["discount"] = Convert.ToDouble(dstable.Rows[0]["discount"]) / 10;
                            discount = (float)Convert.ToDouble((dstable.Rows[0]["discount"].ToString())) / 100;
                            num = Int32.Parse(drRow["Num"].ToString());
                            drRow["price_after"] = (price * discount).ToString("0.00");
                            drRow["totalPrice"] = (price * num * discount).ToString("0.00");                   //小价
                            totalPrice += price * num * discount;                          //计算合价
                            totailNum += num;                                   //计算商品总数
                            i++;
                        }
                        this.labTotalPrice.Text = totalPrice.ToString("0.00");       //显示所有商品的价格

                        this.gvShopCart.DataSource = dtTable.DefaultView;      //绑定GridView控件
                        this.gvShopCart.DataBind();
                    }


                }
            }
        }


        public void OrderBind()
        {
            string str2 = "select top 7 * from[book] order by visit desc";
            SqlConnection sqlcon = DBclass.GetConnection();
            sqlcon.Open();
            
            SqlDataAdapter myDa = new SqlDataAdapter(str2, sqlcon);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs);
            this.Orderview.DataSource = myDs;
            this.Orderview.DataBind();
            sqlcon.Close();
        }

        protected void booklink_Click(object sender, EventArgs e)
        {
            string id = ((LinkButton)sender).CommandArgument;
            Response.Redirect("~/details.aspx?bookid=" + id);
        }


        protected void lnkBtnDetail_Click(object sender, EventArgs e)//跳转
        {
            string id = ((LinkButton)sender).CommandArgument;
            Response.Redirect("./detail?id=" + id);
        }

        protected void Del_Click(object sender, EventArgs e)//删除操作
        {
            string id = ((LinkButton)sender).CommandArgument;

            Hashtable hashCar = (Hashtable)Session["ShopCart"];

            hashCar.Remove(id);
            Session["ShopCart"] = hashCar;
            Session.Timeout = 4000;
            Response.Redirect("buy.aspx");
        }


        protected void ButtonBuy_Click(object sender, EventArgs e)//支付操作
        {
            Hashtable hashCar = (Hashtable)Session["ShopCart"];
            if (hashCar.Count != 0)
            {
                CreateOrder();
                Response.Redirect("./unpaid.aspx?id=" + Order_Num);
            }
        }

        #region


        //产生订单的函数
        private void CreateOrder()
        {

            SqlConnection myConn = DBclass.GetConnection();
            myConn.Open();

            SqlTransaction myTrans = myConn.BeginTransaction();//新建一个事务处理


            SqlCommand myCmd = new SqlCommand();

            myCmd.Connection = myConn;
            myCmd.Transaction = myTrans;//设置命令的事务
            try
            {
                //先在order表中进行插入一个
                string now = DateTime.Now.ToString();
                string random_order_id = generateOid();
                Order_Num = random_order_id;
                string sqlStr = "insert into [order](order_id,user_id,date,totalmoney,isactive,ispayment) values('"
                    + random_order_id + "','"//order_id
                    + user_id + "','"//user_id
                    + now + "','"//date
                    + totalPrice + "',1,0)";//ispayment

                myCmd.CommandText = sqlStr;
                myCmd.ExecuteNonQuery();

                foreach (DataRow drRow in dtTable.Rows)
                {

                    float price = (float)Convert.ToDouble(drRow["totalPrice"]);
                    sqlStr = "insert into [bookinorder](order_id,book_id,singleprice,number) values('"
              + random_order_id + "','"
                + drRow["BookID"] + "',"
                + price + ",'"
              + drRow["Num"] + "')";

                    myCmd.CommandText = sqlStr;
                    myCmd.ExecuteNonQuery();

                    sqlStr = "update [book] set stock = stock-" + Convert.ToInt32(drRow["Num"]) + "where book_id='" + drRow["BookID"] + "'";
                    myCmd.CommandText = sqlStr;
                    myCmd.ExecuteNonQuery();

                }
                myTrans.Commit();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                myTrans.Rollback();
            }

            finally
            {
                myConn.Close();
            }

        }



        private string generateOid()//用来产生随机编号的函数
        {
            string oid;
            //17位订单号  
            StringBuilder sbNumber = new StringBuilder();
            sbNumber.Append(DateTime.Now.Year.ToString());//4  
            sbNumber.Append(DateTime.Now.Month.ToString().Length == 1 ? "0" + DateTime.Now.Month.ToString() : DateTime.Now.Month.ToString());//2  
            sbNumber.Append(DateTime.Now.Day.ToString().Length == 1 ? "0" + DateTime.Now.Day.ToString() : DateTime.Now.Day.ToString());//2  
            sbNumber.Append(DateTime.Now.Hour.ToString().Length == 1 ? "0" + DateTime.Now.Hour.ToString() : DateTime.Now.Hour.ToString());//2  
            sbNumber.Append(DateTime.Now.Minute.ToString().Length == 1 ? "0" + DateTime.Now.Minute.ToString() : DateTime.Now.Minute.ToString());//2  
            sbNumber.Append(DateTime.Now.Second.ToString().Length == 1 ? "0" + DateTime.Now.Second.ToString() : DateTime.Now.Second.ToString());//2  
            if (DateTime.Now.Millisecond.ToString().Length == 1)//3  
            {
                sbNumber.Append("00" + DateTime.Now.Millisecond.ToString());
            }
            else if (DateTime.Now.Millisecond.ToString().Length == 2)
            {
                sbNumber.Append("0" + DateTime.Now.Millisecond.ToString());
            }
            else
            {
                sbNumber.Append(DateTime.Now.Millisecond.ToString());
            }
            //检查订单号是否在数据库中存在  
            while (isExist(sbNumber.ToString()))//方法返回True，证明在数据库中存在。则重新排序  
            {
                //若存在，重新对这个订单号排序  
                ArrayList repeatArr = new ArrayList();
                for (int i = 0; i < sbNumber.ToString().Length; i++)
                {
                    repeatArr.Add(sbNumber.ToString().Substring(i, 1));
                }
                //清空StringBuilder  
                sbNumber.Remove(0, sbNumber.Length);
                Random re = new Random();
                //对17位订单号随机排序  
                for (int i = 0; i < repeatArr.Count; i++)
                {
                    int ex = re.Next(1, 17);
                    sbNumber.Append(repeatArr[ex].ToString());
                }
            }
            //返回不重复的字串  
            oid = sbNumber.ToString();
            return oid;
        }

        private bool isExist(string input)
        {//判断产生的随机函数是否重复
            bool result = false;

            SqlConnection myConn = DBclass.GetConnection();
            string sqlstr = "select * from [order] where order_id='" + input + "'";
            SqlCommand myCmd = new SqlCommand(sqlstr, myConn);
            SqlDataAdapter myDa = new SqlDataAdapter(myCmd);
            DataSet myDs = new DataSet();
            myDa.Fill(myDs);
            if (myDs.Tables[0].Rows.Count > 0)//登录成功
            {
                result = true;
            }
            myDa.Dispose();
            myDs.Dispose();
            myConn.Close();
            return result;

        }
        #endregion
        protected void ButtonAdd_Click(object sender, EventArgs e)//增加
        {

            string id = ((Button)sender).CommandArgument;

            Hashtable hashCar = (Hashtable)Session["ShopCart"];
            int Num = Convert.ToInt32(hashCar[id].ToString());
            hashCar[id] = Num + 1;
            Session["ShopCart"] = hashCar;
            Response.Redirect("buy.aspx");
        }

        protected void ButtonMin_Click(object sender, EventArgs e)//减少
        {
            string id = ((Button)sender).CommandArgument;

            Hashtable hashCar = (Hashtable)Session["ShopCart"];
            int Num = Convert.ToInt32(hashCar[id].ToString());
            if (Num == 1) return;
            hashCar[id] = Num - 1;
            Session["ShopCart"] = hashCar;
            Response.Redirect("buy.aspx");
        }
    }
}