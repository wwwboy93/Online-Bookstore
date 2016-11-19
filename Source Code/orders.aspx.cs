using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using OrderDB;
using myDB;
using System.Text;

namespace 在线书店
{
    public partial class orders : System.Web.UI.Page
    {
        string user_name="";

        public string strShow
        {
            get
            {
                return "("+user_name+")";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
             

            if (Session["user_id"] == null)
            {
                this.Label1.Text = "您还没有登录！"; //显示提示信息
                return;
            }
            

            user_name = Session["user_name"].ToString();
            int user_id = Convert.ToInt32(Session["user_id"]);
            DataTable dstable = new DataTable();//查询用户订单
            dstable = Order.GetOrder(user_id);


            //设置购物车内容的数据源
            DataTable dtTable = new DataTable();
            DataColumn column1 = new DataColumn("order_id");//订单号
            DataColumn column2 = new DataColumn("ispaid");    //是否已经支付
            DataColumn column3 = new DataColumn("totalmoney");  //总价
            DataColumn column4 = new DataColumn("check");       //check
            DataColumn column5 = new DataColumn("num");       //列数
            dtTable.Columns.Add(column1);//添加新列
            dtTable.Columns.Add(column2);
            dtTable.Columns.Add(column3);
            dtTable.Columns.Add(column4);
            dtTable.Columns.Add(column5);

            //对数据表中每一行进行遍历，给每一行的新列赋值
            DataRow row;
            int i = 1;
            foreach (DataRow drRow in dstable.Rows)
            {
                row = dtTable.NewRow();
                row["num"] = i;
                row["order_id"] = drRow["order_id"].ToString();   //订单编号

                row["totalmoney"] = Convert.ToDouble(drRow["totalmoney"].ToString()).ToString("0.00");   //订单总价
                //row["check"] = drRow["order_id"].ToString() + "&" + drRow["ispayment"].ToString();//订单号和订单状态01
                if (drRow["isactive"].ToString().Equals("1"))//表明订单有效
                {
                    if (drRow["ispayment"].ToString().Equals("0"))
                    {
                        row["ispaid"] = "未支付";      //是否已经付款
                        row["check"] =
                         "<a class=\"buybotton\" href=\"unpaid.aspx?id=" + row["order_id"] + "\">立即支付</a>" +
                         "<a class=\"buybotton\" href=\"back.aspx?id=" + row["order_id"] + "\">退单</a>";
                    }
                    else
                    {
                        row["ispaid"] = "已支付";      //是否已经付款
                        row["check"] = "<a class=\"checkbotton\" href=\"paid.aspx?id=" + row["order_id"] + "\">查看</a>";
                    }
                }
                else
                {
                    row["ispaid"] = "已失效";
                    row["check"] = "<a class=\"checkbotton\">订单已失效</a>";
                }
                dtTable.Rows.Add(row);
            }
            //显示商品总数
            this.ListView_Order.DataSource = dtTable.DefaultView;      //绑定GridView控件
            if(!IsPostBack)
                Page.DataBind();
            
        }
        
        protected void booklink_Click(object sender, EventArgs e)
        {
            string id = ((LinkButton)sender).CommandArgument;
            Response.Redirect("~/details.aspx?bookid=" + id);
        }


        /**protected void ListView_Order_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                string args = e.CommandArgument.ToString();
                string[] result = args.Split('&');
                string order_id = result[0];
                int state = Convert.ToInt32(result[1]);
                Response.Redirect("./order_detail?id=" + order_id + "&state=" + state);
            }
            if (e.CommandName == "buy")
            {
                Response.Redirect("./order_detail?state=1&id=" + e.CommandArgument.ToString());
            }
            if (e.CommandName == "back")
            {

            }
        }*/
    }
}