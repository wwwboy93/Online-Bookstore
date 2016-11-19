using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace 在线书店
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Redirect("./index.aspx");
                /**string str1 = "select * from [book]";
                DataSet myDs = new DataSet();
                SqlConnection sqlcon = GetConnection();
                SqlDataAdapter myDa = new SqlDataAdapter(str1, sqlcon);
                sqlcon.Open();
                myDa.Fill(myDs);
                this.ListView_Products.DataSource = myDs;
                DataBind();

                sqlcon.Close();
                Session["user_id"] = 3;
                Session["user_name"] = "www.boy";
                Session.Timeout=40;*/
            }
        }

        public SqlConnection GetConnection()
        {
            string str = "Server=(local);User Id=sa;Pwd=123123;Database=bookstore";
            SqlConnection con = new SqlConnection(str);
            return con;
        }




        public void AddShopCart(ListViewCommandEventArgs e)
        {
            Hashtable hashCar;

            /**if (Session["user_id"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {**/

            if (Session["ShopCart"] == null)
            {
                //如果用户没有分配购物车
                hashCar = new Hashtable();         //新生成一个
                hashCar.Add(e.CommandArgument, 1); //添加一个商品
                Session["ShopCart"] = hashCar;     //分配给用户
            }
            else
            {
                //用户已经有购物车
                hashCar = (Hashtable)Session["ShopCart"];//得到购物车的hash表
                if (hashCar.Contains(e.CommandArgument))//购物车中已有此商品，商品数量加1
                {
                    int count = Convert.ToInt32(hashCar[e.CommandArgument].ToString());//得到该商品的数量
                    hashCar[e.CommandArgument] = (count + 1);//商品数量加1
                }
                else
                {
                    hashCar.Add(e.CommandArgument, 1);
                }//如果没有此商品，则新添加一个项
            }


        }


        protected void ListView_Products_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "buy")
            {
                this.AddShopCart(e);
            }
        }
    }
}